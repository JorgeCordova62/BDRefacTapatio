
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

CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Apellido` VARCHAR(30) NOT NULL,
  `CantCompras` INT NULL DEFAULT NULL,
  `RFC` VARCHAR(13) NULL DEFAULT NULL,
  `CorreoE` VARCHAR(40) NULL DEFAULT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  `Status` TINYINT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Categoria` (
`SubSubCategoria` VARCHAR(15) NOT NULL,
  `idCategoria` VARCHAR(15) NOT NULL,
  `SubCategoria` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`SubSubCategoria`,`idCategoria`, `Subcategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `Producto` (
  `idProducto` VARCHAR(15) NOT NULL,
  `Nombre` TEXT NOT NULL,
  `Marca` TEXT NOT NULL,
  `Categoria` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `FK_productoCategoria`
    FOREIGN KEY (`Categoria`)
    REFERENCES `Categoria` (`SubSubCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `UbicacionEnAnaquel` (
  `idUbicacionAnaquel` VARCHAR(10) NOT NULL,
  `Anaquel` VARCHAR(3) NOT NULL,
  `Seccion` VARCHAR(3) NOT NULL,
  `Fila` INT NOT NULL,
  `Sucursal` INT NOT NULL,
  PRIMARY KEY (`idUbicacionAnaquel`),
  CONSTRAINT `fk_UbicacionAnaquel_Sucursal`
    FOREIGN KEY (`Sucursal`)
    REFERENCES `Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `Compra` (
  `idCompra` INT NOT NULL,
  `Proveedor` INT NOT NULL,
  `Fecha` DATETIME NULL DEFAULT NULL,
  `Monto` FLOAT NULL DEFAULT NULL,
  `Status` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  CONSTRAINT `FK_CompraProveedor`
    FOREIGN KEY (`Proveedor`)
    REFERENCES `Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Venta` (
  `idVenta` INT NOT NULL,
  `Cliente` INT NOT NULL,
  `Monto` FLOAT NOT NULL,
  `Credito` TINYINT NOT NULL DEFAULT 0,
  `Fecha` DATETIME NOT NULL,
  `Sucursal` INT NOT NULL,
  PRIMARY KEY (`idVenta`),
  CONSTRAINT `FK_VentaCliente`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_VentaSucursal`
    FOREIGN KEY (`Sucursal`)
    REFERENCES `Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `VentaProducto` (
  `idVenta` INT NOT NULL,
  `idProducto` VARCHAR(15) NOT NULL,
  `Cantidad` FLOAT NOT NULL,
  `Status` TINYINT NOT NULL DEFAULT 0,
  `PrecioVenta` FLOAT NOT NULL,
  PRIMARY KEY (`idVenta`),
  CONSTRAINT `FK_VentaProducto_Producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_VentaProducto_Venta`
    FOREIGN KEY (`idVenta`)
    REFERENCES `Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Inventario` (
  `idInventario` INT NOT NULL,
  `idProducto` VARCHAR(15) NOT NULL,
  `idUbicacion` VARCHAR(10) NOT NULL,
  `Stock` FLOAT NOT NULL,
  `Precio` FLOAT NOT NULL,
  PRIMARY KEY (`idInventario`),
  CONSTRAINT `FK_ProductoInventario`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InventarioUbicacion`
    FOREIGN KEY (`idUbicacion`)
    REFERENCES `UbicacionEnAnaquel` (`idUbicacionAnaquel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `ActualizacionPrecio` (
  `idInventario` INT NOT NULL,
  `PrecioAnterior` FLOAT NOT NULL,
  `Precionuevo` VARCHAR(45) NOT NULL,
  `FechaModificacion` DATETIME NOT NULL,
  CONSTRAINT `FK_ActualizacionPrecioInventario`
    FOREIGN KEY (`idInventario`)
    REFERENCES `Inventario` (`idInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `CompraProducto` (
  `idCompra` INT NOT NULL,
  `idProducto` VARCHAR(15) NOT NULL,
  `CantCompra` INT NOT NULL,
  `Status` TINYINT NOT NULL DEFAULT 0,
  `PrecioCompra` FLOAT NOT NULL,
  PRIMARY KEY (`idCompra`, `idProducto`),
  CONSTRAINT `FK_CompraProducto_Compra`
    FOREIGN KEY (`idCompra`)
    REFERENCES `Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CompraProducto_Producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Producto` (`idProducto`)
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
  CONSTRAINT `FK_EmpleadoSucursal_Empleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmpleadoSucursal_Sucursal`
    FOREIGN KEY (`idSucursal`)
    REFERENCES `Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
