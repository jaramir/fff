NODE_BIN = node_modules/.bin
SERVER = $(NODE_BIN)/static
CACHE = 0
PORT = 9000

MOCHA = $(NODE_BIN)/mocha
MOCHA_REPORTER = list

BOWER = $(NODE_BIN)/bower
JS_LIBS = docroot/libs

run: node_modules $(JS_LIBS)
	$(SERVER) -p $(PORT) -c $(CACHE) docroot

test: node_modules
	$(MOCHA) --reporter $(MOCHA_REPORTER)

watch: node_modules
	$(MOCHA) --watch --reporter $(MOCHA_REPORTER)

install: node_modules $(JS_LIBS)

node_modules: package.json
	npm install

$(JS_LIBS): bower

bower: node_modules
	$(BOWER) install

clean:
	rm -r node_modules
	find -name "*~" -delete

.PHONY: run test install clean
