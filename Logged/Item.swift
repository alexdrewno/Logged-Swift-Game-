import UIKit
class Item : NSObject
{
    var name : String
    var amount : Int
    
    init(name: String, amount: Int)
    {
        self.name = name
        self.amount = amount
    }
    
}