-- Loss : table de synchronisation. À coller dans Supabase > SQL Editor > New query, puis "Run".
create table if not exists public.loss_state (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.loss_state enable row level security;
-- chacun ne voit et ne modifie que ses propres données
create policy "loss lecture perso" on public.loss_state for select using (auth.uid() = user_id);
create policy "loss ajout perso" on public.loss_state for insert with check (auth.uid() = user_id);
create policy "loss modif perso" on public.loss_state for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
