import UIKit

let array = [5, 4, 1, 4, 3, 5, 1]
let array1 = [2, 3, 7, 9, 11, 2, 3, 11]
let array2 = [6, 2, 5, 2, 2, 6, 6]
let array3 = [2, 2, 2, 10, 2]

func checkEvenUsingBitWise(_ element: Int) {
    (element & 1 == 0) ? print("\(element) is even number") : print("\(element) is odd number")
}

//checkEvenUsingBitWise(8)
//checkEvenUsingBitWise(7)

func swapTwoNumberUsingXOR(_ first: inout Int, _ second: inout Int) {
    first = first^second
    second = first^second
    first = first^second
    print("After swaping, First is \(first), Second is \(second)")
}

//var first = 5
//var second = 7
//swapTwoNumberUsingXOR(&first, &second)

func findIthBit(_ element: Int, _ i: Int) -> Int {
    let mask = 1 << (i-1)
    return (element & mask == 0) ? 0 : 1
}

//findIthBit(309, 6)

func setIthBit(_ element: Int, _ i: Int) -> Int {
    let mask = 1 << (i-1)
    return (element | mask)
}

//setIthBit(309, 4)

func clearIthBit(_ element: Int, _ i: Int) -> Int {
    let mask = ~(1 << (i-1))
    return (element & mask)
}

//clearIthBit(5, 2)
//clearIthBit(5, 1)

func countSetBits(_ element: inout Int) -> Int {
    var count = 0
    while (element != 0) {
        element &= (element - 1)
        count += 1
    }
    return count
}

func findNumberOfBitsToConvert(_ first: Int, _ second: Int) -> Int {
    var xor = first^second
    return countSetBits(&xor)
}

//findNumberOfBitsToConvert(10, 20)

func getNonRepeatingNoWhereElementRepeatsTwice() -> Int {
    var result = 0
    var firstIndex = 0
    while (firstIndex < array.count) {
        result ^= array[firstIndex]
        firstIndex += 1
    }
    return result
}

//getNonRepeatingNoWhereElementRepeatsTwice()

func getTwoNonRepeatingNoWhereElementRepeatsTwice() -> (Int, Int) {
    var result = 0
    var firstIndex = 0
    while (firstIndex < array1.count) {
        result ^= array1[firstIndex]
        firstIndex += 1
    }
    let setBitNo = result & ~(result - 1)
    firstIndex = 0
    var firstEle = 0
    var secondEle = 0
    while (firstIndex < array1.count) {
        if (array1[firstIndex] & setBitNo) != 0 {
            firstEle ^= array1[firstIndex]
        } else {
            secondEle ^= array1[firstIndex]
        }
        firstIndex += 1
    }
    return (firstEle, secondEle)
}

//getTwoNonRepeatingNoWhereElementRepeatsTwice()
