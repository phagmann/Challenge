 b
// do tree tomorrow


function LinkedList(){
    this.list = null;
    this.size =0;
    this.depth = 0;
}


LinkedList.prototype.add = function(value){
    var node = {
        value: value,
        next: null,
        previous: []
    };
    if(this.list === null){
        this.list = node;
        this.depth++
    } 
    else if( this.list.previous.length == 0) {
        
        node.next = this.list;
        this.list.previous.push(node)
        this.depth++
    }
    else{
        
        node.next = this.list;
        this.list.previous.push(node)
    }
    this.size++
    return node;
};

LinkedList.prototype.getDepth = function(){
    var start = this.list;
    var depth = 0;
    while (start.next !== null){
        start = start.next;
        depth++
    }
    return depth;
}
LinkedList.prototype.findPreviousNodeAt = function(index){
    return this.list.previous[index]


}



var q = new LinkedList();
q.add(7);
q.add(5);
q.add(13);
q.add(27);

debug(q.list.value)
debug(q.findPreviousNodeAt(0).value)
debug(q.findPreviousNodeAt(1).value)
debug(q.findPreviousNodeAt(2).value)
debug(q.size)
debug(q.getDepth())
debug("")
// for ( i = 0; i < q.size; i++) {
//     debug(q.position(i).value);
// };
debug("")
// q.insert(1,1)
// debug(q.list.value)
// debug(q.list.next.value)
// debug(q.list.next.next.value)
// debug(q.list.next.next.previous.value)
// debug("")
// for ( ii = 0; ii < q.size; ii++) {
//     debug(q.position(ii).value);
// };
// debug("")
//q.chompOffAt(1)
// for ( iii = 0; iii < q.size; iii++) {
//     debug(q.position(iii).value);
// };
// debug("")
// ÷
// debug("")