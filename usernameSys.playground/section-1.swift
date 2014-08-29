class userSys {
    
    let userName : String
    let password : String
    var userID : [String:String]
    
    init(userName:String,password:String){
        self.userName = userName
        self.password = password
        userID=[userName:password]
    }
    
    func addID(userName:String,password:String){
        userID[userName]=password
    }
    
    func changePass(userName:String,password:String){
        if let oldUser = userID.updateValue(password, forKey: userName){
            println("Change successful \(oldUser).")
        }
    }
}
let userSystem = userSys(userName: "Champ", password: "1234")
userSystem.addID("Test", password: "12345")
userSystem.addID("admin", password: "admin")
userSystem.changePass("Champ", password: "basilisk")
userSystem.userID
userSystem.addID("admin2", password: "admin")