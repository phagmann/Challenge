
// Whole thing goes backwards...do tree tomorrow


function LinkedList(){
    this.list = null;
    this.length =0
}

LinkedList.prototype.add = function(value){
    var node = {
        value: value,
        next: null
    };
    if(this.list === null){
        this.list = node;
    } else {
        node.next = this.list;
        this.list = node;

    };
    this.length++
    return node;
};

LinkedList.prototype.position = function(pos){
    var start = this.list
    for (i = 0; i < pos; i++){
        start = start.next;
    }
    return start;
}

LinkedList.prototype.insert = function(value,position){
    var node = {
        value: value,
        next: null
    };
    if (position == 0){
        this.add(value)
        return
    }
    previousNext = this.position(position);
    node.next = previousNext;
    this.position(position-1).next = node;
    this.length++


}

LinkedList.prototype.removeAt = function(position){
    if (position == 0){
        this.list = this.list.next;
        this.length--;
        return;
    }
    this.position(position-1).next = this.position(position).next
    this.length--;
}
LinkedList.prototype.chompOffAt = function(position){
    if (position == 0){
        this.list = this.list.next;

        this.length--;
        return;
    }
    this.list = this.position(position).next
    this.length = this.length - position - 1;
}

var q = new LinkedList();
q.add(7);
q.add(5);
q.add(13);
q.add(27);
for ( i = 0; i < q.length; i++) {
    debug(q.position(i).value);
};
debug("")
q.insert(1,1)
for ( ii = 0; ii < q.length; ii++) {
    debug(q.position(ii).value);
};
debug("")
q.chompOffAt(2)
for ( iii = 0; iii < q.length; iii++) {
    debug(q.position(iii).value);
};