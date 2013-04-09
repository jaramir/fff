require(["hello"], function(hello) {
    var greetings = document.createElement("h1");
    greetings.innerHTML = hello.greet();
    document.body.appendChild(greetings);
});
