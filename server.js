#!/usr/bin/env node

var static = require('node-static');
var https = require('https');
var fs = require('fs');

var docroot = process.argv[2];
var port = process.argv[3];

var server = new static.Server(docroot);

var options = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
};

https.createServer(options, function (request, response) {
    server.serve(request, response);
}).listen(port);

console.log('serving "' + docroot + '" at "https://localhost:' + port + '"');
