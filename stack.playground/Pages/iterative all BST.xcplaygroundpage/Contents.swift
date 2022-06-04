
import Foundation


// ================

class LLNode<T> {
  
  var key: T!
  var next: LLNode?
  var previous: LLNode?
  
}



// ================

class Stack<T> {
  
  //create a object top of type LLNode
  private var top: LLNode<T>! = LLNode<T>()
  
  
  // creating a count property
  //the number of items
  
  // can also use computed property
  //var count: Int{
  func count()->Int {
    if let exists = self.top.key {
      let topitem = exists
    } else {
      return 0
    }
    
    //make object top = current
    // create a copy of top and place into current
    var current: LLNode = top
    
    var x = 1
    
    //@@@ ???
    //cycle through the list of items to get to the end.
    while ((current.next) != nil) {
      current = current.next!
      x++
    }
    
    return x
    
  }
  
  
  
  //push an item onto the stack
  func push(key: T) {
    
    
    //if top does not exist, create it
    if (top == nil) {
      top = LLNode<T>()
      top.key = key
      return
    }
    
    if top != nil{
      
      //if top has a value, create a new object
      let childToUse: LLNode<T> = LLNode<T>()
      //add the value to the new object
      childToUse.key = key
      
      
      //set newly created item at the top
      //set the new objects pointer to top
      //set new object pointer point to top.
      childToUse.next = top
      //set new top to be new object
      top = childToUse
    }
    
  }
  
  
  
  //remove an item from the stack and return  T value (optional)
  func pop() -> T? {
    
    //        // check to see if stack is empty by checking if topkey exists
    //        if let topKey: T? =  self.top.key {
    //            let topItem = topKey
    //        }
    //            else {
    //                //if empty, return nil
    //                return nil
    //            }
    
    if self.top.key == nil {
      return nil
    }
    
    
    
    
    //if there is a top item
    //retrieve and queue the next item
    let queueitem: T? = self.top.key!
    
    
    //reset the top value
    //get the top pointer and place in next item
    // HAVE TO USE IF LET, BC POSSIBLY POINTING TO NIL
    if let nextitem = self.top.next {
      //set new top
      top = nextitem
    }
    else {
      //if there's no next pointer, set to nil, stack now empty
      top = nil
    }
    
    //return the item that is popped off
    // RETURN THE NEXT TOP NODE.
    return queueitem
    
  }
  
  
  
  //retrieve the top most item
  func peek() -> T? {
    
    
    //determine if the key or instance exist
    //if top has a value, place in topItem and return top item
    if let topitem: T = self.top?.key {
      return topitem
    }
      
    else {
      //if no top item, return nil
      return nil
    }
    
    
  }
  
  
  //check for the presence of a value
  func isEmpty() -> Bool {
    
    //determine if the key or instance exist
    if let _: T = self.top?.key {
      return false
    }
      
    else {
      return true
    }
    
  }
  
  
}



//              =================


public class AVLTree<T: Comparable> {
  
  var key: T?
  var left: AVLTree?
  var right: AVLTree?
  
  //@@@@ computed property, use getter/setter, get not needed if only get, always return
  var count: Int {
    get {
      let left = self.left?.count ?? 0
      print("yyyy")
      print(left, "left")
      
      let right = self.right?.count ?? 0
      print(right, "right")
      
      print(left + 1 + right, "total")
      print("")
      
      return left + 1 + right
    }
  }
  
  
  //function to add item based on its value
  func addNode(key: T) {
    
    //check for the root node
    if (self.key == nil) {
      self.key = key
      return
    }
    
    
    //check the left side of the tree
    if (key < self.key) {
      
      if (self.left != nil) {
        left?.addNode(key)
      }
        
      else {
        //create a new left node
        let leftChild : AVLTree = AVLTree()
        leftChild.key = key
        self.left = leftChild
      }
    } //end if
    
    
    
    
    
    //check the left side of the tree
    if (key > self.key) {
      
      if (self.right != nil) {
        right?.addNode(key)
      }
        
      else {
        //create a new right node
        let rightChild : AVLTree = AVLTree()
        rightChild.key = key
        self.right = rightChild
        
      }
      
      
      
    } //end if
    
    
  } //end function
  
  
  //
  
  func iterativeInorderTraversal(root: AVLTree?) {
    var stack = Stack<AVLTree>()
    var currNode: AVLTree! = root
    var done = false
    
    if root == nil {
      return
    }
    
    while done != true {
      if currNode != nil   {
        stack.push(currNode)
        currNode = currNode?.left
      }
      else {
        if stack.isEmpty() {
          done = true
          break
        } else {
          currNode = stack.pop()
          print(currNode?.key, "inorder")
          currNode = currNode?.right
          
        }
        
      }
      
    }
  }
  
  func iterativePreorder(root: AVLTree?) {
    
    if root == nil {
      return
    }
    
    let stack = Stack<AVLTree>()
    let curr = root
    stack.push(curr!)
    
    while !stack.isEmpty() {
      var x = stack.pop()
      print(x?.key, "preorder")
      if x?.right != nil {
        stack.push(x!.right!)
      }
      if x?.left != nil {
        stack.push(x!.left!)
      }
    }
  }
  
  func iterativePostorder(root: AVLTree?) {
    
    if root == nil {
      return
    }
    
    var stack = Stack<AVLTree>()
    var curr = root
    
    var done = false
    
    //    while !stack.isEmpty() {
    while done == false {
      while curr != nil {
        if curr!.right != nil {
          stack.push(curr!.right!)
        }
        stack.push(curr!)
        
        if curr?.left != nil {
          curr = curr!.left
        } else {
          curr = nil
        }
      }
      
      curr  = stack.pop()
      // == checks for same value, === checks if they refer to the same object
      if curr!.right != nil && curr!.right === stack.peek() {
        // NOTE!! this print (stack.pop()?.key will still perform function POP), this line messed me up.
        // calling functions in print still performs whatever action. be careful!
        // also another mistake, made to vars in one function, same scope. Remember this. local varibales survive within the length of the scope, careful of global and local vars. 2 big costly mistakes.
        //         print("stack pop key", stack.pop()?.key)
        stack.pop()
        stack.push(curr!)
        curr = curr!.right
      } else {
        print(curr?.key, "PostOrder")
        curr = nil
        
        if stack.isEmpty() {
          done = true
        }
      }
    }
  }
  
  
  
  
  
}//end class

var x = AVLTree<Int>()


x.addNode(12)
x.addNode(41)
x.addNode(16)
x.addNode(234)
x.addNode(10)
x.addNode(8)
x.addNode(14)
x.addNode(1)
x.addNode(33)
x.count


x.count

print(x.iterativeInorderTraversal(x), "inorder")
print(x.iterativePreorder(x))

var y = Stack<Int>()

y.push(2)
y.push(4)
y.push(6)
y.push(3)


y.count()

y.peek()

x.iterativePostorder(x)
x.count


