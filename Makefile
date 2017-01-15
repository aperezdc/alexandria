ifeq ($(strip $(APP_ID)),)
  APP_ID := org.perezdecastro.Alexandria
endif

all: $(APP_ID).gresource

RESOURCE_FILES := $(wildcard gtk/*.ui)

$(APP_ID).gresource: $(APP_ID).gresources.xml $(RESOURCE_FILES)
	glib-compile-resources --target=$@ $<

run: $(APP_ID).gresource
	__ALEXANDRIA_DEVELOPMENT=1 ./alexandria $(FILE)

.PHONY: run
