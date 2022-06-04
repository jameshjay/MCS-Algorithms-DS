 
 class BST {
  
  var value: Int? = nil
  var leftPointer: BST? = nil
  var rightPointer: BST? = nil
  
  func addingNode(valueToBeAdded: Int) {
    
    // no headpointer
    // no currentnode
    // just check if the value added is LESS or GREATER than self.value
      // depending, then call function again if left/right pointer not nil. keep doing until it is nil.
      // if nil, then create new and doubly link together.
    
    
    
    if (self.value == nil) {
      self.value = valueToBeAdded
      
    }
    
    if (valueToBeAdded < self.value) {
      if(self.leftPointer != nil) {
        //perform the function on the left node
        self.leftPointer?.addingNode(valueToBeAdded)
      }
        
      else {
        var leftChild: BST = BST()
        leftChild.value = valueToBeAdded
        self.leftPointer = leftChild
        
      }
    }
    
    if (valueToBeAdded > self.value) {
      if(self.rightPointer != nil) {
        rightPointer?.addingNode(valueToBeAdded)
      }
      else {
        var rightChild: BST = BST()
        rightChild.value = valueToBeAdded
        self.rightPointer = rightChild
        
      }
    }
  }
  
  
  func recursiveInorderTraversal(newRoot: BST?) -> [Int] {
    
    if newRoot == nil {
      print("nil")
      return []
    }
    var result = [Int]()
    print("gonna call left root")
    
    result += recursiveInorderTraversal(newRoot!.leftPointer)
    
    print("appending")
    result.append(newRoot!.value!)
    
    print("checking right")
    result += recursiveInorderTraversal(newRoot!.rightPointer)
    
    print("done")
    print(result, "result")
    return result
  }
 }
 
 
 
 //create a new root
 var numbers = [8,6,9,5,7]
 var x = BST()
 var y = BST()
 
 for i in numbers {
  x.addingNode(i)
 }
 
 var array = y.recursiveInorderTraversal(x)
 
 for i in array {
  print(i)
 }
 
 
