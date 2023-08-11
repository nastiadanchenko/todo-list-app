
CREATE TABLE todo_app.todo_list (
	id int8 NOT NULL,
	title text NULL,
	status bool NOT NULL DEFAULT false,
	CONSTRAINT todo_list_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE todo_app.todo_list_id_seq
    INCREMENT 1
START 1
OWNED BY todo_app.todo_list.id
;