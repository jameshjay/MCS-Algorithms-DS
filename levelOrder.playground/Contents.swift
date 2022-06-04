/*
 BST - level order 
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

//making my own binary search tree

class BST {
    
    //qualities of a node
    var valueToBeAdded: Int?
    var leftPointer: BST?
    var rightPointer: BST?
    
    
    //create a function that will add the node
    //the parameter will take in a valueToBeAdded of generic type
    func addingNode(valueToBeAdded: Int) -> BST {
        
        
        //if the value is empty, the root, add it
        if (self.valueToBeAdded == nil) {
            self.valueToBeAdded = valueToBeAdded
            
        }
        
        //else, if value is less than the root
        if (valueToBeAdded < self.valueToBeAdded) {
            //add to the left
            if(self.leftPointer != nil) {
                //call function again but on the leftpointer
                leftPointer?.addingNode(valueToBeAdded)
            }
                
            else {
                //once left side reaches nil, create a new node to add
                var leftChild: BST = BST()
                leftChild.valueToBeAdded = valueToBeAdded
                self.leftPointer = leftChild
                //return newRoot
                
            }
        }
        
        if (valueToBeAdded > self.valueToBeAdded) {
            if(self.rightPointer != nil) {
                rightPointer?.addingNode(valueToBeAdded)
            }
            else {
                var rightChild: BST = BST()
                rightChild.valueToBeAdded = valueToBeAdded
                self.rightPointer = rightChild
                // return newRoot
                
            }
        }
        
         return newRoot
    }

    
    func recursiveInorderTraversal(newRoot: BST?) -> [Int] {
         if newRoot == nil {
          
            return []
        }
        //store result in array
        var result = [Int]()
      
        result += recursiveInorderTraversal(newRoot!.leftPointer)
      
        result.append(newRoot!.valueToBeAdded!)
      
        result += recursiveInorderTraversal(newRoot!.rightPointer)
         return result
    }

    func levelOrderTraversal(newRoot: BST) -> [[Int]]{
        

        
        var finalarrayofarrays = [[Int]]()
        var currentLevelNode = [BST]()
        var nextLevelNode = [BST]()
        var tempArray = [Int]()

        //only one node gets appended
        currentLevelNode.append(newRoot)
         while !currentLevelNode.isEmpty{
             //always being moved over
            let currentNode = currentLevelNode.removeAtIndex(0)
             tempArray.append(currentNode.valueToBeAdded!)
 
            if let left = currentNode.leftPointer{
                nextLevelNode.append(left)
            }
            if let right = currentNode.rightPointer{
                nextLevelNode.append(right)
            }
            
            if currentLevelNode.isEmpty {
                 //let arr = tempArray
                finalarrayofarrays.append(tempArray)
                //finalarrayofarrays += [tempArray]
                currentLevelNode += nextLevelNode
                nextLevelNode.removeAll()
                tempArray.removeAll()
            }
         }
        
        return finalarrayofarrays
    }
  }


var numbers = [16,14,8,17,13,15]
var newRoot = BST()

for i in numbers {
    newRoot.addingNode(i)
}

print(newRoot.levelOrderTraversal(newRoot))


