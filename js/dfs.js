


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






function dfs(tree) {

  var path = [tree.Value()];
  tree.nowVisted();
  debug(tree.Value())
  
  while( tree.currentNode.next !== null || tree.ifAllPrevVisted() == false ){
      
      if ( tree.ifAllPrevVisted() == false ){
        tree.firstPreviousOpen();
        tree.nowVisted();
        path.push(tree.Value());
        debug(tree.Value())
      }
      else{
        tree.Next();
        debug(tree.Value())
          };
  }
  return path;
        }





function makeRandomTree (childern, depth){
    var q = new Tree();
    q.newadd(0);
    var path = [q.Value()];
    var countdown = childern; //how many childern for starting point
    // debug(q.Value())
      while( countdown > 0){
          if (q.PreviousSetLength() < childern && q.getDepth() < depth - 1 ){
            q.nowVisted();
            q.newadd(1);
            path.push(q.Value());
            // debug(q.Value())
            continue;
          }
         
          else if ( q.getDepth() >= depth - 1){
            for ( var z=0; z < childern; z++){
                q.add(5)
                path.push(q.ScoutFirstPreviousOpen().value);
                q.firstPreviousOpenVisted()
                // debug(q.ScoutFirstPreviousOpen().value)
            }
           
            q.Next();
            // debug(q.Value())

            

          }
          else{
            q.Next();

              };
         
         if (q.currentNode.next === null){
            countdown--
            if(countdown <= 0){
                return path;
            }
            q.nowVisted();
            q.newadd(1);
            path.push(q.Value());
            // debug(q.Value())
         }
      }
      return path;

            }



var q = new Tree();

// q.newadd(1);
// q.add(2);
// q.add(3);


// q.newadd(1);

// q.newadd(2);
// q.add(4);
// q.add(5);
// q.Next()
// q.newadd(3);
// q.add(6);
// q.add(7);
// q.Next()

// q.newadd(1);

// q.newadd(2);
// q.newadd(4);
// q.add(8);
// q.add(9);
// q.Next()
// q.newadd(5);
// q.add(10);
// q.add(11);
// q.Next()
// q.Next()
// q.newadd(3);
// q.newadd(6);
// q.add(12);
// q.add(13);
// q.Next()
// q.newadd(7);
// q.add(14);
// q.add(15);
// q.Next()
// q.Next()





// debug(dfs(q))
debug("")
makeRandomTree (10, 8)
// (childern, depth)
//code breaks if depth = 2

