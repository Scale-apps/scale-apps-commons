# Define the source and destination folders
ELIXIR_FOLDER := ../phx-boilerplate/lib/web
FLASK_FOLDER := ../flask-boilerplate/web
SHARED_FOLDER := ./shared/web

# Define the Bash script to perform the copy operation
SCRIPT := copy_files.sh

# Target to copy files with the same names
sync_elixir:
	$(eval SOURCE_FOLDER := $(ELIXIR_FOLDER))
	$(eval DESTINATION_FOLDER := $(SHARED_FOLDER))
	@./$(SCRIPT) "$(SOURCE_FOLDER)" "$(DESTINATION_FOLDER)"
	@echo "Updating Flask"
	@cp -R $(SHARED_FOLDER)/* $(FLASK_FOLDER)/

sync_flask:
	$(eval SOURCE_FOLDER := $(FLASK_FOLDER))
	$(eval DESTINATION_FOLDER := $(SHARED_FOLDER))
	@./$(SCRIPT) "$(SOURCE_FOLDER)" "$(DESTINATION_FOLDER)"
	@echo "Updating Elixir"
	@cp -R $(SHARED_FOLDER)/* $(ELIXIR_FOLDER)/
