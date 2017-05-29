/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     5/22/2017 12:55:35 AM                        */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists DETIL_TRANSAKSI;

drop table if exists OBAT;

drop table if exists SUPPLIER;

drop table if exists TRANSAKSI;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN
(
   ID_ADMIN             int not null,
   USERNAME             varchar(25),
   PASSWORD             varchar(25),
   primary key (ID_ADMIN)
);

/*==============================================================*/
/* Table: DETIL_TRANSAKSI                                       */
/*==============================================================*/
create table DETIL_TRANSAKSI
(
   ID_DETIL_TRANS       int not null,
   KODE_OBAT            int,
   NAMA_OBAT            varchar(100),
   KODE_TRANSAKSI       int,
   JUMLAH               int,
   SUB_TOTAL            int,
   primary key (ID_DETIL_TRANS)
);

/*==============================================================*/
/* Table: OBAT                                                  */
/*==============================================================*/
create table OBAT
(
   KODE_OBAT            int not null,
   NAMA_OBAT            varchar(100) not null,
   KODE_SUPPLIER        int,
   PRODUSEN             varchar(100),
   HARGA                int,
   JUMLAH_STOK          int,
   FOTO                 text,
   primary key (KODE_OBAT, NAMA_OBAT)
);

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER
(
   KODE_SUPPLIER        int not null,
   NAMA_SUPPLIER        varchar(50),
   ALAMAT               varchar(100),
   KOTA                 varchar(100),
   TELP                 varchar(12),
   primary key (KODE_SUPPLIER)
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI
(
   KODE_TRANSAKSI       int not null,
   ID_ADMIN             int,
   NAMA_PEMBELI         varchar(30),
   TOTAL                int,
   TGL_BELI             date,
   primary key (KODE_TRANSAKSI)
);

alter table DETIL_TRANSAKSI add constraint FK_BERISI foreign key (KODE_OBAT, NAMA_OBAT)
      references OBAT (KODE_OBAT, NAMA_OBAT) on delete restrict on update restrict;

alter table DETIL_TRANSAKSI add constraint FK_MEMILIKI foreign key (KODE_TRANSAKSI)
      references TRANSAKSI (KODE_TRANSAKSI) on delete restrict on update restrict;

alter table OBAT add constraint FK_MENYUPLAI foreign key (KODE_SUPPLIER)
      references SUPPLIER (KODE_SUPPLIER) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_MELAKUKAN foreign key (ID_ADMIN)
      references ADMIN (ID_ADMIN) on delete restrict on update restrict;

