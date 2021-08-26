
/**
         1
     2               3
   4     5         6         7
       8                       9
 
 */

/**
 前序： 1,2,4,5,8,3,6,7,9
 中序： 4,2,5,8,1,6,3,7,9
 后序： 4,8,5,2,6,9,7,3,1
 层序：[1],[2,3],[4,5,6,7],[8,9]
 锯齿：[1],[3,2],[4,5,6,7],[9,8]
 */


class TreeNode {
    var val: Int = 0
    var leftNode: TreeNode?
    var rightNode: TreeNode?
}

///初始化树
var nodeArr: [TreeNode] = []
for i in 1...9 {
    let node = TreeNode()
    node.val = i
    nodeArr.append(node)
}
let rootNode = nodeArr[0]
rootNode.leftNode = nodeArr[1]
rootNode.rightNode = nodeArr[2]
nodeArr[1].leftNode = nodeArr[3]
nodeArr[1].rightNode = nodeArr[4]
nodeArr[2].leftNode = nodeArr[5]
nodeArr[2].rightNode = nodeArr[6]
nodeArr[4].rightNode = nodeArr[7]
nodeArr[6].rightNode = nodeArr[8]


//前序
func preOrder(_ rootNode: TreeNode?) -> [Int] {
    guard let root = rootNode else {
        return []
    }
    var res: [Int] = []
    res.append(root.val)
    res.append(contentsOf: preOrder(root.leftNode))
    res.append(contentsOf: preOrder(root.rightNode))
    return res
}

//中序
func middleOrder(_ rootNode: TreeNode?) -> [Int] {
    guard let root = rootNode else {
        return []
    }
    var res: [Int] = []
    res.append(contentsOf: middleOrder(root.leftNode))
    res.append(root.val)
    res.append(contentsOf: middleOrder(root.rightNode))
    return res
}

//后序
func tailOrder(_ rootNode: TreeNode?) -> [Int] {
    guard let root = rootNode else {
        return []
    }
    var res: [Int] = []
    res.append(contentsOf: tailOrder(root.leftNode))
    res.append(contentsOf: tailOrder(root.rightNode))
    res.append(root.val)
    return res
}

//层序
func floorOrder(_ rootNode: TreeNode?) -> [[Int]] {
    guard let root = rootNode else {
        return []
    }
    var res: [[Int]] = []
    var queue: [TreeNode] = [root]
    
    while queue.count > 0 {
        var floorArr: [Int] = []
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            floorArr.append(node.val)
            if let leftNode = node.leftNode {
                queue.append(leftNode)
            }
            if let rightNode = node.rightNode {
                queue.append(rightNode)
            }
        }
        res.append(floorArr)
    }
    return res
}

//锯齿
func sawtoothOrder(_ rootNode: TreeNode?) -> [[Int]] {
    guard let root = rootNode else {
        return []
    }
    var res: [[Int]] = []
    var queue: [TreeNode] = [root]
    var leading: Bool = true
    while queue.count > 0 {
        var floorArr: [Int] = []
        for _ in 0..<queue.count {
            let node: TreeNode = queue.removeFirst()
            floorArr.append(node.val)
            if let leftNode = node.leftNode {
                queue.append(leftNode)
            }
            if let rightNode = node.rightNode {
                queue.append(rightNode)
            }
        }
        if leading {
            res.append(floorArr)
        } else {
            res.append(floorArr.reversed())
        }
        leading = !leading
    }
    return res
}

let preRes = preOrder(rootNode)
let midRes = middleOrder(rootNode)
let tailRes = tailOrder(rootNode)
let floorRes = floorOrder(rootNode)
let sawToothRes = sawtoothOrder(rootNode)
print("前序：\(preRes)")
print("中序：\(midRes)")
print("后序:\(tailRes)")
print("层序:\(floorRes)")
print("锯齿:\(sawToothRes)")









