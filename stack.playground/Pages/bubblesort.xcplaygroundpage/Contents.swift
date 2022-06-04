

//Bubble sort

var array = [8,32,5,1,4,7,2,6,0,2]  // 10 numbers

func x(inout array: [Int]) {
  for (var i = 10; i >= 2; i--) {
    for (var j = 0; j < 9; j++)  {
      if array[j] > array[j+1] {
        var temp = array[j]
        array[j] = array[j+1]
        array[j+1] = temp
      }
    }
  }
}




/* using inout parameter.
 passes address instead of copy */

func bubbleSort(inout numbers: [Int]) ->() {
  let numbersLength = numbers.count
  
  for var i = 0; i < numbersLength; i++ {
    for var j = 1; j < numbersLength-i; j++ {
      if numbers[j-1] > numbers[j] {
        var swap = numbers[j-1]
        numbers[j-1] = numbers[j]
        numbers[j] = swap
      }
    }
  }
}

//++++++++++++++++++++++++++++++++++++++++++++++

var numbers = [5, 15, 14, 1, -6, 26, -100, 0, 99]


//note the ampersand
//Numbers sorted
bubbleSort(&numbers)

print(numbers)
