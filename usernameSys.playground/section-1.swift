class userSys {
    
    let userName : String
    let password : String
    var userID : [String:String]
    
    init(userName:String, password:String){
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
     /*-- Add count function--*/
    func totalUser() -> Int{
        var total=userID.count
        return total
    }
     /*-- Add addList function--*/
    func addList(newUser:Dictionary<String,String>){
        for (key,values) in newUser{
            userID[key] = values
            println("key: \(key) value:\(values)")
        }
        for userName in newUser.keys{
            println("User name : \(userName)")
        }
        
        for password in newUser.values{
            println("Password : \(password)")
        }
    }
    /*-- Add Remove user function--*/
    func removeUser(userName:String){
        if let removeUser = userID.removeValueForKey("\(userName)"){
            println("Remove user name\(removeUser).")
        } else {
            println("User not exist")
        }
    }    
}
let userSystem = userSys(userName: "Champ", password: "1234")
userSystem.addID("Test", password: "12345")
userSystem.addID("admin", password: "admin")
userSystem.changePass("Champ", password: "basilisk")
userSystem.userID
userSystem.addID("admin2", password: "admin")
userSystem.addID("newid", password: "newpw")
userSystem.userID

/*------------ update new function 3/9/14-----------*/

userSystem.totalUser()
userSystem.removeUser("admin")
userSystem.removeUser("bbb")
userSystem.addList(["Test1":"0000","Test2":"1111","Test3":"2222"])
