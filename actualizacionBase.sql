ALTER TABLE Clientes RENAME COLUMN idClientes TO idCliente;
ALTER TABLE Clientes RENAME Cliente;

ALTER TABLE Productos RENAME COLUMN idProductos TO idProducto;
ALTER TABLE Productos RENAME Producto;

ALTER TABLE UbicacionAnaqueles RENAME COLUMN idUbicacionAnaqueles TO idUbicacionAnaquel;
ALTER TABLE UbicacionAnaqueles RENAME UbicacionEnAnaquel;

ALTER TABLE Compras RENAME COLUMN idCompras TO idCompra;
ALTER TABLE Compras RENAME Compra;

ALTER TABLE Ventas RENAME COLUMN idVentas TO idVenta;
ALTER TABLE Ventas RENAME Venta;

ALTER TABLE VentaProductos RENAME COLUMN idProductos TO idProducto;
ALTER TABLE VentaProductos RENAME VentaProducto;

ALTER TABLE Compra RENAME COLUMN Proovedor TO Proveedor;


alter table Sucursal drop column Encargado;

ALTER TABLE `ActualizacionPrecio` 
DROP FOREIGN KEY `FK_Inventario`;

ALTER TABLE `ActualizacionPrecio` 
ADD CONSTRAINT `FK_ActualizacionPrecioInventario`
  FOREIGN KEY (`idInventario`)
  REFERENCES `Inventario` (`idInventario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `UbicacionEnAnaquel` 
DROP FOREIGN KEY `fk_UbicacionAnaquel_Sucursal`;

ALTER TABLE `UbicacionEnAnaquel` 
ADD CONSTRAINT `fk_UbicacionEnAnaquel_Sucursal`
  FOREIGN KEY (`Sucursal`)
  REFERENCES `Sucursal` (`idSucursal`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `Compra` 
DROP FOREIGN KEY `FK_ComprasProveedor`;

ALTER TABLE `Compra` 
ADD CONSTRAINT `FK_CompraProveedor`
  FOREIGN KEY (`Proveedor`)
  REFERENCES `Proveedor` (`idProveedor`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------  
    ALTER TABLE `CompraProducto` 
DROP FOREIGN KEY `FK_Compra`;

ALTER TABLE `CompraProducto` 
ADD CONSTRAINT `FK_CompraProducto_Compra`
  FOREIGN KEY (`idCompra`)
  REFERENCES `Compra` (`idCompra`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
      ALTER TABLE `CompraProducto` 
DROP FOREIGN KEY `FK_Producto`;

ALTER TABLE `CompraProducto` 
ADD CONSTRAINT `FK_CompraProducto_Producto`
  FOREIGN KEY (`idProducto`)
  REFERENCES `Producto` (`idProducto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
      ALTER TABLE `EmpleadoSucursal` 
DROP FOREIGN KEY `FK_Empleado`;

ALTER TABLE `EmpleadoSucursal` 
ADD CONSTRAINT `FK_EmpleadoSucursal_Empleado`
  FOREIGN KEY (`idEmpleado`)
  REFERENCES `Empleado` (`idEmpleado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#--------------
ALTER TABLE `EmpleadoSucursal` 
DROP FOREIGN KEY `FK_Sucursal`;

ALTER TABLE `EmpleadoSucursal` 
ADD CONSTRAINT `FK_EmpleadoSucursal_Sucursal`
  FOREIGN KEY (`idSucursal`)
  REFERENCES `Sucursal` (`idSucursal`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
ALTER TABLE `Inventario` 
DROP FOREIGN KEY `FK_Producto(I)`;

ALTER TABLE `Inventario` 
ADD CONSTRAINT `FK_ProductoInventario`
  FOREIGN KEY (`idProducto`)
  REFERENCES `Producto` (`idProducto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
ALTER TABLE `Inventario` 
DROP FOREIGN KEY `FK_Ubicacion`;

ALTER TABLE `Inventario` 
ADD CONSTRAINT `FK_InventarioUbicacion`
  FOREIGN KEY (`idUbicacion`)
  REFERENCES `UbicacionEnAnaquel` (`idUbicacionAnaquel`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
ALTER TABLE `Producto` 
DROP FOREIGN KEY `FK_productosCategorias`;

ALTER TABLE `Producto` 
ADD CONSTRAINT `FK_productoCategoria`
  FOREIGN KEY (`Categoria`)
  REFERENCES `Categoria` (`idCategoria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
ALTER TABLE `Venta` 
DROP FOREIGN KEY `FK_VentasClientes`;

ALTER TABLE `Venta` 
ADD CONSTRAINT `FK_VentaCliente`
  FOREIGN KEY (`Cliente`)
  REFERENCES `Cliente` (`idCliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#--------------
ALTER TABLE `VentaProducto` 
DROP FOREIGN KEY `FK_productos(VP)`;

ALTER TABLE `VentaProducto` 
ADD CONSTRAINT `FK_VentaProducto_Venta`
  FOREIGN KEY (`idVenta`)
  REFERENCES `Venta` (`idVenta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
ALTER TABLE `VentaProducto` 
DROP FOREIGN KEY `FK_ventas`;

ALTER TABLE `VentaProducto` 
ADD CONSTRAINT `FK_VentaProducto_Producto`
  FOREIGN KEY (`idProducto`)
  REFERENCES `Producto` (`idProducto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
#--------------
ALTER TABLE `Venta` 
ADD CONSTRAINT `FK_VentaSucursal`
  FOREIGN KEY (`Sucursal`)
  REFERENCES `Sucursal` (`idSucursal`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  