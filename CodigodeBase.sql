
-- Project: BD El taatio
-- Author: Jorge Cordova Villamil
-- Update: 28/08/2020

CREATE DATABASE ELTAPATIO;
USE ELTAPATIO;
-- DROP DATABASE ELTAPATIO2;
CREATE TABLE IF NOT EXISTS `Sucursal` (
  `idSucursal` INT NOT NULL,
  `Ciudad` VARCHAR(10) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `Encargado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idSucursal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Proveedor` (
  `idProveedor` INT NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `RFC` VARCHAR(13) NOT NULL UNIQUE,
  `CorreoE` VARCHAR(40) NOT NULL,
  `Telefono` INT NOT NULL,
  `Status` TINYINT NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Clientes` (
  `idClientes` INT NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Apellido` VARCHAR(30) NOT NULL,
  `CantCompras` INT NULL DEFAULT NULL,
  `RFC` VARCHAR(13) NULL DEFAULT NULL,
  `CorreoE` VARCHAR(40) NULL DEFAULT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  `Status` TINYINT NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Categoria` (
  `idCategoria` VARCHAR(10) NOT NULL,
  `SubCategoria` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idCategoria`, `Subcategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `Productos` (
  `idProductos` INT NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Descripcion` TEXT(200) NOT NULL,
  `Categoria` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idProductos`),
  CONSTRAINT `FK_productosCategorias`
    FOREIGN KEY (`Categoria`)
    REFERENCES `Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `UbicacionAnaqueles` (
  `idUbicacionAnaqueles` VARCHAR(10) NOT NULL,
  `Anaquel` VARCHAR(3) NOT NULL,
  `Seccion` VARCHAR(3) NOT NULL,
  `Fila` INT NOT NULL,
  `Sucursal` INT NOT NULL,
  PRIMARY KEY (`idUbicacionAnaqueles`),
  CONSTRAINT `fk_UbicacionAnaqueles_Sucursal`
    FOREIGN KEY (`Sucursal`)
    REFERENCES `Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `Compras` (
  `idCompras` INT NOT NULL,
  `Proovedor` INT NOT NULL,
  `Fecha` DATETIME NULL DEFAULT NULL,
  `Monto` FLOAT NULL DEFAULT NULL,
  `Status` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`idCompras`),
  CONSTRAINT `FK_ComprasProveedor`
    FOREIGN KEY (`Proovedor`)
    REFERENCES `Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Ventas` (
  `idVentas` INT NOT NULL,
  `Cliente` INT NOT NULL,
  `Monto` FLOAT NOT NULL,
  `Credito` TINYINT NOT NULL DEFAULT 0,
  `Fecha` DATETIME NOT NULL,
  `Sucursal` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  CONSTRAINT `FK_VentasClientes`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `VentaProductos` (
  `idVenta` INT NOT NULL,
  `idProductos` INT NOT NULL,
  `Cantidad` FLOAT NOT NULL,
  `Status` TINYINT NOT NULL DEFAULT 0,
  `PrecioVenta` FLOAT NOT NULL,
  PRIMARY KEY (`idVenta`),
  CONSTRAINT `FK_productos(VP)`
    FOREIGN KEY (`idProductos`)
    REFERENCES `Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ventas`
    FOREIGN KEY (`idVenta`)
    REFERENCES `Ventas` (`idVentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Inventario` (
  `idInventario` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `idUbicacion` VARCHAR(10) NOT NULL,
  `Stock` FLOAT NOT NULL,
  `Precio` FLOAT NOT NULL,
  PRIMARY KEY (`idInventario`),
  CONSTRAINT `FK_Producto(I)`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Ubicacion`
    FOREIGN KEY (`idUbicacion`)
    REFERENCES `UbicacionAnaqueles` (`idUbicacionAnaqueles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `ActualizacionPrecio` (
  `idInventario` INT NOT NULL,
  `PrecioAnterior` FLOAT NOT NULL,
  `Precionuevo` VARCHAR(45) NOT NULL,
  `FechaModificacion` DATETIME NOT NULL,
  CONSTRAINT `FK_Inventario`
    FOREIGN KEY (`idInventario`)
    REFERENCES `Inventario` (`idInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `CompraProducto` (
  `idCompra` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `CantCompra` INT NOT NULL,
  `Status` TINYINT NOT NULL DEFAULT 0,
  `PrecioCompra` FLOAT NOT NULL,
  PRIMARY KEY (`idCompra`, `idProducto`),
  CONSTRAINT `FK_Compra`
    FOREIGN KEY (`idCompra`)
    REFERENCES `Compras` (`idCompras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Empleado` (
  `idEmpleado` INT NOT NULL,
  `Cargo` VARCHAR(10) NOT NULL,
  `Sueldo` FLOAT NOT NULL,
  `Status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `EmpleadoSucursal` (
  `idEmpleado` INT NOT NULL,
  `idSucursal` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`, `idSucursal`),
  CONSTRAINT `FK_Empleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sucursal`
    FOREIGN KEY (`idSucursal`)
    REFERENCES `Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
