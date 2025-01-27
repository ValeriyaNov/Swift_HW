//1. Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)
//2. Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.
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
var order1 = Pizza (cost: 25, type: .romana, dough: true, topping: Toppings.ham)
var order2 = Pizza (cost: 45, type: .napolitana, dough: false, topping: Toppings.tomato)
var order3 = Pizza (cost: 80, type: .peperoni, dough: true, topping: Toppings.tomato)
print (order1.topping)
//3. Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
//4. Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
//5. Создать экземпляр класса пиццерии и добавить в него несколько пицц.
class Pizzeria {
    private var pizzas: [Pizza] = []
    init (pizzas: [Pizza]) {
        self.pizzas = pizzas}
            
    func addPizza(pizza: Pizza){
        self.pizzas.append(pizza)
    }
    func printPizzas(){
        for i in self.pizzas{
        let flag = i.dough ? "thin" : "thick"
        print(i.type, "cost", i.cost, "on", flag, "whith", i.topping, ". ")
        }

    }
}
var pizzeriaRon = Pizzeria(pizzas:[order1, order2])
pizzeriaRon.addPizza(pizza: order3)
pizzeriaRon.printPizzas()