/*
 Recursive Post Order Traversal 
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

import Foundation

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
//=====
    
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
