//: [Previous](@previous)

import Foundation

class x {

  var array: [Int!]
  
  init(arrCapacity: Int) {
    self.array = [Int!](count: arrCapacity, repeatedValue: nil)
  }
}


var y = x(arrCapacity: 23)
print(y.array)