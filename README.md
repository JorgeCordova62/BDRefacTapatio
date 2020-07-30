

### Diagrama UML

![UMLBDTapatio.png](https://github.com/JorgeCordova62/BDRefacTapatio/blob/develop/UMLBDTapatio.png?raw=true)



### Detalles de las tablas

| Ventas   |          |      |      |         |            |
| -------- | -------- | ---- | ---- | ------- | ---------- |
| Field    | Type     | Null | Key  | Default | References |
| idVentas | int      | NO   | PRI  | NULL    |            |
| Cliente  | int      | NO   | MUL  | NULL    |            |
| Monto    | float    | NO   |      | NULL    |            |
| Credito  | tinyint  | NO   |      | 0       |            |
| Fecha    | datetime | NO   |      | NULL    |            |
| Sucursal | int      | NO   |      | NULL    |            |

| VentasProductos |         |      |      |         |                        |
| --------------- | ------- | ---- | ---- | ------- | ---------------------- |
| Field           | Type    | Null | Key  | Default | References             |
| idVenta         | int     | NO   | PRI  | NULL    | Ventas(idVentas)       |
| idProductos     | int     | NO   | MUL  | NULL    | Productos(idProductos) |
| Cantidad        | float   | NO   |      | NULL    |                        |
| Status          | tinyint | NO   |      | 0       |                        |
| PrecioVenta     | float   | NO   |      | NULL    |                        |

| UbicacionAnaqueles   |             |      |      |         |            |
| -------------------- | ----------- | ---- | ---- | ------- | ---------- |
| Field                | Type        | Null | Key  | Default | References |
| idUbicacionAnaqueles | varchar(10) | NO   | PRI  | NULL    |            |
| Anaquel              | varchar(3)  | NO   |      | NULL    |            |
| Seccion              | varchar(3)  | NO   |      | NULL    |            |
| Fila                 | int         | NO   |      | NULL    |            |
| Sucursal             | int         | NO   | MUL  | NULL    |            |

| Sucursal   |             |      |      |         |            |
| ---------- | ----------- | ---- | ---- | ------- | ---------- |
| Field      | Type        | Null | Key  | Default | References |
| idSucursal | int         | NO   | PRI  | NULL    |            |
| Ciudad     | varchar(10) | YES  |      | NULL    |            |
| Direccion  | varchar(45) | YES  |      | NULL    |            |
| Encargado  | int         | YES  |      | NULL    |            |

| Proveedor   |             |      |      |         |            |
| ----------- | ----------- | ---- | ---- | ------- | ---------- |
| Field       | Type        | Null | Key  | Default | References |
| idProveedor | int         | NO   | PRI  | NULL    |            |
| Nombre      | varchar(30) | NO   |      | NULL    |            |
| RFC         | varchar(13) | NO   | UNI  | NULL    |            |
| CorreoE     | varchar(40) | NO   |      | NULL    |            |
| Telefono    | int         | NO   |      | NULL    |            |
| Status      | tinyint     | NO   |      | NULL    |            |

| Productos   |             |      |      |         |            |
| ----------- | ----------- | ---- | ---- | ------- | ---------- |
| Field       | Type        | Null | Key  | Default | References |
| idProductos | int         | NO   | PRI  | NULL    |            |
| Nombre      | varchar(20) | NO   |      | NULL    |            |
| Descripcion | text        | NO   |      | NULL    |            |
| Categoria   | varchar(10) | NO   | MUL  | NULL    |            |

| inventario   |             |      |      |         |                                          |
| ------------ | ----------- | ---- | ---- | ------- | ---------------------------------------- |
| Field        | Type        | Null | Key  | Default | References                               |
| idInventario | int         | NO   | PRI  | NULL    |                                          |
| idProducto   | int         | NO   | MUL  | NULL    | Productos(idProductos)                   |
| idUbicacion  | varchar(10) | NO   | MUL  | NULL    | UbicacionAnaqueles(idUbicacionAnaqueles) |
| Stock        | float       | NO   |      | NULL    |                                          |
| Precio       | float       | NO   |      | NULL    |                                          |

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

| Compras   |          |      |      |         |                        |
| --------- | -------- | ---- | ---- | ------- | ---------------------- |
| Field     | Type     | Null | Key  | Default | References             |
| idCompras | int      | NO   | PRI  | NULL    |                        |
| Provedor  | int      | NO   | MUL  | NULL    | Proveedor(idProveedor) |
| Fecha     | datetime | YES  |      | NULL    |                        |
| Monto     | float    | YES  |      | NULL    |                        |
| Status    | tinyint  | YES  |      | NULL    |                        |

| ComprasProductos |         |      |      |         |                        |
| ---------------- | ------- | ---- | ---- | ------- | ---------------------- |
| Field            | Type    | Null | Key  | Default | References             |
| idCompra         | int     | NO   | PRI  | NULL    | Compras(idCompras)     |
| idProducto       | int     | NO   | PRI  | NULL    | Productos(idProductos) |
| CantCompra       | int     | NO   |      | NULL    |                        |
| Status           | tinyint | NO   |      | 0       |                        |
| PrecioCompra     | float   | NO   |      | NULL    |                        |

| Clientes    |             |      |      |         |            |
| ----------- | ----------- | ---- | ---- | ------- | ---------- |
| Field       | Type        | Null | Key  | Default | References |
| idClientes  | int         | NO   | PRI  | NULL    |            |
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

