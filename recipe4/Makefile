include ../libs/print.lib.make

.PHONY: help up down build ibuild shell compile update install

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
	@$(call print_help, "compile", "recompile dependency packages")
	@$(call print_help, "install", "install dependency packages")
	@$(call print_help, "update", "recompile & install dependency packages")

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

compile:
	@$(call print_info,"compiling requirements text file...")
	@docker-compose run -u $(user):$(group) --rm web pip-compile -v --output-file 'requirements.txt' 'requirements.in'

install:
	@$(call print_info,"installing requirements...")
	@docker-compose run -u root:root --rm web pip install -r requirements.txt

update: compile install
