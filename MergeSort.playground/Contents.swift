/*
 Merge Sort
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

//Merge Sort
func mergeSort(var numbersList : [Int])-> [Int]{
  print("Back to the top")
  if numbersList.count <= 1 {
    print("the numbers count is less than two so it will exit")
    return numbersList
  }
  print("numbers count not less than two so continue")
  //middle
  print(numbersList.count, "numbersList.count")
  let mid:Int = numbersList .count/2
  print("middle inxdex number \(mid)")
  //left of middle
  let left = Array(numbersList[0..<mid])

  print("left portion \(left)")
  //right of middle
  let right = Array(numbersList[mid..<numbersList.count])
  print("right portion \(right)")
  //call recursive function inside then outside
  
  //recursive function, left side first
  // keep recursing until there's only one item in array
  print("about to enter mergesort left again")
  let leftSide = mergeSort(left)
  print("mergeSort(left) done")
  print("leftside value: \(leftSide)")
  
  print("about to enter mergesort right")
  let rightSide = mergeSort(right)
  print("RRRR mergesort(right) done")
  print("rightside value: \(rightSide)")
  
  // left parameter is called first, then right
  return mergeArrays(leftSide, rightSide: rightSide)
//      return mergeArrays(mergeSort(left), rightSide: mergeSort(right))
}







// function takes
func mergeArrays(leftSide: [Int], rightSide: [Int])-> [Int]{
  print("MERGE ARRAY!")
  print("")
  print("")
  print("func mergeArray: a \(leftSide))")
  print("func mergeArray: b\(rightSide))")

  //always resets to zero! index values and ordered array (ordered array is only used to sort them so you can recheck left and right sorted again). does the recheck all over again
  var leftIndex = 0
  var rightIndex = 0
  var orderedArray = [Int]()
  
  print("leftside.count \(leftSide.count)")
  print("rightside.count \(rightSide.count)")
  
  //this will sort the leftside/ right side in order and put it into
  //a temp an array
  while leftIndex < leftSide.count && rightIndex<rightSide.count {
    if leftSide[leftIndex] < rightSide[rightIndex] {
      print("if L < R")
      orderedArray.append(leftSide[leftIndex])
      ++leftIndex
    }
    else if leftSide[leftIndex] > rightSide[rightIndex] {
      print("else if L > R")
      orderedArray.append(rightSide[rightIndex])
      rightIndex++
    }
    else {
      // if even
      print("else L = R")
      orderedArray.append(leftSide[leftIndex])
      orderedArray.append(rightSide[rightIndex])
      leftIndex++
      rightIndex++
    }
  }
  
  //  append the left, all sorted, then append the right.
//  print(orderedArray, "orderedArray")
//  print(Array(leftSide[leftIndex..<leftSide.count]), "Array")
  print("left index:", leftIndex)
  print("leftside", leftSide.count)
  print("right index", rightIndex)
  print("rightside", rightSide.count)
  print("current orderedArray", orderedArray)
  orderedArray = orderedArray + Array(leftSide[leftIndex..<leftSide.count])
  //    orderedArray = orderedArray + Array(A[leftIndex..<A.count])
  print(orderedArray, "first order")
  // the rest will get pushed on because it is even already
  orderedArray = orderedArray + Array(rightSide[rightIndex..<rightSide.count])
  print(orderedArray, "second order")
  print(orderedArray, "new ordered array")
  return orderedArray
}

var numbersList = [2,9,5,7,4,6]
//var numbersList  = [11,22,31,51,21,9,8,6,3]
mergeSort(numbersList )


