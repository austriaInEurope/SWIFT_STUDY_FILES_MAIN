//
//  treeClassTests.swift
//  treeClassTests

//  Created by Кристина Игоревна on 14.03.2025.


import Testing

struct treeClassTests {
    func createTree() -> SimpleTree<Int> {
        // Создание узлов
        let root = TreeNode(value: 1)
        let node2 = TreeNode(value: 2)
        let node3 = TreeNode(value: 3)
        let node4 = TreeNode(value: 4)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)

        // Создание дерева
        let tree = SimpleTree(root: root)
        tree.addChild(parent: root, newChild: node2)
        tree.addChild(parent: root, newChild: node3)
        tree.addChild(parent: node3, newChild: node4)
        tree.addChild(parent: node4, newChild: node5)
        tree.addChild(parent: node2, newChild: node6)
        
        return tree
    }
    
    //проверка функций:
    @Test func testAddChild() {
        let tree = createTree()
        let newNode = TreeNode(value: 7)
        tree.addChild(parent: tree.root!, newChild: newNode)
        #expect(tree.getAllNodes().map() { $0.value } == [1, 2, 6, 3, 4, 5, 7])
    }
    
    @Test func testGetAllNodes() {
        let tree = createTree()
        #expect(tree.getAllNodes().map() { $0.value } == [1, 2, 6, 3, 4, 5])
    }
    
    @Test func testFindNodesByValue() {
        let tree = createTree()
        // проверка пустого дерева и деревос 1 элементом
        #expect(tree.findNodesByValue(value: 6).map { $0.value } == [6])
        #expect(tree.findNodesByValue(value: 10).map() { $0.value } == [])
    }
    
    @Test func testDeleteNode() {
        let tree = createTree()
        tree.deleteNode(node: tree.root!.children[0])
        // проверка пустого дерева и деревос 1 элементом
        #expect(tree.getAllNodes().map() { $0.value } == [1, 3, 4, 5])
    }
    
    @Test func testCountNodes() {
        let tree = createTree()
        // проверка пустого дерева и деревос 1 элементом
        #expect(tree.countNodes() == 6)
    }
    
    @Test func moveNode() {
        let tree = createTree()
        var nodeToMove = tree.root!.children[0].children[0]
        tree.moveNode(originalNode: nodeToMove, newParent: tree.root!)
        #expect(tree.getAllNodes().map() { $0.value } == [1, 2, 3, 4, 5, 6])
    }
    
    @Test func leafCount() {
        let tree = createTree()
        #expect(tree.leafCount() == 2)
    }
  
}
