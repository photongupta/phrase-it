#! /bin/bash

sqlite3 $1 << 'END_SQL'

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  avatar_url TEXT
);
DROP TABLE IF EXISTS stories;
CREATE TABLE stories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  created_by INTEGER NOT NULL,
  content TEXT NOT NULL,
  is_published INTEGER DEFAULT 0,
  last_modified TIMESTAMP NOT NULL
);
DROP TABLE IF EXISTS published_stories;
CREATE TABLE published_stories (
  story_id INTEGER PRIMARY KEY,
  published_at TIMESTAMP NOT NULL,
  views INTEGER DEFAULT 0
);
DROP TABLE IF EXISTS claps;
CREATE TABLE claps (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  story_id INTEGER NOT NULL,
  clapped_by INTEGER NOT NULL
);
DROP TABLE IF EXISTS responses;
CREATE TABLE responses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  response_on INTEGER NOT NULL,
  responded_by INTEGER NOT NULL,
  responded_at TIMESTAMP NOT NULL,
  response TEXT NOT NULL
);
DROP TABLE IF EXISTS followers;
CREATE TABLE followers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  follower_id INTEGER NOT NULL
);
DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  story_id INTEGER NOT NULL,
  tag TEXT NOT NULL
);

END_SQL
