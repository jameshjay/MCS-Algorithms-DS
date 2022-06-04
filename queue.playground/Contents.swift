/*
 Queue Data Structure
 Swift Algorithms & Data Structures for Beginners
 Copyright MakeCodeStick. All rights reserved.
 */

struct Queue<T> {
    var array = [T]()
    
    mutating func enqueue(item: T){
        array.insert(item, atIndex: 0)
    }
    
    mutating func dequeue() -> T {
        return array.removeLast()
    }
    
    func front() -> T {
        return array[array.endIndex - 1]
    }
    
    func back() -> T{
        return array[0]
    }
    
    func isEmpty() -> Bool {
        return array.count == 0 ? true : false
    }
    
    func size() -> Int {
        return array.count
    }
    
    var sizeLessThanOne: Int {
        return array.count - 1
    }
}

//+++++++++++++++++++++++++++++++++

var containerQ = Queue<Int> ()

containerQ.enqueue(1)
print(containerQ)

containerQ.enqueue(2)
print(containerQ)

containerQ.enqueue(3)
print(containerQ)

containerQ.enqueue(4)
print(containerQ)
print(containerQ.size())



containerQ.isEmpty()
containerQ.size()
containerQ.sizeLessThanOne
containerQ.front()
containerQ.back()
print(containerQ)


