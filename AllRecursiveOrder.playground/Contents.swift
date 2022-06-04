/*
 All Recursive Order
 Swift Algorithms for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(val: Int) {
        self.val = val
    }
    convenience init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.init(val: val)
        self.left = left
        self.right = right
    }
    
    //++++ recursive 
    
    func recursivePreorderTraversal(root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result: [Int] = []
        result.append(root!.val)
        result += recursivePreorderTraversal(root!.left)
        result += recursivePreorderTraversal(root!.right)
        return result
    }
    
    //****************
    
    func recursiveInorderTraversal(root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result: [Int] = []
        result += recursiveInorderTraversal(root!.left)
        result.append(root!.val)
        result += recursiveInorderTraversal(root!.right)
        return result
        
    }
    
    //**************
    // recursive post order 
    
    func recursivePostorderTraversal(root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result: [Int] = []
        result += recursivePostorderTraversal(root!.left)
        result += recursivePostorderTraversal(root!.right)
        result.append(root!.val)
        return result
    }
    
}

// individually connecting nodes on binary tree


var x = TreeNode(val: 20)
// individually connecting left and right nodes.
x.left = TreeNode(val: 15)
x.right = TreeNode(val: 25)

x.left?.left = TreeNode(val: 10)
x.left?.right = TreeNode(val: 16)

x.right?.left = TreeNode(val: 23)
x.right?.right = TreeNode(val: 27)

print(x.recursivePreorderTraversal(x), "preorder")


print(x.recursiveInorderTraversal(x), "inorder")

print(x.recursivePostorderTraversal(x), "postorder")
