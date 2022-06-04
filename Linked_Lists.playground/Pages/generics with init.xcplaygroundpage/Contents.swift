 
 
 import Foundation
 
 /*********************************************************
  Creating an object using GENERICS and init()
  *********************************************************/
 
 
 class LinkedListNode<T> {
  
  var value: T
  var nextPointer: LinkedListNode?
  var previousPointer: LinkedListNode?
  
  init(value: T) {
    self.value = value
  }
 }
 
 // 
 var x = LinkedListNode<Int>(value: 23)
 
 print(x.value)
