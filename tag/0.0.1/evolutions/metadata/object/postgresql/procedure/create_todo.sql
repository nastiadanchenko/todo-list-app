CREATE OR REPLACE FUNCTION todo_app.create_todo(p_id text, p_todo_title text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
v_result function_result;
  begin
  if p_todo_title is null then 
  	return as_result(set_message (v_result, 'Message', 'Поле не может быть пустым!', 'WARN'));
  else
  	if p_id is null or p_id = '' then
  		insert into todo_app.todo_list(id, title, status)
   		values(nextval('todo_app.todo_list_id_seq'), p_todo_title, false);
   		return v_result := set_next_event(v_result, 'update_close');
  	else
		UPDATE todo_app.todo_list
    	SET title = p_todo_title
    	where id = p_id::int;
        return v_result := set_next_event(v_result, 'update_close');
     end if;
  end if;
 end;
$function$
;
