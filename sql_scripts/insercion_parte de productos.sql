--carrito
insert into
  carrito(cliente,producto, cantidad)
VALUES
  (9, 1, 1),
  (1, 1, 2),
  (2, 2, 3),
  (3, 3, 4),
  (4, 3, 5),
  (5, 8, 6),
  (6, 20, 7),
  (1, 20, 8),
  (2, 9, 9),
  (3, 10, 10),
  (4, 11, 11),
  (5, 12, 12),
  (6, 13, 13),
  (7, 14, 14),
  (1, 15, 15),
  (8, 16, 16),
  (12, 14, 17),
  (20, 12, 18),
  (12, 7, 19),
  (3, 3, 20);
--fin
ALTER TABLE
  orden_compra AUTO_INCREMENT = 1;
alter table orden_compra AUTO_INCREMENT=1;
insert into
  orden_compra(id_cliente,id_metodoPago,total,id_domicilio,fecha_pedido)
values
  (1, 1, 1698, 1, '2019-08-12'),
  (2, 2, 1647, 2, '2019-09-29'),
  (3, 3, '377.28', 3, '2019-10-1'),
  (4, 3, '628.8', 4, '2019-11-2'),
  (5, 2, 2394, 5, '2019-12-15'),
  (6, 1, 17493, 6, '2020-01-17'),
  (7, 2, '9113.86', 7, '2020-02-18'),
  (8, 3, '9914.56', 8, '2020-03-20'),
  (9, 1, 849, 9, '2020-04-29');
insert into
  orden_detalle(id_orden, id_producto, cantidad, precio)
VALUES
--id_orden, id_producto, cantidad, precio
  (1        , 1          , 2        , 849),--
  (2        , 2          , 3        , 549),--
  (3        , 3          , 4        , '125.76'),--
  (4        , 3          , 5        , '125.76'),--
  (5        , 8          , 8        , 399),--
  (6        , 20          , 7        , 2499),--
  (7        , 14          , 14        ,'650.99'),--
  (8        , 16          , 16        , '619.66'),--
  (9        , 1          , 1        , 849);