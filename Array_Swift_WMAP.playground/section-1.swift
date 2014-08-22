var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs","Milk"] //นิยมใช้
//var shoppingListExplicit: [String] = ["Eggs","Milk"] //การประกาศ array

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains\(shoppingList.count) items.")

//---------การเพิ่มข้อมูลลง array----------//
shoppingList.append("Flour")
shoppingList += "Baking Power"
shoppingList += ["Chocolate Spreed","Cheese","Butter"]

var firstItem = shoppingList[0] //เรียก index
shoppingList[0] = "Six eggs"
shoppingList[0...3] = ["Banana","Apples"] //วน loop 0-3

let possibleTipsInferred = [0.5, 0.18, 0.20]
let possibleTipExlicit:[Double] = [0.5, 0.18, 0.20]
var numberOhItem = possibleTipsInferred.count //นับจำนวนใน Array

possibleTipsInferred.isEmpty

//-------------เพิ่มค่าใน Array-------------//
shoppingList.insert("maple syrup", atIndex: 0)
shoppingList

shoppingList.append("Flour")
shoppingList

shoppingList[1...3] = ["Banana","Apple"]
shoppingList

let Flour = shoppingList.removeLast()
let Apple = shoppingList.removeAtIndex(2)
shoppingList

shoppingList.removeLast()