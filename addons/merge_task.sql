create table Table1
(
    id              int,
    var1            varchar(30),
    valid_from_dttm date,
    valid_to_dttm   date
);

create table Table2
(
    id              int,
    var2            varchar(30),
    valid_from_dttm date,
    valid_to_dttm   date
);

-- insert into Table1
-- values (1, 'A', '2018-09-01', '2018-09-15');
-- insert into Table1
-- values (1, 'B', '2018-09-16', '2018-09-18');
-- insert into Table1
-- values (1, 'C', '2018-09-19', '5999-12-31');
--
-- insert into Table2
-- values (1, 'A', '2018-09-01', '2018-09-20');
-- insert into Table2
-- values (1, 'B', '2018-09-21', '2018-09-28');
-- insert into Table2
-- values (1, 'C', '2018-09-29', '5999-12-31');

insert into Table1
values (1, 'A', '2018-01-01', '2019-01-01');
insert into Table1
values (1, 'B', '2019-01-01', '2019-01-01');
insert into Table1
values (1, 'C', '2019-01-01', '5999-12-31');


insert into Table2
values (1, 'A', '2018-01-01', '2020-01-01');
insert into Table2
values (1, 'B', '2020-01-02', '5999-12-31');


select * from Table1;
select * from Table2;


select * from (
        select T1.id   as id, T1.var1 as var1, T2.var2 as var2,
                greatest(T1.valid_from_dttm, T2.valid_from_dttm) as valid_from_dttm,
                --case
                --    when T1.valid_from_dttm > T2.valid_from_dttm then T1.valid_from_dttm
                --    else T2.valid_from_dttm
                --    end as valid_from_dttm,
                least(T1.valid_to_dttm, T2.valid_to_dttm) as valid_to_dttm
                --case
                --    when T1.valid_to_dttm < T2.valid_to_dttm then T1.valid_to_dttm
                --    else T2.valid_to_dttm
                --    end as valid_to_dttm
        from Table1 T1 join Table2 T2 on T1.id = T2.id) as result
where valid_to_dttm >= valid_from_dttm
order by id;

--drop table Table1;
--drop table Table2;
