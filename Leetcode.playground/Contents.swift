import Foundation

//Problem #1: https://leetcode.com/problems/remove-duplicates-from-sorted-array/

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var numbersList: [Int] = [Int](-100...100)
    var resultArray = [Int]()
    for num in numbersList {
        if nums.contains(num) {
            resultArray.append(num)
        }
    }
    
    nums = resultArray
    return nums.count
}

var inputIntArray = [1,1,2]
removeDuplicates(&inputIntArray)
print(inputIntArray)
