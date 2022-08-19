run-db:
	docker run --name dev_postgres -p 5432:5432 -e POSTGRES_PASSWORD=password -e POSTGRES_DB=dev -v ${PWD}/db_data:/var/lib/postgresql/data -d postgres