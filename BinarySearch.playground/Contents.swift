/*
 Binary Search
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

import Foundation

var isKeyFound: Bool = false


/*
binary search algorthim. Find the value at the middle index.
note the use of the tuple to organize the upper and lower search bounds.
*/

func binarySearch(var numberList: [Int], findValue: Int, range:(min: Int, max: Int)) {
  
  
  let midIndex: Double = round(Double((range.min + range.max) / 2))
  let midNumber = numberList[Int(midIndex)]
  
  
  //use recursion to reduce the possible search range
  if (midNumber > findValue ) {
    binarySearch(numberList, findValue: findValue, range: (range.min, Int(midIndex) - 1))
    
    
    //use recursion to increase the possible search range
  } else if (midNumber < findValue ) {
    binarySearch(numberList, findValue: findValue, range: (Int(midIndex) + 1, range.max))
    
    
  } else {
    isKeyFound = true
    print("value \(findValue) found..")
  }
  
  
} //end function


var searchList = [Int]()

//populate the list with values
for number in 1...10 {
  searchList.append(number)
}

binarySearch(searchList, findValue: 4, range: (1, 10))



