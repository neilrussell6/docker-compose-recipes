include ../libs/print.lib.make

.PHONY: help up rebuild run runme shell

#------------------------------
# vars
#------------------------------

USER 		= $$( id -u $$USER )
GROUP 	= $$( id -g $$USER )

#------------------------------
# help
#------------------------------

help:
	@$(call print_help, "up", "run container")
	@$(call print_help, "rebuild", "rebuild and run container")
	@$(call print_help, "run", "run main.sh")
	@$(call print_help, "runme", "run main.sh as host user")
	@$(call print_help, "shell", "enter container shell")

#------------------------------
# commands
#------------------------------

up:
	@$(call print_info,"start container")
	@docker-compose up

rebuild:
	@docker-compose up --build

run:
	@docker-compose run --rm web bash code/main.sh

runme:
	@docker-compose run -u $(USER):$(GROUP) --rm web bash code/main.sh

shell:
	@docker-compose run -u $(USER):$(GROUP) --rm web bash
