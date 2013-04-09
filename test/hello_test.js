"use strict";

var assert = require("assert")
var hello = require("../docroot/hello")

describe('Hello', function(){
    it('greets the World by default', function(){
	assert.equal("Hello World!", hello.greet());
    });
    it('can greet John', function(){
	assert.equal("Hello John!", hello.greet("John"));
    });
});
