include ../libs/print.lib.make

.PHONY: help up down build ibuild shell

#------------------------------
# vars
#------------------------------

user 	:= $$( id -u $$USER )
group := $$( id -g $$USER )

#------------------------------
# help
#------------------------------

help:
	@$(call print_help, "up", "start container")
	@$(call print_help, "down", "destroy container")
	@$(call print_help, "build", "build container")
	@$(call print_help, "buildup", "build and start container")
	@$(call print_help, "shell", "enter container shell")
	@$(call print_help, "shellme", "enter container shell (as host user)")

#------------------------------
# commands
#------------------------------

up:
	@docker-compose up

down:
	@docker-compose down

build:
	@docker-compose build

buildup:
	@docker-compose up --build

shell:
	@docker-compose run --rm web bash

shellme:
	@docker-compose run -u $(user):$(group) --rm web bash
