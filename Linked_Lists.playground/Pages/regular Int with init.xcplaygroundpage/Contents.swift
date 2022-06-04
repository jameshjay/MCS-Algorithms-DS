 import Foundation
 
 /*********************************************************
  Creating an object using GENERICS and init()
  *********************************************************/
 
 
 class LinkedListNode {
  
  var value: Int
  var nextPointer: LinkedListNode?
  var previousPointer: LinkedListNode?
  
  init(value: Int) {
    self.value = value
  }
 }
 
 // the param is automatically populated because of the "init" in class. 
 // there is NO PARAMETERS in CLASS
 var x = LinkedListNode(value: 23)
 
 print(x.value)
