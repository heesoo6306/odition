create table tbl_artist_201905 (
    artist_id char(4) not null,
    artist_name varchar2(20),
    artist_birth char(8),
    artist_gender char(1),
    talent char(1),
    agency varchar(30),
    constraint pk_artist primary key(artist_id)
);

create table tbl_mento_201905 (
    mento_id char(4) not null,
    mento_name varchar2(20),
    constraint pk_mento primary key(mento_id)
);

create table tbl_point_201905 (
    serial_no number(8) not null,
    artist_id char(4),
    mento_id char(4),
    point number(3),
    constraint pk_point primary key(serial_no)
);
