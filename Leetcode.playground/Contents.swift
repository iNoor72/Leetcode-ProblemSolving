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

var pb1InputArray = [1,1,2]
removeDuplicates(&pb1InputArray)
print(pb1InputArray)


//Problem #2: https://leetcode.com/problems/single-number/
func singleNumber(_ nums: [Int]) -> Int {
    var numbers = nums
    for number in numbers {
        guard let firstIndex = numbers.firstIndex(of: number), let lastIndex = numbers.lastIndex(of: number) else {
            return number
        }
        
        if firstIndex == lastIndex {
            return number
        }
        continue
    }
    return 0
}

var pb2nputArray = [1,4,1,2,2]
print(singleNumber(pb2nputArray))

//Problem #3: https://leetcode.com/problems/number-of-1-bits/
func hammingWeight(_ n: Int) -> Int {
    var numberOfOnes = 0
    var num = n
    while num != 0 {
        if (num & 1) > 0 {
            numberOfOnes += 1
        }
        
        num = num >> 1
    }
    
    return numberOfOnes
}

let pb3Input = 00000000000000000000000000001011
print(hammingWeight(pb3Input))


//Problem #4: https://leetcode.com/problems/search-in-rotated-sorted-array/
func search(_ nums: [Int], _ target: Int) -> Int {
    var index = -1
    if let index = nums.firstIndex(of: target) {
        return index
    }
    
    return index
    }


//Problem #5: https://leetcode.com/problems/majority-element/
func majorityElement(_ nums: [Int]) -> Int {
    var result: Int = -1
    var maxVal = -1
    let numbersSet: Set<Int> = Set(nums)
    var occurances: [Int: Int] = [:]
    numbersSet.forEach {
        occurances[$0] = 0
    }
    for number in nums {
        occurances[number] = occurances[number]! + 1
    }
    
    for (key, val) in occurances {
        if val > maxVal { result = key }
    }
    return result
}
