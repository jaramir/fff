NODE_MODULES = node_modules
NODE_BIN = $(NODE_MODULES)/.bin
SERVER = $(NODE_BIN)/static
CACHE = 0
PORT = 9000

MOCHA = $(NODE_BIN)/mocha
MOCHA_REPORTER = list

BOWER = $(NODE_BIN)/bower
JS_LIBS = docroot/libs

SHELL = /bin/bash

run: $(NODE_MODULES) $(JS_LIBS)
	$(SERVER) -p $(PORT) -c $(CACHE) docroot

test: $(NODE_MODULES)
	$(MOCHA) --reporter $(MOCHA_REPORTER)

watch: $(NODE_MODULES)
	$(MOCHA) --watch --reporter $(MOCHA_REPORTER)

install: $(NODE_MODULES) $(JS_LIBS)

$(NODE_MODULES): package.json
	npm install

$(JS_LIBS): component.json $(NODE_MODULES)
	$(BOWER) install

clean:
	[ -d node_modules ] && rm -r node_modules || true
	[ -d $(JS_LIBS) ] && rm -r $(JS_LIBS) || true
	find -name "*~" -delete

.PHONY: run test install clean
