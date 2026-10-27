# Tienda Virtual - Base de datos SQL

Base de datos relacional en **MySQL 8.0** que modela una tienda online (marketplace) donde hay usuarios compradores y vendedores, productos organizados por categorías, órdenes de compra y pagos.

## Contenido

```
├── tienda_virtual.sql   # Esquema, datos de prueba y consultas de verificación
└── README.md
```

## Requisitos

- MySQL Server 8.0
- MySQL Workbench (o cualquier cliente MySQL)

## Cómo ejecutarlo

1. Abre MySQL Workbench y entra a tu conexión (por ejemplo, `Local instance MySQL80`).
2. Ve a **File > Open SQL Script** y selecciona `tienda_virtual.sql`.
3. Ejecuta todo el script con el botón del rayo ⚡.

Desde la terminal también puedes usar:

```bash
mysql -u root -p < tienda_virtual.sql
```

> El script usa `CREATE DATABASE tienda_virtual;` sin `DROP`. Si la base ya existe, bórrala antes con `DROP DATABASE tienda_virtual;`.

## Modelo de datos

| Tabla | Descripción |
|-------|-------------|
| `usuarios` | Compradores y vendedores (`tipo_usuario`) con sus datos de contacto |
| `categorias` | Categorías de productos (tecnología, hogar, deportes, etc.) |
| `productos` | Productos publicados, con vendedor, categoría, precio y stock |
| `ordenes` | Órdenes de compra realizadas por los usuarios |
| `detalle_orden` | Productos, cantidades y precio unitario de cada orden |
| `pagos` | Pagos asociados a cada orden (método, monto y estado) |

### Relaciones

- `ordenes.id_usuario` → `usuarios.id_usuario`
- `productos.id_vendedor` → `usuarios.id_usuario`
- `productos.id_categoria` → `categorias.id_categoria`
- `detalle_orden.id_orden` → `ordenes.id_orden`
- `detalle_orden.id_producto` → `productos.id_producto`
- `pagos.id_orden` → `ordenes.id_orden`

## Valores usados en los datos de prueba

| Campo | Valores |
|-------|---------|
| `usuarios.tipo_usuario` | `comprador`, `vendedor` |
| `ordenes.estado_orden` | `pendiente`, `enviado`, `entregado` |
| `pagos.metodo_pago` | `tarjeta_credito`, `tarjeta_debito`, `pse` |
| `pagos.estado_pago` | `aprobado`, `pendiente` |

## Datos de prueba

- 10 usuarios (6 compradores y 4 vendedores)
- 10 categorías
- 10 productos, repartidos entre los 4 vendedores
- 10 órdenes con su detalle
- 10 pagos

## Notas

- Los pagos con estado `pendiente` tienen monto `0` y `fecha_pago` en `NULL`. Por eso el script modifica la columna con `ALTER TABLE pagos MODIFY fecha_pago DATE NULL;`.
- `productos.id_vendedor` valida que el usuario exista, pero no que sea de tipo `vendedor`. Esa regla se cuida al insertar los datos.
