Two Tables Design Recipe Template

USER STORY:

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.

Nouns: blogger, post, title, content, comment, author, name


2. Infer the Table Name and Columns

Record: post
Properties: content, author_name

Name of the first table: posts

Column names: title, content

Name of the second table (always plural): comments

Column names: content, author_name

3. Decide the column types.

Table: posts
id: SERIAL
content: text

Table: comments
id: SERIAL
content: text
author_name: text

4. Decide on The Tables Relationship

To decide on which one, answer these two questions:

Can one post have many comments? (Yes)
Can one comment have many posts? (No)


->Therefore,
->A post has many comments
->A comment belongs to a post
->Therefore, the foreign key is in the table comments




4. Write the SQL.

-- file: blogs_table.sql


CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  author_name text,
  post_id int,
  CONSTRAINT fk_post FOREIGN KEY(post_id)
  REFERENCES posts(id)
  ON DELETE CASCADE
);

5. Create the tables.
psql -h 127.0.0.1 blog < blog_tables.sql