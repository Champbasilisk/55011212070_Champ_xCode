let array: Array<Int> = [1,2,3,4]
let dictionary: Dictionary<String,Int> = ["dog":1, "elephant":2]
var airports: [String :String] = ["TYO": "TYO","DUB":"Dublin"]

//------ตรวจสอบว่าว่างหรือไม่-------//
if airports.isEmpty{
    println("The airport dictionary is empty.")
}else{
    println("The airport dictionary is not empty.")
}

println("The airports dictionary contains\(airports.count) item")

airports["LHR"] = "London Heathrow"
// the airport dictionary now contains 3 item
airports

if let oldValue = airports.updateValue("Dublin Tnternational", forKey: "DUB"){
    println("THe old value for DUB was \(oldValue).")
}
airports

airports["APL"] = "Apple International"

airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB"){
    println("The removed airport's name is \(removedValue).")
}else{
    println("The airports dictionary dose not contain a value for DUB.")
}
