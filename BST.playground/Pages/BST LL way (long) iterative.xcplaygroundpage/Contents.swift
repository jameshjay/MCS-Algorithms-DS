/*
 Binary Search Tree
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

import Foundation

class BSTNode {
  
  var value: Int!
  var rightPointer: BSTNode?
  var leftPointer: BSTNode?
}
// ********************************************************************************
//                         (ITERATIVE)

class BST_Structure {
  
  private var headPointer = BSTNode()
  var count = 0
  
  
  func addLink(value: Int) {
    
    
    if (headPointer.value == nil  ) {
      print("enter")
      headPointer.value = value
      return
    }
    
    //bc currNode will eventually = nil as it cycles
    var currentNode: BSTNode? =  headPointer
    
    // I want to stay in this loop and not recall function because currentnode will get reset again to headpointer. It will not perform function on next or prev node. Only way is to stay in the while loop until completion and create.
    // you want to stay in this loop until you get to where you need to be then create.
    while currentNode?.value != nil {
      // rechecks all the way back to the top and starts over on the new current node.
      print("currnode value right now", currentNode?.value)
      if value < currentNode?.value {
        print("gonna enter", value, "<", currentNode?.value)
        if currentNode?.leftPointer != nil {
          print("going left")
          print(currentNode?.value, "currnode value")
          currentNode = currentNode?.leftPointer
          // will start over and keep looping since the value for new curr is still not nil
        } else {
          print("create new left node")
            let newChildNode = BSTNode()
            newChildNode.value = value
            print("value to new node",newChildNode.value)
//            newChildNode.rightPointer = currentNode
            newChildNode.leftPointer = nil
            currentNode!.leftPointer = newChildNode
            break
          }
        } else {
        print("switched currnode value now", currentNode?.value)
        if currentNode?.rightPointer?.value != nil {
          print("going right")
          currentNode = currentNode?.rightPointer
        } else {
          print("creating new right node")
          let newChildNode = BSTNode()
          newChildNode.value = value
          print("value to new node", newChildNode.value)
//          newChildNode.leftPointer = currentNode
          newChildNode.rightPointer = nil
          currentNode!.rightPointer = newChildNode
          break
        }
      }
    }
    
  }

  // this is the recursive way. 
  func recursiveInorderTraversal(root: BSTNode) -> [Int] {

    if root.value == nil {
      return []
    }
    
    // array is always resetting
    var result = [Int]()
    print(result.count, "array")
    
    if root.leftPointer != nil {
      print(result.count, "here")
      result += recursiveInorderTraversal(root.leftPointer!)
    }
    print(result.count, "now")
    result.append(root.value)
    

    if root.rightPointer != nil {
      result += recursiveInorderTraversal(root.rightPointer!)
    }
    print(result.count, "end")
    // when it hits result, it's done searching, it will start going through what was pushed on the stack. 
    return result
  }
}

var x = BST_Structure()
 x.addLink(5)
 x.addLink(3)
 x.addLink(7)
 x.addLink(2)
 x.addLink(4)
 x.addLink(8)
 x.addLink(23)
 x.addLink(0)
 x.addLink(1)

var inorder = x.recursiveInorderTraversal(x.headPointer)






