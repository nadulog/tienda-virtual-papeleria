import{categories}from'../data/products';
export default function Categories({active,setActive}){return <div className="categories" aria-label="Filtros de catálogo">{categories.map(([id,label])=><button className={active===id?'active':''} onClick={()=>setActive(active===id?'destacados':id)} key={id}>{label}</button>)}</div>}
