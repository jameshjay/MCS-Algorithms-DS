//stack 

/* "mutating"

if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.*/

//angled brackets, T is placeholder , type parameter
struct Stack<T> {
    
    //create an empty array that holds generic type T
    var arrayx = [T]()
    
    //use mutating because values/ size will chnange in your array
    mutating func push(item: T) {
      arrayx.append(item)

    }

    //pop function returns a type T
    mutating func pop() -> T {
//      arrayx.removeLast()
      return arrayx.removeLast()
        //removes last element in array
//        return array.removeLast()
    }
    
    func top() -> T {
        return arrayx[arrayx.count - 1]
    }
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//generic type
var x = Stack<Int>()

x.push(1)
x.push(4)
x.push(5)
x.push(-11)
x.push(12)

print(x.top())
print(x)

x.pop()
x.pop()
x.pop()
x.pop()

print(x)

