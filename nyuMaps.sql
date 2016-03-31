-- users for login/register purposes
create table users(
	email varchar(40),
	passwd  char(32),
	pid SERIAL,
	PRIMARY KEY (pid)
);

--List of Task
create table task(
	taskID SERIAL,
	taskToDo text,
	PRIMARY KEY(taskid)
);

-- In game info (tile location etc)
create table inGamePlayer(
	ign varchar(10),
	--taskLeft integer,
	xcoord integer,
	ycoord integer,
	myTurn boolean,  		-- Not sure if needed yet, the room keep track of whose turn it is
	taskID BIGINT ,   -- Problem here. Psql does not allow array of PK/FK   atm this only gives us 1 task
	pid BIGINT,
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES users(pid) ON DELETE CASCADE,
	FOREIGN KEY (taskid) REFERENCES task(taskID)
);


-- The gameroom containing start/end time, #players, winner, whose turn, and roomid
create table playerRoom(
	roomid SERIAL,
	roomCount integer,
	currentTurn integer,
	startTime timestamp without time zone default (now() at time zone 'utc'),
	endTime timestamp without time zone,
	gameWinner BIGINT,
	PRIMARY KEY (roomid),
	FOREIGN KEY (currentTurn) REFERENCES users(pid),
	FOREIGN KEY (gameWinner) REFERENCES users(pid)
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


-- Building (static info may merge with inGameBuilding) 
create table building(
	name varchar(30),
	xcoord integer,
	ycoord integer,
	PRIMARY KEY (name)
--Needs building action/quantity 
	
);
create table inGameBuilding(
	name varchar(30),
	xcoord integer,
	ycoord integer,
	roomid BIGINT,
	PRIMARY KEY (name,roomid),
	FOREIGN KEY (roomid) REFERENCES playerRoom(roomid) ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES building(name)
	
);

-- Resource (shared item amongst players? may be field of building...)
create table resources(
	name varchar(30),
	roomid BIGINT,
	xcoord integer,
	ycoord integer,
	PRIMARY KEY (name,roomid),
	FOREIGN KEY (roomid) REFERENCES playerRoom(roomid) ON DELETE CASCADE
	
);



