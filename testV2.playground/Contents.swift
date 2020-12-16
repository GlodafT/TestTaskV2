import UIKit

//Создайте перечисление CocktailName со следующими безалкогольными коктейлями:
//orangeMojito (состав: orange, mint, lime, spakrling water)
//cranberrySparkler (состав: cranberry, sparkling water, lime, orange)
//pinkLemonade (состав: lemon, orange, raspberry, mint, cold water)
//sangriaPunch (состав: non-alchocol red wine, orange, lemon, lime, cold water)
//Создайте перечисление Ingridients, в котором будут перечислены все ингриденты, нужные для приготовления коктейлей из пункта 1.
//Задайте каждому case связанное значение с плавающей точкой, равное стоимости ингридента (стоимость должна быть уникальной)
//Создайте словарь cocktails, в котором ключ — имя коктейля, а значение — массив типа Ingridients, который содержит коктейль.
//На основе словаря cocktails, создайте новый словарь cocktailPrices, в котором ключ - имя коктейля, а значение - сумма за коктейль (складывается из стоимости его ингридиентов).
//Добавление значений в словарь происходит в цикле. Также, как и вычисление стоимости коктейля).
//Выведите элементы словаря в консоль в формате: "Цена за имяКоктейля - n".
//Посчитайте среднюю сумму коктейля в коктейльной карте (сумма за каждый коктейль, делённая на количество коктейлей)
//Создайте случайное имя коктейля. Если не удалось, то установите дефолтный коктейль - sangriaPunch
//Создайте тьюпл client с 2 аргументами:
//имя коктейля, который он хочет заказать
//сумма, которую он готов оставить в баре
//Если у клиента хватает денег на желаемый коктейль, то налейте ему его. В противном случае, предложите выбрать что-нибудь другое.
//(со звёздочкой) Если у клиента не хватает денег на желаемый коктейль, то предложите любой другой коктейль, на который у него хватает денег.



enum CocktailName {
    case orangeMojito, cranberrySparkler, pinkLemonade, sangriaPunch
}


enum Ingridients: Double {
    case orange = 1.23,
         mint = 0.90,
         lime = 3.30,
         spakrlingWater = 2.22,
         cranberry = 1.90,
         raspberry = 0.60,
         coldWater = 9.99,
         nonAlchocolRedWine = 6.60,
         lemon = 5.55
}

var cocktails: [CocktailName: [Ingridients]] = [.orangeMojito: [.orange, .mint, .lime, .spakrlingWater],
                                                .cranberrySparkler: [.cranberry, .spakrlingWater, .lime, .orange],
                                                .pinkLemonade: [.lemon, .orange, .raspberry, .mint, .coldWater],
                                                .sangriaPunch: [.nonAlchocolRedWine, .orange, .lemon, .lime, .coldWater]]


var cocktailPrices: [CocktailName: Double] = [:]
var summOfCocktails: Double = 0
var everageOfCocktails: Double = 0


for (coctail, ingridients) in cocktails {
//    print()
    var priceOfIngridients: Double = 0
    for price in ingridients {
         priceOfIngridients += price.rawValue
    }
    cocktailPrices.updateValue(priceOfIngridients, forKey: coctail)
}


for PrintPriceOfCockteils in cocktailPrices {
    print("Price of cocktail \(PrintPriceOfCockteils.key) - \(PrintPriceOfCockteils.value)")
    summOfCocktails += PrintPriceOfCockteils.value
    everageOfCocktails = summOfCocktails / Double(cocktailPrices.count)
}

var randomCocktail = cocktailPrices.keys.randomElement() ?? .sangriaPunch

let client = (CocktailName.sangriaPunch, Double(25))
    
for (cocktail1, price) in cocktailPrices {
    switch cocktail1 {

    case _ where client.0 == cocktail1 && client.1 >= price :
        print()
        print("Keep your \(cocktail1)")
        break
        
    case _ where client.0 == cocktail1 && client.1 < price :
        print()
        print("You need more gold, for a \(cocktail1)")
        for (cocktail123, price1) in cocktailPrices {
            if price1 <= client.1 {
                print()
                print("You can buy \(cocktail123)")
            }
        }
    default:
       ()
    }
}
