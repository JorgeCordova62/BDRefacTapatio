

### Diagrama UML

![UMLBDTapatio.png](https://github.com/JorgeCordova62/BDRefacTapatio/blob/develop/UMLBDTapatio.png?raw=true)



### Detalles de las tablas

| Venta    |          |      |      |         |                      |
| -------- | -------- | ---- | ---- | ------- | -------------------- |
| Field    | Type     | Null | Key  | Default | References           |
| idVenta  | int      | NO   | PRI  | NULL    |                      |
| Cliente  | int      | NO   | MUL  | NULL    | Cliente(idCliente)   |
| Monto    | float    | NO   |      | NULL    |                      |
| Credito  | tinyint  | NO   |      | 0       |                      |
| Fecha    | datetime | NO   |      | NULL    |                      |
| Sucursal | int      | NO   | MUL  | NULL    | Sucursal(idSucursal) |

| VentaProducto |         |      |      |         |                      |
| ------------- | ------- | ---- | ---- | ------- | -------------------- |
| Field         | Type    | Null | Key  | Default | References           |
| idVenta       | int     | NO   | PRI  | NULL    | Venta(idVenta)       |
| idProducto    | int     | NO   | MUL  | NULL    | Producto(idProducto) |
| Cantidad      | float   | NO   |      | NULL    |                      |
| Status        | tinyint | NO   |      | 0       |                      |
| PrecioVenta   | float   | NO   |      | NULL    |                      |

| UbicacionEnAnaquel  |             |      |      |         |                      |
| ------------------- | ----------- | ---- | ---- | ------- | -------------------- |
| Field               | Type        | Null | Key  | Default | References           |
| idUbicacionAnaquele | varchar(10) | NO   | PRI  | NULL    |                      |
| Anaquel             | varchar(3)  | NO   |      | NULL    |                      |
| Seccion             | varchar(3)  | NO   |      | NULL    |                      |
| Fila                | int         | NO   |      | NULL    |                      |
| Sucursal            | int         | NO   | MUL  | NULL    | Sucursal(idSucursal) |

| Sucursal   |             |      |      |         |            |
| ---------- | ----------- | ---- | ---- | ------- | ---------- |
| Field      | Type        | Null | Key  | Default | References |
| idSucursal | int         | NO   | PRI  | NULL    |            |
| Ciudad     | varchar(10) | YES  |      | NULL    |            |
| Direccion  | varchar(45) | YES  |      | NULL    |            |

| Proveedor   |             |      |      |         |            |
| ----------- | ----------- | ---- | ---- | ------- | ---------- |
| Field       | Type        | Null | Key  | Default | References |
| idProveedor | int         | NO   | PRI  | NULL    |            |
| Nombre      | varchar(30) | NO   |      | NULL    |            |
| RFC         | varchar(13) | NO   | UNI  | NULL    |            |
| CorreoE     | varchar(40) | NO   |      | NULL    |            |
| Telefono    | int         | NO   |      | NULL    |            |
| Status      | tinyint     | NO   |      | NULL    |            |

| Producto    |             |      |      |         |                        |
| ----------- | ----------- | ---- | ---- | ------- | ---------------------- |
| Field       | Type        | Null | Key  | Default | References             |
| idProducto  | int         | NO   | PRI  | NULL    |                        |
| Nombre      | varchar(20) | NO   |      | NULL    |                        |
| Descripcion | text        | NO   |      | NULL    |                        |
| Categoria   | varchar(10) | NO   | MUL  | NULL    | Categoria(idCategoria) |

| inventario   |             |      |      |         |                                        |
| ------------ | ----------- | ---- | ---- | ------- | -------------------------------------- |
| Field        | Type        | Null | Key  | Default | References                             |
| idInventario | int         | NO   | PRI  | NULL    |                                        |
| idProducto   | int         | NO   | MUL  | NULL    | Producto(idProductos)                  |
| idUbicacion  | varchar(10) | NO   | MUL  | NULL    | UbicacionEnAnaquel(idUbicacionAnaquel) |
| Stock        | float       | NO   |      | NULL    |                                        |
| Precio       | float       | NO   |      | NULL    |                                        |

| EmpleadoSucursal |      |      |      |         |                      |
| ---------------- | ---- | ---- | ---- | ------- | -------------------- |
| Field            | Type | Null | Key  | Default | References           |
| idEmpleado       | int  | NO   | PRI  | NULL    | Empleado(idEmpleado) |
| idSucursal       | int  | NO   | PRI  | NULL    | Sucursal(idSucursal) |

| Empleado   |             |      |      |         |            |
| ---------- | ----------- | ---- | ---- | ------- | ---------- |
| Field      | Type        | Null | Key  | Default | References |
| idEmpleado | int         | NO   | PRI  | NULL    |            |
| Cargo      | varchar(10) | NO   |      | NULL    |            |
| Sueldo     | float       | NO   |      | NULL    |            |
| Status     | tinyint     | NO   |      | 0       |            |

| Compra    |          |      |      |         |                        |
| --------- | -------- | ---- | ---- | ------- | ---------------------- |
| Field     | Type     | Null | Key  | Default | References             |
| idCompra  | int      | NO   | PRI  | NULL    |                        |
| Proveedor | int      | NO   | MUL  | NULL    | Proveedor(idProveedor) |
| Fecha     | datetime | YES  |      | NULL    |                        |
| Monto     | float    | YES  |      | NULL    |                        |
| Status    | tinyint  | YES  |      | NULL    |                        |

| CompraProducto |         |      |      |         |                      |
| -------------- | ------- | ---- | ---- | ------- | -------------------- |
| Field          | Type    | Null | Key  | Default | References           |
| idCompra       | int     | NO   | PRI  | NULL    | Compra(idCompra)     |
| idProducto     | int     | NO   | PRI  | NULL    | Producto(idProducto) |
| CantCompra     | int     | NO   |      | NULL    |                      |
| Status         | tinyint | NO   |      | 0       |                      |
| PrecioCompra   | float   | NO   |      | NULL    |                      |

| Clientes    |             |      |      |         |            |
| ----------- | ----------- | ---- | ---- | ------- | ---------- |
| Field       | Type        | Null | Key  | Default | References |
| idCliente   | int         | NO   | PRI  | NULL    |            |
| Nombre      | varchar(30) | NO   |      | NULL    |            |
| Apellido    | varchar(30) | NO   |      | NULL    |            |
| CantCompras | int         | YES  |      | NULL    |            |
| RFC         | varchar(13) | YES  |      | NULL    |            |
| CorreoE     | varchar(40) | YES  |      | NULL    |            |
| Telefono    | int         | YES  |      | NULL    |            |
| Status      | tinyint     | NO   |      | NULL    |            |

| Categoria    |             |      |      |         |            |
| ------------ | ----------- | ---- | ---- | ------- | ---------- |
| Field        | Type        | Null | Key  | Default | References |
| idCategoria  | varchar(10) | NO   | PRI  | NULL    |            |
| SubCategoria | varchar(10) | NO   | PRI  | NULL    |            |

| ActualizacionPrecio |             |      |      |         |                         |
| ------------------- | ----------- | ---- | ---- | ------- | ----------------------- |
| Field               | Type        | Null | Key  | Default | References              |
| idInventario        | int         | NO   | MUL  | NULL    | Inventario(idInvenario) |
| PrecioAnterior      | float       | NO   |      | NULL    |                         |
| PrecioNuevo         | varchar(45) | NO   |      | NULL    |                         |
| FechaModificacion   | datetime    | NO   |      | NULL    |                         |

