//1. В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
enum Toppings{
    case tomato
    case ham
    case mushrooms
    case mozzarella
}
struct Pizza {
    enum TypesPizza {
        case margarita
        case peperoni
        case romana
        case capricciosa
        case napolitana
        case frutti
    }
    var cost: Int
    var type: TypesPizza
    var dough: Bool
    var topping: Toppings
}
struct Chips {
    enum SizeChips {
        case small
        case medium
        case big
    }
    var cost: Int
    var size: SizeChips
}
class Pizzeria<T>: PizzeriaAction {
    var foods: [T] = []
    init (foods: [T]) {
        self.foods = foods}
            
    func add(food: T){
        self.foods.append(food)
    }
    func takeFoods() -> [T]{
        return self.foods
    }
    func oppen(){
        print("Pizzeria oppen")
    }
    func close(){
        print("Pizzeria close")
    }
}
var order1 = Chips (cost: 5, size: .medium)
var order2 = Pizza (cost: 25, type: .romana, dough: true, topping: Toppings.ham)
var pizzeriaRon = Pizzeria(foods:[order1, order2])
print(pizzeriaRon.takeFoods())
pizzeriaRon.oppen()

//2. Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
//3. Создайте протокол, в котором будут содержаться функции открытия и закрытия.
protocol PizzeriaAction{
    func oppen()
    func close()
}

//4. Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.
class Pizzeria<T> {
    var foods: [T] = []
    init (foods: [T]) {
        self.foods = foods
    }
            
    func add(food: T){
        self.foods.append(food)
    }
    func takeFoods() -> [T]{
        return self.foods
    }
}

extension Pizzeria: PizzeriaAction {
    func oppen() {
        print("oppen")
    }
    func close() {
        print("close")
    }
}
pizzeriaRon.close()

//5. Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.

func subtractNumbers(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func subtractNumbers(_ a: Double, _ b: Double) -> Double {
    return a - b
}

let resultInt = subtractNumbers(10, 5)
let resultDouble = subtractNumbers(10.5, 3.2)

print("Result of subtracting 5 from 10: \(resultInt)")
print("Result of subtracting 3.2 from 10.5: \(resultDouble)")
