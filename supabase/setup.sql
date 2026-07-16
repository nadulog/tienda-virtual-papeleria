-- Ejecutar una sola vez desde Supabase > SQL Editor > New query.
create extension if not exists pgcrypto;

create table if not exists public.products (
  id text primary key,
  nombre text not null,
  descripcion_corta text not null default '',
  descripcion_completa text not null default '',
  precio numeric(12,2) not null default 0 check (precio >= 0),
  categoria text not null default 'sociales',
  categorias_compatibles text[] not null default '{}',
  imagenes text[] not null default '{}',
  medidas text not null default '',
  formato_entrega text not null default 'PDF en alta calidad listo para imprimir',
  correcciones_incluidas integer not null default 2,
  tiempo_diseno text not null default '7 a 10 días hábiles',
  incluye text[] not null default '{}',
  destacado boolean not null default false,
  activo boolean not null default true,
  orden integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.products enable row level security;
create or replace function public.is_bloomdate_admin() returns boolean language sql stable security definer set search_path = public as $$
  select coalesce(auth.jwt() ->> 'email','') = 'logarzonadiagisele@gmail.com';
$$;
drop policy if exists "Productos activos visibles" on public.products;
create policy "Productos activos visibles" on public.products for select using (activo = true or public.is_bloomdate_admin());
drop policy if exists "Administradores crean productos" on public.products;
create policy "Administradores crean productos" on public.products for insert to authenticated with check (public.is_bloomdate_admin());
drop policy if exists "Administradores editan productos" on public.products;
create policy "Administradores editan productos" on public.products for update to authenticated using (public.is_bloomdate_admin()) with check (public.is_bloomdate_admin());
drop policy if exists "Administradores eliminan productos" on public.products;
create policy "Administradores eliminan productos" on public.products for delete to authenticated using (public.is_bloomdate_admin());

insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('product-images','product-images',true,6291456,array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public=true;

drop policy if exists "Imágenes públicas" on storage.objects;
create policy "Imágenes públicas" on storage.objects for select using (bucket_id='product-images');
drop policy if exists "Administradores suben imágenes" on storage.objects;
create policy "Administradores suben imágenes" on storage.objects for insert to authenticated with check (bucket_id='product-images' and public.is_bloomdate_admin());
drop policy if exists "Administradores actualizan imágenes" on storage.objects;
create policy "Administradores actualizan imágenes" on storage.objects for update to authenticated using (bucket_id='product-images' and public.is_bloomdate_admin());
drop policy if exists "Administradores eliminan imágenes" on storage.objects;
create policy "Administradores eliminan imágenes" on storage.objects for delete to authenticated using (bucket_id='product-images' and public.is_bloomdate_admin());

create or replace function public.set_updated_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;
drop trigger if exists products_updated_at on public.products;
create trigger products_updated_at before update on public.products for each row execute function public.set_updated_at();
