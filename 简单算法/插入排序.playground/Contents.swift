
func insertSort<T: Comparable>(_ arr: inout [T]) {
    for i in 0..<arr.count {
        let temp = arr[i]
        for j in (0..<i).reversed() {
            if arr[j] > temp {
                arr.swapAt(j, j+1)
            }
        }
    }
}

var arr: [Int] = [3,5,6,8,2,1,9,10,30,20,7]
var arr2: [Int] = [1]
insertSort(&arr)
insertSort(&arr2)
print(arr)
print(arr2)
