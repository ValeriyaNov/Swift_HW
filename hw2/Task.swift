// 1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func calc (contribution: Double, bid:Double, period:Int) -> Double{
    var totalCont = contribution
    for _ in 1 ... period{
        totalCont = totalCont + totalCont*(bid/100)
    }
    return totalCont 
}
let contribution:Double = 10;
let bid:Double = 15;
let period = 2;
let sum = calc(contribution:contribution, bid:bid, period:period)
print (sum)

// 2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.

// 3. Добавить возможность получения названия пиццы через rawValue

enum Pizza: String{
    case margarita
    case greek
    case carbonara
}

let pizza1 = Pizza.margarita
let pizza2 :Pizza = .greek
let pizza3 = Pizza.carbonara

print(pizza1)
print(pizza3.rawValue)