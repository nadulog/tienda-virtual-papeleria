import React from 'react';import{createRoot}from'react-dom/client';import App from'./App';import'./styles.css';import'./admin-link.css';
document.addEventListener('wheel',e=>{if(e.target instanceof HTMLInputElement&&e.target.type==='number'){e.preventDefault();e.target.blur()}},{capture:true,passive:false});
createRoot(document.getElementById('root')).render(<React.StrictMode><App/></React.StrictMode>);
