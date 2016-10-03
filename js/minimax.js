


function Tree(){
    this.currentNode = null;
    this.size =0;
}
Tree.prototype.nowVisted = function(index){
    this.currentNode.visted = true;
}
Tree.prototype.ifVisted = function(index){
    if (this.currentNode.visted == true){
        return true
    }
    else{
        return false
    }
}

Tree.prototype.PreviousNodeAt = function(index){
     return this.currentNode.previous[index]
     
}
Tree.prototype.PreviousSetLength = function(){
    return this.currentNode.previous.length
}
Tree.prototype.firstPreviousOpen = function(){
    for (i=0; i < this.currentNode.previous.length; i++){
        
        if (this.PreviousNodeAt(i).visted == false){
            this.currentNode = this.PreviousNodeAt(i)
            return;
        }
    }
    return;
}
Tree.prototype.ScoutFirstPreviousOpen = function(){
    for (i=0; i < this.currentNode.previous.length; i++){
        
        if (this.PreviousNodeAt(i).visted == false){
            return this.PreviousNodeAt(i)
        }
    }
    return;
}
Tree.prototype.firstPreviousOpenVisted = function(){
    this.ScoutFirstPreviousOpen().visted == true;

}
Tree.prototype.ifAllPrevVisted = function(){
    if(this.currentNode.previous === null){
        return true;
    }
    for (i=0; i < this.currentNode.previous.length; i++){
        if (this.PreviousNodeAt(i).visted == false){
            return false;
        }
    }
    return true;
}
Tree.prototype.PreviousValues = function(){
    var set = []
    for (i=0; i < this.currentNode.previous.length; i++){
        set.push(this.PreviousNodeAt(i).value)



    }
    return set
}
// Tree.prototype.firstPrevious = function(index){
//     this.currentNode.visted = true;
// }

Tree.prototype.Next = function(){
    this.currentNode = this.currentNode.next
}

Tree.prototype.Value = function(){
    return this.currentNode.value
}

Tree.prototype.newadd = function(value){
    var node = {
        value: value,
        next: null,
        previous: [],
        visted: false

    };
    if(this.currentNode === null){
        this.currentNode = node;
        this.size++
        return;
    } 
    
    
    node.next = this.currentNode;
    this.currentNode.previous.push(node)
    this.size++
    this.currentNode = node
    return;
}

Tree.prototype.add = function(value){
    var node = {
        value: value,
        next: null,
        previous: [],
        visted: false
    };
       
    node.next = this.currentNode;
    this.currentNode.previous.push(node)
    this.size++
    return;
};


Tree.prototype.getDepth = function(){
    var start = this.currentNode;
    var depth = 1;
    while (start.next !== null){
        start = start.next;
        depth++
    }
    return depth;
}



function rand(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
function maxmin (list, depth){
    // debug(list)
    //Math.min.apply(Math, list)
    if (depth % 2 == 1){
        
        return Math.max.apply(Math, list) 
      }
    else{
        
        return Math.min.apply(Math, list)
    }
}
function makeRandomTree (childern, depth){
    var q = new Tree();
    q.newadd();
    var path = [q.Value()];
    var countdown = childern; //how many childern for starting point
    // debug(q.Value())
      while( countdown > 0){

          if (q.PreviousSetLength() < childern && q.getDepth() < depth - 1 ){
            q.nowVisted();
            q.newadd();
            path.push(q.Value());
            // debug(q.Value())
            continue;
          }        
          else if ( q.getDepth() >= depth - 1){
            for ( var z=0; z < childern; z++){
                var r = rand(1,100)
                q.add(r)
                path.push(r);
                q.firstPreviousOpenVisted()
                // debug(q.ScoutFirstPreviousOpen().value)
            }
            q.currentNode.value = maxmin(q.PreviousValues(), q.getDepth() )
            //debug(q.Value())
            q.Next();
          }
          else{
            q.currentNode.value = maxmin(q.PreviousValues(), q.getDepth())
            
            q.Next();

              };
         
         if (q.currentNode.next === null){
            countdown--
            
            q.currentNode.value = maxmin(q.PreviousValues(), q.getDepth())
            //debug(q.Value())
            if(countdown <= 0){
                 
                debug(q.Value())
                return path;
            }
            q.nowVisted();
            q.newadd();
            path.push(q.Value());
            // debug(q.Value())
         }
      }
      return path;

            }



var q = new Tree();







// debug(dfs(q))
debug("")
makeRandomTree (80, 3)
// (childern, depth)
//code breaks if depth = 2

