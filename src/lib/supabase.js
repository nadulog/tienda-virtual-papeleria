import{createClient}from'@supabase/supabase-js';
const url=import.meta.env.VITE_SUPABASE_URL||'https://cwzebrxswqutvunxykhz.supabase.co';
const key=import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY||'sb_publishable_zpM9Ga3SOHKTXtOFQtorNg_VjmuO8Ie';
export const supabase=createClient(url,key);
