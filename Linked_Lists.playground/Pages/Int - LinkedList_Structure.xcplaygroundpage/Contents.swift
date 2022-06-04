 
 
 import Foundation
 
 // CLASS TAKES NO PARAMETERS EVER UNLESS GENERIC MARKED BY <T>
 // USED TO JUST CREATE OBJECTS. OBJECT METHODS CAN HAVE FUN PARAMETERS.
 // ONLY USE "init" when filling properties for object through class.
 
 class LinkedListNode {
  
  var value: Int!
  var nextPointer: LinkedListNode?
  var previousPointer: LinkedListNode?
 }
 // ********************************************************************************
 //                         (ITERATIVE)
 
 class LinkedList_Structure {
  
  private var headPointer = LinkedListNode()

  
  func addLink(value: Int) {
    
    
    if (headPointer.value == nil  ) {
      headPointer.value = value
      return
    }
    
    var currentNode: LinkedListNode? =  headPointer
    
    while (currentNode != nil  ) {
      if currentNode?.nextPointer != nil   {
        currentNode = currentNode?.nextPointer
        
      } else {
        let newChildNode = LinkedListNode()
        newChildNode.value = value
        newChildNode.previousPointer = currentNode
        newChildNode.nextPointer = nil
        currentNode!.nextPointer = newChildNode
        break
      }
    }
  }
 }
 

 
 var x = LinkedList_Structure()
 x.addLink(23)
 
 print(x.headPointer.value)
 
 
 
 
