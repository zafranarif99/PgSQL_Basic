
create table Location (
	id          serial primary key,
	state       varchar(50),  -- not every country has states
	country     varchar(50) not null
);

create table Taster (
	id          serial primary key,
	family      varchar(30),  -- some people have only one name
	given       varchar(30) not null,  
	livesIn     integer not null references Location(id)
);

create table Brewer (
	id          serial primary key,
	name        varchar(50) not null,
	locatedIn   integer not null references Location(id)
);

create table BeerStyle (
	id          serial primary key,
	name        varchar(30) not null
);

create table Beer (
	id          serial primary key,
	name        varchar(50) not null,
	style       integer not null references BeerStyle(id),
	brewer      integer not null references Brewer(id),
	totRating   integer default 0,
	nRatings    integer default 0,
	rating      float
);

create table Ratings (
	taster      integer not null references Taster(id),
	beer        integer not null references Beer(id),
	score       integer not null
	            constraint validRating
		    check (score >= 1 and score <= 5)
);

