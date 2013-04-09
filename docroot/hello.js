"use strict";

if (typeof define !== 'function') { var define = require('amdefine')(module) }

define(function() {
    return {
	greet: function(name) {
	    return "Hello " + (name ? name : "World") + "!";
	}
    };
});
