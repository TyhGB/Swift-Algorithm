
func fastSort<T: Comparable>(_ arr: inout [T], begin: Int, end: Int) {
    guard begin < end else {
        return
    }
    guard begin >= 0 && end < arr.count else {
        return
    }
    
    let basicNum = arr[begin]
    var i = begin
    var j = end
    while i<j, i<arr.count {
        //找到第一个小于basicNum的值
        while i<j, arr[j]>basicNum {
            j -= 1
        }
        
        if i<j {
            arr.swapAt(i, j)
            i += 1
        }
        
        //找到第一个大于basicNum的值
        while i<j, arr[i]<basicNum {
            i += 1
        }
        if i<j {
            arr.swapAt(i, j)
            j -= 1
        }
    }
    
    fastSort(&arr, begin: begin, end: i-1)
    fastSort(&arr, begin: i+1, end: end)
}

//[1, 2, 3, 5, 6, 7, 8, 9, 10, 20, 30]
var arr: [Int] = [3,5,6,8,2,1,9,10,30,20,7]
fastSort(&arr, begin: 0, end: arr.count-1)
print(arr)
