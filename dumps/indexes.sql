create unique index bu_name_idx on bussines_unit(nombre);
create unique index emp_name_idx on party(name,bu_id);
create index name_idx on party(name);
create unique index op_code_idx on operation(code);

exit;
