var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs","Milk"]
//var shoppingListExplicit: [String] = ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains\(shoppingList.count) items.")

shoppingList.append("Flour")
shoppingList += ["Baking Power"]
shoppingList += ["Chocolate Spreed","Cheese","Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
//shoppingList[0...3] = ["Banana","Apples"]

let possibleTipsInferred = [0.5, 0.18, 0.20]
let possibleTipExlicit:[Double] = [0.5, 0.18, 0.20]
var numberOhItem = possibleTipsInferred.count

possibleTipsInferred.isEmpty

shoppingList.insert("pizza", atIndex: 0)
shoppingList

shoppingList.append("Flour")
shoppingList

shoppingList[1...3] = ["Banana","Apple"]
shoppingList

let Flour = shoppingList.removeLast()
let Apple = shoppingList.removeAtIndex(2)
shoppingList

shoppingList.removeLast()
