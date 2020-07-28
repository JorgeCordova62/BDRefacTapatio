### Detalles de las tablas

| Ventas   |          |      |      |         |
| -------- | -------- | ---- | ---- | ------- |
| Field    | Type     | Null | Key  | Default |
| idVentas | int      | NO   | PRI  | NULL    |
| Cliente  | int      | NO   | MUL  | NULL    |
| Monto    | float    | NO   |      | NULL    |
| Credito  | tinyint  | NO   |      | 0       |
| Fecha    | datetime | NO   |      | NULL    |
| Sucursal | int      | NO   |      | NULL    |

| VentasProductos |         |      |      |         |
| --------------- | ------- | ---- | ---- | ------- |
| Field           | Type    | Null | Key  | Default |
| idVenta         | int     | NO   | PRI  | NULL    |
| idProductos     | int     | NO   | MUL  | NULL    |
| Cantidad        | float   | NO   |      | NULL    |
| Status          | tinyint | NO   |      | 0       |
| PrecioVenta     | float   | NO   |      | NULL    |

| UbicacionAnaqueles   |             |      |      |         |
| -------------------- | ----------- | ---- | ---- | ------- |
| Field                | Type        | Null | Key  | Default |
| idUbicacionAnaqueles | varchar(10) | NO   | PRI  | NULL    |
| Anaquel              | varchar(3)  | NO   |      | NULL    |
| Seccion              | varchar(3)  | NO   |      | NULL    |
| Fila                 | int         | NO   |      | NULL    |
| Sucursal             | int         | NO   | MUL  | NULL    |

| Sucursal   |             |      |      |         |
| ---------- | ----------- | ---- | ---- | ------- |
| Field      | Type        | Null | Key  | Default |
| idSucursal | int         | NO   | PRI  | NULL    |
| Ciudad     | varchar(10) | YES  |      | NULL    |
| Direccion  | varchar(45) | YES  |      | NULL    |
| Encargado  | int         | YES  |      | NULL    |

| Proveedor   |             |      |      |         |
| ----------- | ----------- | ---- | ---- | ------- |
| Field       | Type        | Null | Key  | Default |
| idProveedor | int         | NO   | PRI  | NULL    |
| Nombre      | varchar(30) | NO   |      | NULL    |
| RFC         | varchar(13) | NO   | UNI  | NULL    |
| CorreoE     | varchar(40) | NO   |      | NULL    |
| Telefono    | int         | NO   |      | NULL    |
| Status      | tinyint     | NO   |      | NULL    |

| Productos   |             |      |      |         |
| ----------- | ----------- | ---- | ---- | ------- |
| Field       | Type        | Null | Key  | Default |
| idProductos | int         | NO   | PRI  | NULL    |
| Nombre      | varchar(20) | NO   |      | NULL    |
| Descripcion | text        | NO   |      | NULL    |
| Categoria   | varchar(10) | NO   | MUL  | NULL    |

| inventario   |             |      |      |         |
| ------------ | ----------- | ---- | ---- | ------- |
| Field        | Type        | Null | Key  | Default |
| idInventario | int         | NO   | PRI  | NULL    |
| idProducto   | int         | NO   | MUL  | NULL    |
| idUbicacion  | varchar(10) | NO   | MUL  | NULL    |
| Stock        | float       | NO   |      | NULL    |
| Precio       | float       | NO   |      | NULL    |

| EmpleadoSucursal |      |      |      |         |
| ---------------- | ---- | ---- | ---- | ------- |
| Field            | Type | Null | Key  | Default |
| idEmpleado       | int  | NO   | PRI  | NULL    |
| idSucursal       | int  | NO   | PRI  | NULL    |

| Empleado   |             |      |      |         |
| ---------- | ----------- | ---- | ---- | ------- |
| Field      | Type        | Null | Key  | Default |
| idEmpleado | int         | NO   | PRI  | NULL    |
| Cargo      | varchar(10) | NO   |      | NULL    |
| Sueldo     | float       | NO   |      | NULL    |
| Status     | tinyint     | NO   |      | 0       |

| Compras   |          |      |      |         |
| --------- | -------- | ---- | ---- | ------- |
| Field     | Type     | Null | Key  | Default |
| idCompras | int      | NO   | PRI  | NULL    |
| Proovedor | int      | NO   | MUL  | NULL    |
| Fecha     | datetime | YES  |      | NULL    |
| Monto     | float    | YES  |      | NULL    |
| Status    | tinyint  | YES  |      | NULL    |

| ComprasProductos |         |      |      |         |
| ---------------- | ------- | ---- | ---- | ------- |
| Field            | Type    | Null | Key  | Default |
| idCompra         | int     | NO   | PRI  | NULL    |
| idProducto       | int     | NO   | PRI  | NULL    |
| CantCompra       | int     | NO   |      | NULL    |
| Status           | tinyint | NO   |      | 0       |
| PrecioCompra     | float   | NO   |      | NULL    |

| Clientes    |             |      |      |         |
| ----------- | ----------- | ---- | ---- | ------- |
| Field       | Type        | Null | Key  | Default |
| idClientes  | int         | NO   | PRI  | NULL    |
| Nombre      | varchar(30) | NO   |      | NULL    |
| Apellido    | varchar(30) | NO   |      | NULL    |
| CantCompras | int         | YES  |      | NULL    |
| RFC         | varchar(13) | YES  |      | NULL    |
| CorreoE     | varchar(40) | YES  |      | NULL    |
| Telefono    | int         | YES  |      | NULL    |
| Status      | tinyint     | NO   |      | NULL    |

| Categoria    |             |      |      |         |
| ------------ | ----------- | ---- | ---- | ------- |
| Field        | Type        | Null | Key  | Default |
| idCategoria  | varchar(10) | NO   | PRI  | NULL    |
| SubCategoria | varchar(10) | NO   | PRI  | NULL    |

| ActualizacionPrecio |             |      |      |         |
| ------------------- | ----------- | ---- | ---- | ------- |
| Field               | Type        | Null | Key  | Default |
| idInventario        | int         | NO   | MUL  | NULL    |
| PrecioAnterior      | float       | NO   |      | NULL    |
| PrecioNuevo         | varchar(45) | NO   |      | NULL    |
| FechaModificacion   | datetime    | NO   |      | NULL    |

