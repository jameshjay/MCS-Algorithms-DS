/*
 Quick Sort
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

import Foundation


// At worst quicksort is O (n2) but can work as O(nlogn)


var randomNumbers = [5,2,19,4,1,8]
print(randomNumbers, " starting array")

func quickSort(passedArray: [Int])->[Int] {
  print("starting spot")
  
  // 3 arrays
  var leftOfPivot = [Int]()
  var wall = [Int]()
  var rightOfPivot = [Int]()
  
  if passedArray.count > 1{
    var pivot = passedArray[0]
    print(pivot, " pivot")
    
    for i in passedArray {
      if i < pivot{
        leftOfPivot.append(i)
        print(leftOfPivot, " append left")
      }
      else if i == pivot {
        wall.append(i)
        print(wall, " i == pivot, add to wall)
      }
      else if i > pivot {
        rightOfPivot.append(i)
        print(rightOfPivot, " append right")
      }
    }
    
    print("about to left recursive")
    var left = quickSort(leftOfPivot)
    print(left, "value of left, left recursive")
    
    print(" about to right recursive")
    print("in right ", rightOfPivot)
    var right = quickSort(rightOfPivot)
    print(right, "value of right, right recursive")
    print(wall, "wall")
    
    print("return Left+ wall +Right",left + wall + right, "total")
    return left + wall + right
    
    // return (quickSort(leftOfPivot)+wall+quickSort(rightOfPivot))
    
  }
    print("exit not greater than 1")
    return passedArray
    print(passedArray, " final!")
  }

print(randomNumbers)
print(quickSort(randomNumbers))
