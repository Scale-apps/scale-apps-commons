# Define the source and destination folders
ELIXIR_FOLDER := ../phx-boilerplate
FLASK_FOLDER := ../flask-boilerplate
SHARED_FOLDER := ./shared

# Define the Bash script to perform the copy operation
SCRIPT := copy_files.sh

# Target to copy files with the same names
sync_elixir:
	$(eval SOURCE_FOLDER := $(ELIXIR_FOLDER))
	$(eval DESTINATION_FOLDER := $(SHARED_FOLDER))
	@./$(SCRIPT) "$(SOURCE_FOLDER)" "$(DESTINATION_FOLDER)"
	@echo "Updating Flask"
	$(eval SOURCE_FOLDER := $(SHARED_FOLDER))
	$(eval DESTINATION_FOLDER := $(FLASK_FOLDER))
	@./$(SCRIPT) "$(SOURCE_FOLDER)" "$(DESTINATION_FOLDER)"

sync_flask:
	$(eval SOURCE_FOLDER := $(FLASK_FOLDER))
	$(eval DESTINATION_FOLDER := $(SHARED_FOLDER))
	@./$(SCRIPT) "$(SOURCE_FOLDER)" "$(DESTINATION_FOLDER)"
	@echo "Updating Elixir"
	$(eval SOURCE_FOLDER := $(SHARED_FOLDER))
	$(eval DESTINATION_FOLDER := $(ELIXIR_FOLDER))
	@./$(SCRIPT) "$(SOURCE_FOLDER)" "$(DESTINATION_FOLDER)"
