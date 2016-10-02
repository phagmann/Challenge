function clone(obj) {
    if (null == obj || "object" != typeof obj) return obj;
    var copy = obj.constructor();
    for (var attr in obj) {
        if (obj.hasOwnProperty(attr)) copy[attr] = obj[attr];
    }
    return copy;
}

var d1 = new Date();

/* Wait for 5 seconds. */
var start = (new Date()).getTime();
while ((new Date()).getTime() - start < 2000);


var d2 = clone(d1);
debug("d1 = " + d1.toString() + "\nd2 = " + d2.toString());