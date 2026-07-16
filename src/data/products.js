const base={descripcionCompleta:'Una pieza creada especialmente para tu evento, respetando su estilo, paleta y personalidad.',imagenes:['placeholder-1','placeholder-2','placeholder-3'],formatoEntrega:'PDF en alta calidad listo para imprimir',correccionesIncluidas:2,tiempoDiseno:'7 a 10 días hábiles',destacado:false,activo:true};
const items=[
['cartel-bienvenida','Cartel de bienvenida','La primera impresión de tu celebración.',18500,'bodas','50 × 70 cm'],
['menu-individual','Menú individual','Cada detalle, servido con intención.',9800,'bodas','10 × 21 cm'],
['menu-mesa','Menú por mesa','Una pieza compartida para cada mesa.',11200,'sociales','15 × 21 cm'],
['numero-mesa','Número de mesa','Guía a tus invitados con estilo.',7900,'bodas','10 × 15 cm'],
['tarjeta-nombre','Tarjeta con nombre','Un lugar pensado para cada persona.',8500,'bodas','9 × 5 cm'],
['agradecimiento','Tarjeta de agradecimiento','Un gesto pequeño que queda para siempre.',8200,'sociales','10 × 7 cm'],
['faja-servilleta','Faja para servilleta','Un detalle que completa la mesa.',7600,'bodas','Variable'],
['porta-cubiertos','Porta cubiertos','Presentación delicada y funcional.',8900,'sociales','Variable'],
['triptico-qr','Tríptico de mesa con QR','Información y recuerdos en una sola pieza.',14500,'sociales','10 × 21 cm cerrado'],
['etiquetas','Etiquetas para souvenirs','El toque final para tus regalos.',9200,'sociales','A medida'],
['stickers','Stickers personalizados','Tu identidad en cada detalle.',7600,'cumpleanos','A medida'],
['carteles-sectores','Carteles para sectores','Orientación integrada a la ambientación.',12800,'corporativos','A medida'],
['mesa-dulce','Cartel para mesa dulce','Una señal especial para el rincón más rico.',8800,'cumpleanos','A4 o A3'],
['regalos','Cartel para regalos','Una indicación cuidada y clara.',8200,'bodas','A4'],
['libro-firmas','Cartel para libro de firmas','Invitá a dejar palabras para recordar.',8200,'bodas','A4'],
['ceremonia-velas','Tarjetas para ceremonia de velas','Palabras que acompañan un momento único.',11500,'quince','10 × 15 cm'],
['votos','Tarjetas para votos','Un marco íntimo para tus promesas.',10500,'bodas','A5'],
['amenities','Kit de amenities para baño','Todo el set visual para cuidar a tus invitados.',24500,'amenities','Formatos variados']];
export const categories=[['bodas','Bodas'],['quince','Cumpleaños de 15'],['cumpleanos','Cumpleaños'],['sociales','Eventos sociales'],['corporativos','Corporativos'],['amenities','Amenities']];
export const products=items.map((x,i)=>({...base,id:x[0],nombre:x[1],descripcionCorta:x[2],precio:x[3],categoria:x[4],medidas:x[5],categoriasCompatibles:i%3===0?['Bodas','15 años','Eventos sociales']:['Bodas','Eventos sociales'],incluye:['Diseño personalizado','Archivo final listo para imprimir','Asesoramiento de formato'],destacado:i<4}));
