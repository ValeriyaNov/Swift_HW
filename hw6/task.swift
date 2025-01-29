// 1. Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками

//2. Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задается в инициализаторе

//3. Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра

struct Employee {
    var name: String
    var salary: Double
    var position: String
    
    init(name: String, salary: Double, position: String) {
        self.name = name
        self.salary = salary
        if position == "Cashier" || position == "Chef" {
            self.position = position
        } else {
            fatalError("Invalid position for pizzeria employee")
        }
    }
}

class Table {
    var numberOfSeats: Int
    var pizzeria: Pizzeria
    var guests: Int = 0
    
    init(numberOfSeats: Int, pizzeria: Pizzeria) {
        self.numberOfSeats = numberOfSeats
        self.pizzeria = pizzeria
    }
    
    func seatGuests(numberOfGuests: Int) -> Bool {
        if numberOfGuests <= numberOfSeats {
            guests = numberOfGuests
            return true
        } else {
            return false
        }
    }
}

class Pizzeria {
    var employees: [Employee]
    var tables: [Table]
    
    init() {
        self.employees = []
        self.tables = []
        self.tables.append(Table(numberOfSeats: 4, pizzeria: self))
        self.tables.append(Table(numberOfSeats: 6, pizzeria: self))
        self.tables.append(Table(numberOfSeats: 2, pizzeria: self))
        self.tables.append(Table(numberOfSeats: 4, pizzeria: self))
    }
}

let pizzeria = Pizzeria()
pizzeria.employees.append(Employee(name: "Иван", salary: 58900, position: "Cashier"))
pizzeria.employees.append(Employee(name: "Мария", salary: 98745, position: "Chef"))

var guests = Int.random(in: 1...11)
var freeTables:[Table]=[]
for table in pizzeria.tables {
    if table.seatGuests(numberOfGuests: guests) {
        freeTables.append(table)
    }
}
if freeTables.isEmpty {
    print("Столика для \(guests) гостей нет в пиццерии")
} else{
var result:String = ""
let counter = freeTables.count
for i in 0..<counter-1{
    result = result + String(freeTables[i].numberOfSeats) + ","
}
print("Есть столики для \(result) \(freeTables[counter-1].numberOfSeats) гостей, где могут разместиться \(guests) гостей")   
}
