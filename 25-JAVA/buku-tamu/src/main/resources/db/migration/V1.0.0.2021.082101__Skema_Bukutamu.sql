create table bukutamu(
    id varchar(36),
    email varchar(100) not null,
    komentar varchar(255) not null ,
    waktu_mengisi timestamp not null,
    primary key (id)
);