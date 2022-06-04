/*
 Hash Tables
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

import Foundation

class Node {
  
  var firstname: String!
  var lastname: String!
  var np: Node!
  
}


class HashTable {
  
  // guarantees values will be set
  private var bucketsArray: [Node!]
  
  
  //initialize the bucketsArray with nil values
  init(capacity: Int) {
    self.bucketsArray = [Node!](count: capacity, repeatedValue: nil)
    
  }
  
  
  //add the key using the specified hash
  func addWord(firstname: String, lastname: String) {
    
    var hashindex: Int!
    var fullname: String!
    
    
    //create a hashvalue using the complete name
    fullname = firstname + lastname
    hashindex = createHash(fullname)
    print(hashindex, "hash value")
    
    
    let childNode = Node()
//    var headPointer: Node!
    
    
    childNode.firstname = firstname
    childNode.lastname = lastname
    
    
    //check for an existing list
    if  bucketsArray[hashindex] == nil {
      bucketsArray[hashindex] = childNode
    }
      
    else {
      
      // this way prevents you from having to cycle through every node each time you want to add. You always hold a reference to the last one added. Easiest to implement.
      
      print("a collision occurred. implementing chaining..")
//      headPointer = bucketsArray[hashindex]
      // the value (node) inside the bucketsArray[index] is placed into headPointer
      
      
      //connect the newNode to the headPointerNode
      childNode.np = bucketsArray[hashindex]
      //assign the headPointerNode to the new childNode
      bucketsArray[hashindex] = childNode
      
      
      //update the chained list
      // new node placed in the value
//      bucketsArray[hashindex] = headPointer
    }
    
    
  } //end function
  /*
   klklklk
   */
  
  
  //determine if the word is found in the hash table
  func findWord(firstname: String, lastname: String) -> Bool! {
    
    var hashindex: Int!
    var searchedName: String!
    
    searchedName = firstname + lastname
    hashindex = createHash(searchedName)
    
    
    //determine if the value is present
    if  bucketsArray[hashindex] == nil {
      print("name not found in hash table..")
      return false
    }
      
      
      //iterate through the list of items to find a match
    else {
      
      var curr = bucketsArray[hashindex]
      
      while (curr != nil) {
        
        let currFullName = curr.firstname + curr.lastname
        
        if (currFullName == searchedName) {
          print("\(curr.firstname) \(curr.lastname) found in hash table..")
          return true
        } else {
          curr = curr.np
          }
      } //end while
      
      
    } //end if
    
    // searched through all the nodes, plus chain and still nothing
    print("name not found in hash table..")
    return false
    
  }
  
  
  
  //return the hash value to be used
  func createHash(fullname: String) -> Int! {
    
    var remainder: Int = 0
    var divisor: Int = 0
    
    
    for key in fullname.unicodeScalars {
      
      print(key.value, "value of the letters")
      //println("the ascii value of \(key) is \(key.value)..")
      divisor += Int(key.value)
      print(divisor, "adding to divisor")
    }
    
    /*
     note: modular math is used to calculate a hash value. The bucket count is used
     as the dividend to ensure all possible outcomes are between 0 and the collection size.
     This is an example of a simple but effective hash algorithm.
     */
    // get the modulo / number of bucketsArray// i set to 20
    print(bucketsArray.count, "bucketsArray.count")
    // not plus 1 bc zero is valid
    remainder = divisor % bucketsArray.count
    
    print(remainder - 1)
    return remainder - 1
  }
  
  
}

var x = HashTable(capacity: 20)

x.addWord("j", lastname: "c")
x.addWord("jay", lastname: "c")
x.addWord("james", lastname: "c")

//x.findWord("james", lastname: "c")
x.findWord("j", lastname: "c")
//x.findWord("", lastname: "c")
//x.findWord("jay", lastname: "c")


