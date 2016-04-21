-- users for login/register purposes
create table users(
	email varchar(40),
	passwd  char(32),
	pid SERIAL,
	ign varchar(10)
	PRIMARY KEY (pid)
);

--List of Task
create table task(
	taskID SERIAL,
	taskToDo text,
	building varchar(20),
	PRIMARY KEY(taskid),
	foreign key(building) references building(name)
);

-- In game info (tile location etc)
create table inGamePlayer(
	ign varchar(10),
	xcoord integer,
	ycoord integer,
	turnid integer,  	
	roomid BIGINT,   
	pid BIGINT,
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES users(pid) ON DELETE CASCADE,
	foreign key (ign) references users(ign),
	FOREIGN KEY (roomid) REFERENCES playerroom(roomID)
);


-- The gameroom containing start/end time, #players, winner, whose turn, and roomid
create table playerRoom(
	roomid SERIAL,
	roomCount integer,
	startTime timestamp without time zone default (now() at time zone 'utc'),
	endTime timestamp without time zone,
	gameWinner BIGINT,
	PRIMARY KEY (roomid),
	FOREIGN KEY (gameWinner) REFERENCES users(pid)
);

-- table to keep track of current turn
create table ingameroom(
	roomid bigint,
	currentturn integer,
	primary key(roomid,currentturn),
	foreign key(roomid) references playerroom(roomid)
);
-- table to check whether all players are ready
create table inRoomStatus(
	pid BIGINT,
	roomid BIGINT,
	readyState boolean,
	PRIMARY KEY (pid,roomid),
	FOREIGN KEY (pid) REFERENCES users(pid),
	FOREIGN KEY (roomid) REFERENCES playerRoom(roomid) ON DELETE CASCADE
);


--buildings for ingame map generation
create table inGameBuilding(
	name varchar(20),
	location text,
	entrance varchar(5),
	color varchar(12),
	height varchar(5),
	PRIMARY KEY (name),
);




