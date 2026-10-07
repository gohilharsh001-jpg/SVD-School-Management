-- Hall Ticket System - Supabase Free schema
-- Run this once in Supabase SQL Editor.

create extension if not exists pgcrypto;

create table if not exists public.school_state (
  id uuid primary key default gen_random_uuid(),
  school_key text not null unique,
  owner_id uuid not null references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.school_state enable row level security;

drop policy if exists "school_state_owner_select" on public.school_state;
drop policy if exists "school_state_owner_insert" on public.school_state;
drop policy if exists "school_state_owner_update" on public.school_state;
drop policy if exists "school_state_owner_delete" on public.school_state;

create policy "school_state_owner_select" on public.school_state
  for select to authenticated using (owner_id = auth.uid());
create policy "school_state_owner_insert" on public.school_state
  for insert to authenticated with check (owner_id = auth.uid());
create policy "school_state_owner_update" on public.school_state
  for update to authenticated using (owner_id = auth.uid()) with check (owner_id = auth.uid());
create policy "school_state_owner_delete" on public.school_state
  for delete to authenticated using (owner_id = auth.uid());

-- Public student portal: returns only the student's portal-safe data.
-- It does NOT expose fees, bus fees, full student database, admin password, etc.
create or replace function public.get_student_portal(p_school_key text, p_cts_id text)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  state_data jsonb;
  st jsonb;
  school_data jsonb;
  exams_data jsonb;
  rooms_data jsonb;
  results_data jsonb;
  safe_customize jsonb;
begin
  select data into state_data
  from public.school_state
  where school_key = trim(p_school_key)
  limit 1;

  if state_data is null then
    return jsonb_build_object('ok',false,'message','School not found');
  end if;

  select elem into st
  from jsonb_array_elements(coalesce(state_data->'students','[]'::jsonb)) elem
  where lower(coalesce(elem->>'ctsId','')) = lower(trim(p_cts_id))
    and coalesce(elem->>'status','Active') <> 'Inactive'
  limit 1;

  if st is null then
    return jsonb_build_object('ok',false,'message','Student not found');
  end if;

  school_data := coalesce(state_data->'school','{}'::jsonb);
  exams_data := coalesce(state_data->'exams','[]'::jsonb);
  rooms_data := coalesce(state_data->'rooms','[]'::jsonb);
  results_data := coalesce(state_data->'results','{}'::jsonb);
  safe_customize := jsonb_build_object(
    'logo', coalesce(state_data->'customize'->'logo',null),
    'showQR', coalesce(state_data->'customize'->'showQR',true),
    'principal', coalesce(state_data->'customize'->'principal','Principal'),
    'scheduleTitle', coalesce(state_data->'customize'->'scheduleTitle','EXAM SCHEDULE')
  );

  return jsonb_build_object(
    'ok',true,
    'school',school_data,
    'student',jsonb_build_object(
      'id',st->>'id','name',st->>'name','std',st->>'std','div',st->>'div',
      'roll',st->>'roll','gr',st->>'gr','ctsId',st->>'ctsId','photo',st->>'photo'
    ),
    'exams',exams_data,
    'rooms',rooms_data,
    'results',results_data,
    'customize',safe_customize
  );
end;
$$;

grant execute on function public.get_student_portal(text,text) to anon, authenticated;

-- Recommended: in Supabase Auth, create the school's admin user manually.
-- Then use that email/password in the Online Sync screen of the app.
