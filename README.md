Full Flat Fail
==============

The better way to fail is to do it fast

TODO
----

* browser tests
* less
* https

DIRECTORY STRUCTURE
-------------------

├── docroot             - web accessible directory
│   ├── index.htm       - browser starting page
│   ├── main.js         - application entry point
│   └── hello.js        - example module
├── test                - test runnable from the command line
│   ├── mocha.js        - test of the test framework
│   └── hello_test.js   - example module test
├── Makefile            - contains all commands
├── package.json        - node project file (server side)
├── component.json      - bower project file (client side)
└── README.md           - this file

COMMANDS
--------

* run server

    make

* run the test once

    make test

* run the test continuosly

    make watch

* download all dependencies

    make install

* remove all downloaded and stranded files

    make clean

