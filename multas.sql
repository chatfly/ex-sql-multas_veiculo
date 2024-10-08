create database ex_multas

use ex_multas

create table veiculos(
	placa char(8) primary key,
	marca varchar(20) not null,
	modelo varchar(20) not null,
	ano int not null,
)

create table multas(
	id int primary key,
	multa varchar(200) not null,
	valor float not null
)

insert into veiculos
(placa, marca, modelo, ano)
values('TDG-4H27', 'Chevrolet', 'Kadett', 1995)

insert into veiculos
(placa, marca, modelo, ano)
values('PUT-4M34', 'Fiat', 'Uno', 2012)

insert into veiculos
(placa, marca, modelo, ano)
values('LAE-1E13', 'Hyundai', 'HB20', 2022)

select * from veiculos

insert into multas
(id, multa, valor)
values(1, 'Parou o veículo em lugar proibido', 650)

insert into multas
(id, multa, valor)
values(2, 'Usando celular no volante', 400)

insert into multas
(id, multa, valor)
values(3, 'Direção perigosa', 1300)

select * from multas

create table multas_veiculos(
	id int primary key identity (1,1),
	placaVeiculo char(8) not null,
	idMulta int not null,

	constraint fk_veiculo_multaVeiculo
	foreign key (placaVeiculo) references veiculos(placa),

	constraint fk_multa_multaVeiculo
	foreign key (idMulta) references multas(id),
)

insert into multas_veiculos
(placaVeiculo, idMulta)
values('PUT-4M34', 2)

insert into multas_veiculos
(placaVeiculo, idMulta)
values('LAE-1E13', 1)

insert into multas_veiculos
(placaVeiculo, idMulta)
values('TDG-4H27', 3)

select * from multas_veiculos

select veiculos.placa, multas.multa from multas_veiculos
inner join veiculos on veiculos.placa = multas_veiculos.placaVeiculo
inner join multas on multas.id = multas_veiculos.idMulta
order by veiculos.modelo