# **IPL Database Project**

This repository contains all SQL scripts and required zipped data files for IPL data analysis.  
**All steps below are terminal commands.**

## Install PostgresSQL from the Terminal

On Ubuntu/Linux:
```
sudo apt update
sudo apt install postgresql postgresql-contrib
```

## Start/Enable PostgreSQL Server

On Linux (Ubuntu):
```
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

##  Access the PostgreSQL Command Line Interface (psql)

Switch to the postgres user on Linux and start the PostgreSQL interactive terminal:
```
sudo -i -u postgres
psql
```
To Create Database
```
CREATE DATABASE ipl;
```
Alter Databse Owner
```
alter database ipl owner to laxman;
```

Or if you are already a user with database access, just run:
```
psql -U username -d database_name
```
Drop Database or user
```
drop database ipl;                         --delete ipl
drop user username;                         -- delete role username
```

For example:
```
psql -U laxman -d ipl
```

Basic psql commands inside terminal

To list databases:
```
\l
```

To connect to a database:
```
\c database_name
```

To list tables:
```
\dt
```

To quit psql:
```
\q
```
## Folder Structure
```
.
├── problem/ # All SQL scripts here
│ └── *.sql
├── required_data/ # Zipped datasets
│ ├── deliveries.zip
│ ├── matches.zip
│ └── umpires.zip
├── README.md
└── .gitignore
```

## Quick Start

### 1. Clone the Repository

git clone:- https://github.com/laxmansingh2397/data-project-database.git

cd data-project-database

Or Download the zip file

### 2. Unzip Data Files

cd required_data

unzip deliveries.zip

unzip matches.zip

unzip umpires.zip
cd ..

You should now have deliveries.csv, matches.csv, and umpires.csv in required_data/


### 3. Start PostgreSQL and Create User & Database

Open the terminal and start a PostgreSQL session as a superuser. All commands written above

psql

Then execute the following in the psql prompt:
```
CREATE ROLE laxman SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD NULL REPLICATION;
CREATE DATABASE ipl;
ALTER DATABASE ipl OWNER TO laxman;
\q
```

### 4. Create Tables and Import Data

Login as the new user and run the schema and import commands:

psql -U laxman -d ipl


Then in the psql prompt, run (you can copy-paste all together or run one by one):

-- Create tables
```
CREATE TABLE deliveries (match_id INT, inning INT, batting_team TEXT, bowling_team TEXT, over INT, ball INT, batsman TEXT, non_striker TEXT, bowler TEXT, is_super_over INT, wide_runs INT, bye_runs INT, legbye_runs INT, noball_runs INT, penalty_runs INT, batsman_runs INT, extra_runs INT, total_runs INT, player_dismissed TEXT, dismissal_kind TEXT, fielder TEXT );
```
```
CREATE TABLE matches (id SERIAL, season INTEGER, city VARCHAR(30), date DATE, team1 VARCHAR(50), team2 VARCHAR(50), toss_winner VARCHAR(50), toss_decision VARCHAR(10), result VARCHAR(10), dl_applied INTEGER, winner VARCHAR(50), win_by_runs INTEGER, win_by_wickets INTEGER, player_of_match VARCHAR(50), venue VARCHAR(100), umpire1 VARCHAR(30), umpire2 VARCHAR(30), umpire3 VARCHAR(30));
```
```
CREATE TABLE umpires (umpire VARCHAR(100), country VARCHAR(30));
```

-- Import data (update path if needed)
```
\copy deliveries from 'required_data/deliveries.csv' with (FORMAT csv, HEADER True)
```
```
\copy matches from 'required_data/matches.csv' with (FORMAT csv, HEADER True)
```
```
\copy umpires from 'required_data/umpires.csv' with (FORMAT csv, HEADER True)
```

### 5. Run The SQL Scripts

**From the project root directory (exit psql client first), run any script using:**
```
psql -U laxman -d ipl -f problem/<your-script-file>.sql
```
For example:
psql -U laxman -d ipl -f problem/top_ten_economical_bowler_in_2015.sql

### 6. Cleaning up

If you want to remove the test database and user:
```
psql
-- Then, in the prompt:
DROP DATABASE ipl;
DROP USER laxman;
\q
```
---

## Notes

- All imports and scripts should be run **from the project directory** for path correctness.
- If you get permissions errors, check folder/file permissions or run `psql` with `sudo -u postgres`.
- If anything is unclear, please see the script comments for further instructions.

---
