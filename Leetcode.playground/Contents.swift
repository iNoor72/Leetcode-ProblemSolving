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

//Problem #6: https://leetcode.com/problems/search-insert-position/description/
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.contains(target) else {
        return nums.firstIndex(of: target)!
    }
    
    if let index = nums.firstIndex { $0 > target } { return index }
    if target > nums.max() ?? 0 { return nums.count }
    else { return 0 }
}

//Problem #7: https://leetcode.com/problems/kth-largest-element-in-an-array/description/
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    return nums.sorted().reversed()[k-1]
}

//Problem #8: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/
func strStr(_ haystack: String, _ needle: String) -> Int {
    var index = -1
    guard haystack.count > 0 else { return index }
    
    let newHay = haystack.replacingOccurrences(of: needle, with: "#")
    
    if let occurance = newHay.firstIndex(of: "#") {
        index = newHay.distance(from: haystack.startIndex, to: occurance)
    }
    return index
}

//Problem #9: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.contains(target) else { return [-1, -1] }
    
    let firstIndex = nums.firstIndex(of: target) ?? -1
    let lastIndex = nums.lastIndex(of: target) ?? -1
    
    return [firstIndex, lastIndex]
}

//Problem #10: https://leetcode.com/problems/find-target-indices-after-sorting-array/description/
func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
    var sortedArray = nums.sorted()
    var indicies: [Int] = []
    
    while true {
        guard let index = sortedArray.firstIndex(of: target) else { break }
        indicies.append(index)
        sortedArray.remove(at: index)
        sortedArray.insert(-1, at: index)
    }
    
    return indicies
}

//Problem #11: https://leetcode.com/problems/missing-number/description/
func missingNumber(_ nums: [Int]) -> Int {
    var missingNumber = -1
    
    let sortedNumbers = nums.sorted()
    guard sortedNumbers[0] == 0 else { return 0 }
    
    for index in 0..<sortedNumbers.count-1 {
        guard !(sortedNumbers[index+1] - sortedNumbers[index] == 1) else { continue }
        missingNumber = sortedNumbers[index+1] - 1
    }
    
    if missingNumber == -1 {
        missingNumber = (sortedNumbers.last ?? 0) + 1
    }
    
    return missingNumber
}
