-- MLink Invoices: shared database setup for Supabase.
-- Run once in Supabase: SQL Editor > New query > paste > Run.

create table if not exists public.invoices (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.settings (
  id text primary key,
  data jsonb not null
);

-- Only signed-in team members can read or change anything.
alter table public.invoices enable row level security;
alter table public.settings enable row level security;

drop policy if exists "team can do everything" on public.invoices;
create policy "team can do everything" on public.invoices
  for all to authenticated using (true) with check (true);

drop policy if exists "team can do everything" on public.settings;
create policy "team can do everything" on public.settings
  for all to authenticated using (true) with check (true);

-- Live updates, so everyone sees new invoices without refreshing.
alter table public.invoices replica identity full;
do $$ begin
  alter publication supabase_realtime add table public.invoices, public.settings;
exception when duplicate_object then null; end $$;
