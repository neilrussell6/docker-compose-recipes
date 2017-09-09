include gmsl

#------------------------------
# vars
#------------------------------

DEFAULT 		:= "\033[0m"
RED 				:= "\033[31m"
GREEN 			:= "\033[32m"
ORANGE 			:= "\033[33m"
BLUE 				:= "\033[34m"
PURPLE 			:= "\033[35m"
LIGHT_BLUE 	:= "\033[36m"

#------------------------------
# helpers
#------------------------------

define print_help
	@if [ $(call strlen,$(1)) -gt 9 ] ; \
		then echo $(LIGHT_BLUE)$(1)"\t"$(PURPLE)$(2) ; \
		else echo $(LIGHT_BLUE)$(1)"\t\t"$(PURPLE)$(2) ; \
  fi
endef

define print_warning
	@echo $(ORANGE)$(1)$(DEFAULT)
endef

define print_danger
	@echo $(RED)$(1)$(DEFAULT)
endef

define print_success
	@echo $(GREEN)$(1)$(DEFAULT)
endef

define print_info
	@echo $(LIGHT_BLUE)$(1)$(DEFAULT)
endef
