NODE_MODULES = node_modules
NODE_BIN = $(NODE_MODULES)/.bin
SERVER = ./server.js
PORT = 9003

MOCHA = $(NODE_BIN)/mocha
MOCHA_REPORTER = list

BOWER = $(NODE_BIN)/bower
JS_LIBS = docroot/libs

SHELL = /bin/bash

run: $(NODE_MODULES) $(JS_LIBS) cert.pem
	$(SERVER) docroot $(PORT)

cert.pem:
	openssl genrsa -out key.pem
	openssl req -new -key key.pem -out csr.pem
	openssl x509 -req -days 365 -in csr.pem -signkey key.pem -out cert.pem
	rm csr.pem

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
