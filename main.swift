// Определение узла списка
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// Определение односвязного списка
class SinglyLinkedList<T> {

    private var head: Node<T>? // голова односвязного списка - первая его ячейка
    //MARK: Вывод списка
    func printList() {
        var current: Node<T>? = head
        if current == nil {
            print("The list is empty")
            return
        }
        while current != nil{
            if current != nil {
                print(current?.value, terminator: " -> ")
                current = current?.next
            }
        }
        print(current)
    }
    
    // Поиск элемента по значению
    func search(value: T) -> Bool where T: Equatable {
        var current: Node<T>? = head
        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
    //MARK: Добавление элемента в начало списка
    func prepend(value: T) {
            let newNode = Node(value: value, next: head) //здесь мы создаеи новую ноду (ячейку), что бы сложить ее в голову списка
            head = newNode
        }
    //MARK: Добавление элемента в конец списка
    func append(value: T) {
        let headNode = Node(value: value)
        if head == nil {
            head = headNode
        } else {
            var current: Node<T>? = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = headNode
        }
    }
    
    // Удаление элемента по значению
    func remove(value: T) where T: Equatable {
        var current: Node<T>? = head
        var preveus: Node<T>? = nil
        if current == nil {
            print("The list is empty")
            return
        }
        if current?.value == value {
            head = current?.next
            return
        }else {
            while current?.next != nil {
                
                if current?.value == value {
                    preveus?.next = current?.next
                    return
                }
                preveus = current
                current = current?.next
            }
            print("The element \(value) is not found")
        }
    }
}

// Пример использования
 
//append() - конец списка - OK

let list = SinglyLinkedList<Int>()
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)

//prepend() - начало списка - OK
list.prepend(value: 0)

//printList() - вывод - OK
list.printList() // 0 -> 1 -> 2 -> 3 -> nil

//remove() - вывод -
list.remove(value: 2)
list.printList() // 0 -> 1 -> 3 -> nil

print(list.search(value: 3)) // true
print(list.search(value: 2)) // false

