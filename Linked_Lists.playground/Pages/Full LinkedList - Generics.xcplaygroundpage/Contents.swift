/*
 Linked Lists
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */
 
 import Foundation
 
 class LinkedListNode<T> {
  
  var value: T!
  var nextPointer: LinkedListNode?
  var previousPointer: LinkedListNode?
 }
 // ********************************************************************************
 //                         (ITERATIVE)
 
 class LinkedList_Structure<T> {
  
  private var headPointer = LinkedListNode<T>()
  
  //-------------------------------
  
  var count: Int {
    if headPointer.value == nil   {
      return 0
    }
      
    else  {
      var currentNode = headPointer
      var x = 1
      while currentNode.nextPointer != nil   {
        currentNode = currentNode.nextPointer!
        x += 1
      }
      return x
    }
  }
  
  //                      CHECK IF EMPTY
  
  var isEmpty: Bool  {
    return self.count == 0 || headPointer.value == nil ? true : false
  }
  
  //               append a new item to a linked list
  
  func addLink(value: T) {
    
    
    if (headPointer.value == nil  ) {
      headPointer.value = value
      return
    }
    
    //bc currNode will eventually = nil as it cycles
    var currentNode: LinkedListNode? =  headPointer
    

    //you want to stay in this loop until you get to the end then create.
    while currentNode != nil {
      if currentNode?.nextPointer != nil {
        currentNode = currentNode?.nextPointer
      } else {
          let newChildNode = LinkedListNode<T>()
          newChildNode.value = value
          newChildNode.previousPointer = currentNode
          newChildNode.nextPointer = nil
          currentNode!.nextPointer = newChildNode
          break
        }
    }
  }
  
  //            print all the values in the LL
  
  func printAllvalues() {
    
    var currentNode: LinkedListNode! = headPointer
    
    while (currentNode != nil  ) {
      print("link item is: \(currentNode.value)")
      currentNode = currentNode.nextPointer
    }
    
    
    
  }
  
  
  
  
  //                obtain link at a specific index
  
  func obtainLinkAtIndex(index: Int) ->LinkedListNode<T>! {
    
    if ((index < 0) || (index > (self.count - 1)) || (headPointer.value == nil  )) {
      return nil
    }
      
      
    else  {
      var currentNode: LinkedListNode<T>! = headPointer
      var x: Int = 0
      
      while (index != x) {
        currentNode = currentNode.nextPointer
        x += 1
      }
      
      return currentNode
      
    } //end else
    
    
  } //end function
  
  
  
  
  //                    insert at specific index
  func addLinkAtIndex(value: T, index: Int) {
    
    
    if ((index < 0) || (index > (self.count - 1))) {
      print("link index does not exist..")
    }
    
    if (headPointer.value == nil  ) {
      headPointer.value = value
      return
    }
    
    var currentNode: LinkedListNode<T>? = headPointer
    var previousNode: LinkedListNode<T>? = nil  //can be nil or value
    var listIndex: Int = 0
    
    while (currentNode != nil  ) {
      while (index != listIndex) {
        previousNode = currentNode
        currentNode = currentNode?.nextPointer
        listIndex += 1
      }
      
      let newChildNode = LinkedListNode<T>()
      
      newChildNode.value = value
      newChildNode.nextPointer = currentNode
      newChildNode.previousPointer = previousNode
      
      if let linkpreviousNode = previousNode {
        linkpreviousNode.nextPointer = newChildNode
        newChildNode.previousPointer = linkpreviousNode
      }
      
      currentNode!.previousPointer = newChildNode
      
      //reset headPointer if user wanted node at very front of LL
      if index == 0 {
        headPointer = newChildNode
      }
      break
    }
  }
  
  
  
  
  //                          remove at specific index
  func removeLinkAtIndex(index: Int) {
    
    if ((index < 0) || (index >= (self.count - 1)) || (headPointer.value == nil  )) {
      print("link index does not exist..")
      return
    }
    
    
    var currentNode: LinkedListNode<T>? =  headPointer
    var previousNode: LinkedListNode<T>?
    var listIndex: Int = 0
    
    
    if (index == 0) {
      currentNode = currentNode?.nextPointer
      headPointer = currentNode!
      return
    }
    
    
    while (currentNode != nil  ) {
      
      if (listIndex != index) {
        previousNode = currentNode
        currentNode = currentNode?.nextPointer
        listIndex += 1
      }
      
      previousNode!.nextPointer = currentNode?.nextPointer
      currentNode = nil
      break
      
    } //end while
    
    
  } //end function
  
  
  
  
  
  //                      reverse the order of a linked list
  
  func reverseLinkedList() {
    
    if self.count <= 1{
      return
    }
    
    var currentNode : LinkedListNode<T>? = headPointer
    var nextPointer : LinkedListNode<T>? = nil
    
    while(currentNode != nil  ) {
      nextPointer = currentNode!.nextPointer
      currentNode!.nextPointer = currentNode!.previousPointer
      currentNode!.previousPointer = nextPointer
      
      if nextPointer == nil   {
        headPointer = currentNode!
      }
      
      currentNode = nextPointer
      
      //base case
      
      
    }//end while
    
    
  }//end function
  
  
  
  //MARK: Closure operations
  
 }
 
 
 var x = LinkedList_Structure<Int>()
 // x.isEmpty
 x.addLink(1)
 x.addLink(2)
 x.addLink(44)
 x.addLink(67)
x.count
 x.addLinkAtIndex(99, index: 2)
 x.printAllvalues()
 
 
 
 
