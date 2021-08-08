/*==============================================================*/
/* Database name:  LOCADORA                                     */
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     07/08/2021 17:43:12                          */
/*==============================================================*/


drop database LOCADORA
go

/*==============================================================*/
/* Database: LOCADORA                                           */
/*==============================================================*/
create database LOCADORA
go

use LOCADORA
go

/*==============================================================*/
/* Table: ATORES                                                */
/*==============================================================*/
create table ATORES (
   COD_ATOR             integer              not null,
   NOME_ATOR            varchar(100)         not null,
   SEXO                 char(1)              not null,
   DATA_NASCIMENTO      date                 not null
)
go

alter table ATORES
   add constraint CKC_SEXO_ATORES check (SEXO in ('<F>','<M>'))
go

alter table ATORES
   add constraint PK_ATORES primary key (COD_ATOR)
go

/*==============================================================*/
/* Table: FILMES                                                */
/*==============================================================*/
create table FILMES (
   COD_FILME            integer              not null,
   COD_GENERO           integer              null,
   TITULO               varchar(100)         not null,
   ANO                  integer              not null
)
go

alter table FILMES
   add constraint PK_FILMES primary key (COD_FILME)
go

/*==============================================================*/
/* Table: FILME_ATOR                                            */
/*==============================================================*/
create table FILME_ATOR (
   COD_FILME            integer              not null,
   COD_ATOR_PRINCIPAL   integer              not null,
   COD_GENERO           integer              not null
)
go

alter table FILME_ATOR
   add constraint PK_FILME_ATOR primary key (COD_FILME)
go

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO (
   COD_GENERO           integer              not null,
   DESCR_GENERO         varchar(50)          not null
)
go

alter table GENERO
   add constraint PK_GENERO primary key (COD_GENERO)
go

alter table FILMES
   add constraint FK_FILMES_REFERENCE_GENERO foreign key (COD_GENERO)
      references GENERO (COD_GENERO)
go

alter table FILME_ATOR
   add constraint FK_FILME_AT_REFERENCE_FILMES foreign key (COD_FILME)
      references FILMES (COD_FILME)
go

alter table FILME_ATOR
   add constraint FK_FILME_AT_REFERENCE_ATORES foreign key (COD_ATOR_PRINCIPAL)
      references ATORES (COD_ATOR)
go

alter table FILME_ATOR
   add constraint FK_FILME_AT_REFERENCE_GENERO foreign key (COD_GENERO)
      references GENERO (COD_GENERO)
go

