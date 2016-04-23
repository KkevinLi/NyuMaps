-- users for login
create table users(
	email varchar(40),
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
	xcoord integer,
	ycoord integer,
	pid BIGINT,
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES users(pid) ON DELETE CASCADE

);


-- The game room containing start/end time, #players, winner, whose turn, and roomid
create table playerRoom(
	roomid SERIAL,
	roomCount integer,
	currentTurn BIGINT,
	startTime timestamp without time zone default (now() at time zone 'utc'),
	endTime timestamp without time zone,
	gameWinner BIGINT,  -- ID of person who won
	PRIMARY KEY (roomid),
	FOREIGN KEY (currentTurn) REFERENCES users(pid),
	FOREIGN KEY (gameWinner) REFERENCES users(pid),
	FOREIGN KEY (currentTurn) REFERENCES users(pid)
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
