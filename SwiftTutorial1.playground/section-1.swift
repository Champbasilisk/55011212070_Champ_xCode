let tutorialTeam = 56
let editorialTeam = 23
var totalTeam = tutorialTeam + editorialTeam

totalTeam+=1
let priceIntInferred = -19
let priceIntExpLicit:Int = -19

let priceDoubleInferred = -19.99
let priceDoubleExpLicit:Double = -19.99

let priceFloatInferred = -19.99
let priceFloatExpLicit:Float = -19.99

let onSaleInferred = true
let onSaleExpLicit:Bool = false

let nameInferred = "Whoopie Cushion"
let nameExpLicit:String = "Whoopie Cushion"

if (onSaleInferred) {
    println("\(nameInferred) on sale for \(priceIntInferred)!")
} else {
    println("\(nameInferred) at regular price : \(priceIntInferred)!")
}