func bubbleSort(_ arr: inout [Int]) {
    for i in 0..<arr.count {
        for j in i..<arr.count {
            if arr[i] > arr[j] {
                arr.swapAt(i, j)
            }
        }
    }
}

//泛型
func bubbleSortPattern<T: Comparable>(_ arr: inout [T]) {
    for i in 0..<arr.count {
        for j in i..<arr.count {
            if arr[i] > arr[j] {
                arr.swapAt(i, j)
            }
        }
    }
}

var arr: [Int] = [3,5,6,8,2,1,9,10,30,20,7]
var arr2: [Int] = arr

bubbleSort(&arr)
bubbleSortPattern(&arr2)
print(arr)
print(arr2)
