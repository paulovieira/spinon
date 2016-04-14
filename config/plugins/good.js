module.exports = {
    reporters: [{
        reporter: require("good-console"),
        events: {
            //ops: "*",
            log: "*", // maps to the "log" event 
            response: "*", // maps to either the "response" or "tail" event
            error: "*", // maps to the "request-error" event
            request: "*" // maps to the hapi "request" event (generated by request.log())
        }
    }]
}
