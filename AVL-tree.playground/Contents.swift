/*
 AVL Tree
 Swift Algorithms for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */
//AVL
//Self balancing tree
import Foundation

public class AVLTree<T: Comparable> {
    
    var value: T?
    var leftNode: AVLTree?
    var rightNode: AVLTree?
    var height: Int
    
    
    init() {
        //empty tree = -1 head
        self.height = -1
    }
    
    
    var count: Int {
        let leftNode = self.leftNode?.count ?? 0
        let rightNode = self.rightNode?.count ?? 0
        return leftNode + 1 + rightNode
    }
    
    
    //function to add item based on its value
    func addNode(value: T) {
        
        //check for the root node
        if (self.value == nil) {
            self.value = value
            self.height = 0
            return
        }
        
        
        //check the leftNode side of the tree
        if (value < self.value) {
            
            
            if (self.leftNode != nil) {
                leftNode?.addNode(value)
            }
                
            else {
                //create a new leftNode node
                let leftNodeChild : AVLTree = AVLTree()
                leftNodeChild.value = value
                leftNodeChild.height = 0
                self.leftNode = leftNodeChild
            }
            
            //recalculate node height for hierarchy
            self.setNodeHeight()

            //check AVL property
            self.isValidAVLTree()
            
        } //end if
        
        
        
        //check the leftNode side of the tree
        if (value > self.value) {
            
            if (self.rightNode != nil) {
                rightNode?.addNode(value)
            }
                
            else {
                //create a new rightNode node
                let rightNodeChild : AVLTree = AVLTree()
                rightNodeChild.value = value
                rightNodeChild.height = 0
                self.rightNode = rightNodeChild
                
            }
            
            //recalculate node height for hierarchy
            self.setNodeHeight()
            
            //check AVL property
            self.isValidAVLTree()
            
            
            
        } //end if
        
        
    } //end function
    
    
    
    
//========= Tree balancing algorithms ===========
    
    
    
    //retrieve the height of a node
    func getNodeHeight(aNode: AVLTree!) -> Int {
        
        if (aNode == nil) {
            return -1
        }
        else {
            return aNode.height
        }
        
    }
    
    
    
    //calculate the height of a node
    func setNodeHeight() -> Bool {
        
        
        //check for a nil condition
        if (self.value == nil) {
            print("no value provided..")
            return false
        }
        
        
        
        //initialize leaf variables
        var nodeHeight: Int = 0
        
        
        //do comparision and calculate highest subtree
        //add 1 for root node
        nodeHeight = max(getNodeHeight(self.leftNode), getNodeHeight(self.rightNode)) + 1
        
        self.height = nodeHeight
        
        return true
        
    }
    
    
    
    //determine if the tree is "balanced" - operations on a balanced tree is O(log n)
    func isTreeBalanced() -> Bool {
        
        
        //check for a nil condition
        if (self.value == nil) {
            print("no value provided..")
            return false
        }
        
        
        //use absolute value to manage rightNode and leftNode imbalances
        if (abs(getNodeHeight(self.leftNode) - getNodeHeight(self.rightNode)) <= 1) {
            return true
        }
        else {
            return false
        }
        
        
    } //end function
    
    
    
    
    //check to ensure node meets avl property
    func isValidAVLTree() -> Bool! {
        
        
        //check for valid scenario
        if (self.value == nil) {
            print("no value provided..")
            return false
        }
        
        
        if (self.isTreeBalanced() == true) {
            print("node \(self.value!) already balanced..")
            return true
        }
            
            //determine rotation type
        else {
            
            
            //create a new leaf node
            let childToUse : AVLTree = AVLTree()
            childToUse.height = 0
            childToUse.value = self.value
            
            
            if (getNodeHeight(self.leftNode) - getNodeHeight(self.rightNode) > 1) {
                
                //reset the root node
                self.value = self.leftNode?.value
                self.height = getNodeHeight(self.leftNode)
                
                
                //assign the new rightNode node
                self.rightNode = childToUse
                
                
                //adjust the leftNode node
                self.leftNode = self.leftNode?.leftNode
                self.leftNode?.height = 0
                
                print("root is: \(self.value!) | leftNode is : \(self.leftNode!.value!) | rightNode is : \(self.rightNode!.value!)..")
                
                return true
                
            }
            
            
            if (getNodeHeight(self.rightNode) - getNodeHeight(self.leftNode) > 1) {
                
                print("\n starting leftNode rotation on \(self.value!)..")
                
                //reset the root node
                self.value = self.rightNode?.value
                self.height = getNodeHeight(self.rightNode)
                
                
                //assign the new leftNode node
                self.leftNode = childToUse
                
                
                //adjust the rightNode node
                self.rightNode = self.rightNode?.rightNode
                self.rightNode?.height = 0
                
                print("root is: \(self.value!) | leftNode is : \(self.leftNode!.value!) | rightNode is : \(self.rightNode!.value!)..")
                
                return true
                
            }
            
            
            return nil
            
            d
            
        } //end if
        
        
        
    } //end function
}
    
    let numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7] //create a new BST instance

    var root = AVLTree<Int>()
    //sort each item in the list
    for number in numberList {
    root.addNode(number)
    }

    
