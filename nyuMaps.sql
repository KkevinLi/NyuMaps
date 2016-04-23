-- users for login
create table users(
	email varchar(40),
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
<<<<<<< HEAD
	pid BIGINT,
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES users(pid) ON DELETE CASCADE

=======
	turnid integer,  	
	roomid BIGINT,   
	pid BIGINT,
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES users(pid) ON DELETE CASCADE,
	foreign key (ign) references users(ign),
	FOREIGN KEY (roomid) REFERENCES playerroom(roomID)
>>>>>>> 2a7334f50d863c23792866c36d653c9ef17c9d82
);


-- The game room containing start/end time, #players, winner, whose turn, and roomid
create table playerRoom(
	roomid SERIAL,
	roomCount integer,
<<<<<<< HEAD
	currentTurn BIGINT,
=======
>>>>>>> 2a7334f50d863c23792866c36d653c9ef17c9d82
	startTime timestamp without time zone default (now() at time zone 'utc'),
	endTime timestamp without time zone,
	gameWinner BIGINT,  -- ID of person who won
	PRIMARY KEY (roomid),
<<<<<<< HEAD
	FOREIGN KEY (currentTurn) REFERENCES users(pid),
	FOREIGN KEY (gameWinner) REFERENCES users(pid),
	FOREIGN KEY (currentTurn) REFERENCES users(pid)
=======
	FOREIGN KEY (gameWinner) REFERENCES users(pid)
>>>>>>> 2a7334f50d863c23792866c36d653c9ef17c9d82
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

<<<<<<< HEAD
-- Building (static info to generate all locations) 
create table building(
	name varchar(30),
	xcoord integer,
	ycoord integer,
	quantity integer,
	PRIMARY KEY (name)
	
);
-- Table for ingame use where the quantity gets modified 
create table inGameBuilding(
	name varchar(30),
	xcoord integer,
	ycoord integer,
	quantity integer,
	roomid BIGINT,
	PRIMARY KEY (name,roomid),
	FOREIGN KEY (roomid) REFERENCES playerRoom(roomid) ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES building(name)
	
);

*/
=======

--buildings for ingame map generation
create table inGameBuilding(
	name varchar(20),
	location text,
	entrance varchar(5),
	color varchar(12),
	height varchar(5),
	PRIMARY KEY (name),
);




>>>>>>> 2a7334f50d863c23792866c36d653c9ef17c9d82
