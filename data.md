# loading data from NOAA into postgres

https://www.ncdc.noaa.gov/cdo-web/datatools/findstation

create table temperature (station varchar(25) not null, name varchar(100), "date" date, tmax smallint, tmin smallint, tobs smallint);

copy temperature from '/opt/git/postgres/1887357.csv' delimiter ',' csv header;

select distinct(station,name),count(*) from temperature where tmax is not null group by 1;

\copy (select date,tmax from temperature where station='USC00241044') to /opt/git/jupyter/notebooks/data/bozeman.csv csv header;
