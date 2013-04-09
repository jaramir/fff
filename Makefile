NODE_BIN = node_modules/.bin
SERVER = $(NODE_BIN)/static
PORT = 9000

MOCHA = $(NODE_BIN)/mocha
MOCHA_REPORTER = list

run: node_modules
	$(SERVER) -p $(PORT) docroot

test: node_modules
	$(MOCHA) --reporter $(MOCHA_REPORTER)

install: node_modules

node_modules: package.json
	npm install

clean:
	rm -r node_modules
	find -name "*~" -delete

.PHONY: run test install clean
