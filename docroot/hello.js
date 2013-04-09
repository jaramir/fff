"use strict";

define(function() {
    return {
	greet: function(name) {
	    return "Hello " + (name ? name : "World") + "!";
	}
    };
});

