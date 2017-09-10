include ../libs/print.lib.make

.PHONY: help up down build ibuild shell compile install update clean

#------------------------------
# vars
#------------------------------

requirements := base
requirements_dir := requirements

# a list of all .in files
requirement_files = $(wildcard $(requirements_dir)/*.in)

# a list of .txt files for each .in (will be used to create .txt files)
requirement_file_outputs := $(requirement_files:.in=.txt)

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
	@$(call print_help, "clean", "delete all requirement text files")

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

#------------------------------
# compile
# builds all .txt files
#------------------------------

compile: $(requirement_file_outputs)

# recipes for how to build .txt files
%.txt: %.in
	@docker-compose run --rm web pip-compile -v --output-file $@ $<

# dependencies
$(requirements_dir)/test.txt: $(requirements_dir)/base.txt

#------------------------------
# install
#------------------------------

install:
	@$(call print_info,"installing $(requirements) requirements...")
	@docker-compose run -u root:root --rm web pip install -r $(requirements_dir)/$(requirements).txt

update: compile install

#------------------------------
# clean
# deletes all .txt files
# (run before ``make compile`` to force update all dependencies)
#------------------------------

clean:
	@$(call print_info,"deleting all requirement text files...")
	@rm -f $(requirements_dir)/*.txt
