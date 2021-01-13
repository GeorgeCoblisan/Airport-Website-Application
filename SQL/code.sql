3.7 Cod MySQL

•	Crearea bazei de date și a tabelelor

drop schema if exists aeroport;
create database aeroport;
use aeroport;

CREATE TABLE Inregistrare (
   id_inregistrare int unique PRIMARY KEY,
   nume varchar(20),
   prenume varchar(20),
   email varchar(30),
   CNP varchar(13),
   nr_telefon varchar(20),
   parola varchar(20),
   id_client int,
   index (id_client),
   FOREIGN KEY (id_client) REFERENCES Clientt(id_client)
);

CREATE TABLE Clientt (
   id_client int PRIMARY KEY,
   nume varchar(20),
   prenume varchar(20),
   nr_telefon varchar(20)
);

CREATE TABLE Tranzactie (
   id_tranzactie int PRIMARY KEY,
   id_bilet int,
   id_client int,
   data_achizitie date,
   pret_final numeric(5,2),
   index (id_client),
   FOREIGN KEY (id_client) REFERENCES Clientt(id_client),
   index (id_bilet),
   FOREIGN KEY (id_bilet) REFERENCES Bilete(id_bilet)
);

CREATE TABLE Bilete (
   id_bilet int PRIMARY KEY,
   id_zbor int,
   tip varchar(20),
   loc int,
   pret numeric(5,2),
   tip_bagaj varchar(20),
   status boolean,
   index (id_zbor),
   FOREIGN KEY (id_zbor) REFERENCES Zboruri(id_zbor)
);

CREATE TABLE Zboruri (
   id_zbor int PRIMARY KEY,
   plecare varchar(20),
   destinatie varchar(20),
   escala varchar(20),
   data_plecare time,
   ora_plecare time,
   ora_sosire time,
   tip_zbor varchar(20),
   status varchar(20),
   id_avion int,
   poarta varchar(20),
   intarziere varchar(20),
   pista int,
   index (id_avion),
   FOREIGN KEY (id_avion) REFERENCES Avioane(id_avion)
);

CREATE TABLE Avioane (
   id_avion int PRIMARY KEY,
   nume varchar(20),
   id_echipaj int,
   tip varchar(20),
   capacitate int,
   id_companie int,
   index (id_echipaj),
   FOREIGN KEY (id_echipaj) REFERENCES Personal(id_personal),
   index (id_companie),
   FOREIGN KEY (id_companie) REFERENCES Companie(id_companie)
);

CREATE TABLE Personal (
   id_personal int PRIMARY KEY,
   id_echipaj int,
   nume varchar(20),
   prenume varchar(20),
   functie varchar(20),
   id_companie int,
   index (id_companie),
   FOREIGN KEY (id_companie) REFERENCES Companie(id_companie)
);

CREATE TABLE Companie (
   id_companie int PRIMARY KEY,
   nume varchar(20),
   sediu varchar(20),
   data_inf date, 
   nr_avioane int,
   nr_angajati int
);

CREATE TABLE Cargo (
   id_cargo int PRIMARY KEY,
   nume varchar(20),
   cantitate numeric(5,2),
   id_zbor int,
   id_firma int,
   index (id_zbor),
   FOREIGN KEY (id_zbor) REFERENCES Zboruri(id_zbor),
   index (id_firma),
   FOREIGN KEY (id_firma) REFERENCES Firme(id_firma)
);

CREATE TABLE Firme (
   id_firma int PRIMARY KEY,
   nume varchar(20),
   email varchar(20),
   telefon varchar(20),
   parola varchar(20)
);

CREATE TABLE Duty_Free (
   id_uc int PRIMARY KEY,
   nume varchar(20),
   ora_deschidere time,
   ora_inchidere time,
   tip_magazin varchar(20)
);

CREATE TABLE Supervizor_Personal (
   id_supervizor int PRIMARY KEY,
   nume varchar(20),
   prenume varchar(20),
   nr_subordonati int,
   functie_supervizata varchar(20)
);

CREATE TABLE Personal_Aeroport (
   id_angajat int PRIMARY KEY,
   nume varchar(20),
   prenume varchar(20),
   CNP varchar(13),
   functie varchar(20),
   salariu numeric(5,2),
   id_supervizor int,
   index (id_supervizor),
   FOREIGN KEY (id_supervizor) REFERENCES Supervizor_Personal(id_supervizor)
);

CREATE TABLE Reviews (
   
   id_rev int PRIMARY KEY,
   id_angajat int,
   id_uc int,
   comentariu varchar(100),
   index (id_angajat),
   FOREIGN KEY (id_angajat) REFERENCES Personal_Aeroport(id_angajat),
   index (id_uc),
   FOREIGN KEY (id_uc) REFERENCES Duty_Free(id_uc)
);


Inserări date existente


insert into zboruri values
('1', 'Cluj-Napoca', 'Bucuresti', NULL, '2021-01-28', '12:20', '13:30', 'pasageri', 'ok', '440', '2', '0', '1');
insert into zboruri values
('2', 'Cluj-Napoca', 'Londra', NULL, '2021-02-05', '13:20', '15:30', 'pasageri', 'ok', '429', '5', '0', '7');
insert into zboruri values
('3', 'Bucuresti', 'Londra', NULL, '2021-02-27', '20:00', '22:00', 'pasageri', 'ok', '381', '3', '0', '5');
insert into zboruri values
('4', 'Londra', 'New York', NULL, '2021-02-11', '00:00', '12:00', 'pasageri', 'ok', '264', '9', '0', '4');
insert into zboruri values
('5', 'Beijing', 'Kiev', NULL, '2021-02-22', '09:00', '21:00', 'pasageri', 'ok', '93', '4', '0', '2');
insert into zboruri values
('6', 'Kiev', 'Londra', NULL, '2021-01-21', '22:00', '23:40', 'pasageri', 'ok', '204', '6', '0', '3');
insert into zboruri values
('7', 'Londra', 'San Francisco', NULL, '2021-02-16', '01:00', '13:00', 'pasageri', 'ok', '177', '8', '0', '6');


INSERT INTO companie
values ('1', 'Etihad', 'Abu Dhabi', '2003-07-12', '104', '200'), 
('2', 'Fly Emirates', 'Dubai', '1985-03-25', '254', '500'), 
('3', 'Wizz Air', 'Budapesta', '2003-03-04', '100', '150');


insert into supervizor_personal
values('1', 'Popescu', 'Eduard', '10', 'toate');

call populare_duty('0', '4');
call populare_personal_aeroport('0', '10');


Cod proceduri


##-----PROCEDURA PENTRU POPULAREA TABELEI BILETE-------

alter table bilete
modify column id_bilet int auto_increment;
alter table bilete auto_increment = 0;
delimiter $$
create procedure populare_bilete(tip varchar(20), id_zbor_nou int, loc_start int, loc_final int, pret int, tip_bagaj varchar(20)) 
begin 
    declare i int default loc_start;
    loop_1: LOOP
        set i=i+1;
        insert into bilete(id_zbor, tip, loc, pret, tip_bagaj, status)
        values (id_zbor_nou, tip, i, pret, tip_bagaj, true);
        if(i = loc_final) then
        leave loop_1;
        end if;
    end loop;
    
end $$
delimiter ;

##-----PROCEDURI PENTRU POPULAREA AVIOANELOR SI A PERSONALULUI-----

alter table personal
modify column id_personal int auto_increment;
alter table avioane
modify column id_avion int auto_increment;
alter table avioane auto_increment = 0;
alter table personal auto_increment = 0;

drop procedure if exists populare_avioane;
delimiter $$
create procedure populare_avioane(id_echipaj int, nr_start int, nr_final int, id_companie int) 
begin 
    declare i int default nr_start;
    
    declare nume varchar(20);
    declare tipp varchar(20);
    declare capacitatee varchar(20);
    loop_1: LOOP
        set i=i+1;
        select capacitate from tipuri_avioane where id_companie = tipuri_avioane.id_companie order by rand() limit 1 into capacitatee;
        select tip from tipuri_avioane where tipuri_avioane.capacitate = capacitatee into tipp;
        select name from tipuri_avioane where tipuri_avioane.capacitate = capacitatee into nume;
        insert into avioane(nume, id_echipaj, tip, capacitate, id_companie)
        values (nume, id_echipaj, tipp, capacitatee, id_companie);
        if(i = nr_final) then
        leave loop_1;
        end if;
    end loop;
    
end $$
delimiter ;

drop procedure if exists populare_personal;
delimiter $$
create procedure populare_personal(id_echipaj int, nr_start int, nr_final int, id_companie int) 
begin 
    declare i int default nr_start;
    declare nume varchar(20);
    declare prenume varchar(20);
    declare func varchar(20);
    loop_1: LOOP
        set i=i+1;
        select first from first_names order by rand() limit 1 into nume;
        select last from last_names order by rand() limit 1 into prenume;
        select functie from functii order by rand() limit 1 into func;
        insert into personal(id_echipaj, nume, prenume, functie, id_companie)
        values (id_echipaj, nume, prenume, func, id_companie);
        if(i = nr_final) then
        leave loop_1;
        end if;
    end loop;
    
end $$
delimiter ;

##-------PROCEDURA POPULARE DUTY FREE SI PERSONAL AEROPORT-------

drop procedure if exists populare_duty;
delimiter $$
create procedure populare_duty(nr_start int, nr_final int) 
begin 
    declare i int default nr_start;
    declare nume varchar(20);
    
    declare tip_magazin varchar(20);
    declare ora_deschidere time;
    declare ora_inchidere time;
    loop_1: LOOP
        set i=i+1;
        select duty.uc from duty where duty.id = i into nume;
        select duty.tip from duty where duty.id = i into tip_magazin;
        select duty.ora_d from duty where duty.id = i into ora_deschidere;
        select duty.ora_i from duty where duty.id = i into ora_inchidere;
        insert into duty_free (nume, ora_deschidere, ora_inchidere, tip_magazin)
        values (nume, ora_deschidere, ora_inchidere, tip_magazin);
        if(i = nr_final) then
        leave loop_1;
        end if;
    end loop;
    
end $$
delimiter ;

drop procedure if exists populare_personal_aeroport;
delimiter $$
create procedure populare_personal_aeroport(nr_start int, nr_final int) 
begin 
    declare i int default nr_start;
    declare nume varchar(20);
    declare prenume varchar(20);
    declare CNP varchar(13);
    declare functie varchar(20);
    declare salariu varchar(20);
    loop_1: LOOP
        set i=i+1;
        select first from first_names order by rand() limit 1 into nume;
        select last from last_names order by rand() limit 1 into prenume;
        select id from CNPS order by rand() limit 1 into CNP;
        select nume from functii_aeroport order by rand() limit 1 into functie;
        select val from salarii order by rand() limit 1 into salariu;
        insert into personal_aeroport(nume, prenume, CNP, functie, salariu, id_supervizor)
        values (nume, prenume, CNP, functie, salariu, '1');
        if(i = nr_final) then
        leave loop_1;
        end if;
    end loop;
    
end $$
delimiter ;

##------PROCEDURI ADAUGARE REVIEW PERSONAL SI DUTY FREE------

drop procedure if exists descifrare_review_personal;
delimiter $$

create procedure descifrare_review_personal(nume varchar(20), prenume varchar(20), comentariul varchar(100)) 
begin 
    declare id_pers int;
    select personal_aeroport.id_angajat into id_pers from personal_aeroport 
    where personal_aeroport.nume=nume and personal_aeroport.prenume=prenume;

    insert into reviews(id_angajat, comentariu)
    values( id_pers, comentariul);

end $$
delimiter ;

drop procedure if exists descifrare_review_uc;
delimiter $$
create procedure descifrare_review_uc(nume varchar(20), comentariul varchar(100)) 
begin 
    declare id_unit int;
    select duty_free.id_uc into id_unit from duty_free 
    where duty_free.nume=nume;

    insert into reviews(id_uc, comentariu)
    values( id_unit, comentariul);

end $$
delimiter ;



Cod Triggere


Populare client after înregistrare 

CREATE DEFINER=`root`@`localhost` TRIGGER `inregistrare_AFTER_INSERT` AFTER INSERT ON `inregistrare` FOR EACH ROW BEGIN
    insert into clientt (nume, prenume, nr_telefon, id_inregistrare)
    values (new.nume, new.prenume, new.nr_telefon, new.id_inregistrare);
END


Calcul preț final 

CREATE DEFINER=`root`@`localhost` TRIGGER `tranzactie_BEFORE_INSERT` BEFORE INSERT ON `tranzactie` FOR EACH ROW BEGIN
   


   if(SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())  < 7) then
    set new.pret_final=(select bilete.pret from bilete, zboruri where bilete.id_bilet = new.id_bilet and  bilete.id_zbor = zboruri.id_zbor) ;
    end if;
    if(SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())  < 14 and (SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())>= 7)) then
    set new.pret_final=(select bilete.pret from bilete, zboruri where bilete.id_bilet = new.id_bilet and  bilete.id_zbor = zboruri.id_zbor)*0.95 ;
    end if;
    if(SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())  < 21 and (SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())>= 14)) then
    set new.pret_final=(select bilete.pret from bilete, zboruri where bilete.id_bilet = new.id_bilet and  bilete.id_zbor = zboruri.id_zbor)*0.90 ;
    end if;
    if(SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())  < 30 and (SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())>= 21)) then
    set new.pret_final=(select bilete.pret from bilete, zboruri where bilete.id_bilet = new.id_bilet and  bilete.id_zbor = zboruri.id_zbor)*0.85 ;
    end if;
    if(SELECT DATEDIFF((Select zboruri.data_plecare from zboruri, bilete where zboruri.id_zbor=bilete.id_zbor and bilete.id_bilet=new.id_bilet), curdate())  >= 30) then
    set new.pret_final=(select bilete.pret from bilete, zboruri where bilete.id_bilet = new.id_bilet and  bilete.id_zbor = zboruri.id_zbor)*0.80 ;
    end if;
    set new.data_achizitie = curdate();
END


Populare bilete after insert on Zboruri 

CREATE DEFINER=`root`@`localhost` TRIGGER `zboruri_AFTER_INSERT` AFTER INSERT ON `zboruri` FOR EACH ROW BEGIN
    declare n int;
    declare cap int;
    select new.id_zbor into n;
    select avioane.capacitate into cap from avioane where new.id_avion = avioane.id_avion;
    if(select distinct companie.nume from companie, avioane where new.id_avion = avioane.id_avion and avioane.id_companie = companie.id_companie) = 'Etihad' then 
    call populare_bilete('economy', n, 0, cap/3, 300, 'de mana');
    call populare_bilete('business', n, 0, cap/3, 400, 'cala');
    call populare_bilete('first class', n, 0, cap/3, 500, 'orice');
    end if;
    if(select distinct companie.nume from companie, avioane where new.id_avion = avioane.id_avion and avioane.id_companie = companie.id_companie) = 'Fly Emirates' then 
    call populare_bilete('economy', n, 0, cap/3, 500, 'de mana');
    call populare_bilete('business', n, 0, cap/3, 700, 'cala');
    call populare_bilete('first class', n, 0, cap/3, 900, 'orice');
    end if;
    if(select distinct companie.nume from companie, avioane where new.id_avion = avioane.id_avion and avioane.id_companie = companie.id_companie) = 'Wizz Air' then 
    call populare_bilete('economy', n, 0, cap/3, 150, 'de mana');
    call populare_bilete('business', n, 0, cap/3, '350', 'cala');
    call populare_bilete('first class', n, 0, cap/3, 450, 'orice');
    end if;
END


Populare avioane și personal after insert on Companie

CREATE DEFINER=`root`@`localhost` TRIGGER `companie_AFTER_INSERT` AFTER INSERT ON `companie` FOR EACH ROW BEGIN
    declare n int;
    select new.id_companie into n;
    if(select new.nume = 'Etihad') then
    call populare_avioane(n, '0', new.nr_avioane, n); 
    call populare_personal(n, '0', new.nr_angajati, n); 
    end if;
    if(select new.nume = 'Fly Emirates') then
    call populare_avioane(n, '0', new.nr_avioane, n);
    call populare_personal(n, '0', new.nr_angajati, n); 
    end if;
    if(select new.nume = 'Wizz Air') then
    call populare_avioane(n, '0', new.nr_avioane, n); 
    call populare_personal(n, '0', new.nr_angajati, n); 
    end if;
END
