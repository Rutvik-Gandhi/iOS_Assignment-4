//
//  Item.swift
//  group5Assignment4
//
//  Created by user215207 on 11/10/22.
//

import Foundation

class Item : NSObject, NSSecureCoding
    {
    static var supportsSecureCoding: Bool{
        get {
            return true
        }
    }

    var field1: String
    var field2: String
    var field3: String

    override init(){
        field1 = ""
        field2 = ""
        field3 = ""
        super.init()
    }

    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(field1,
                    forKey: "text1")
        aCoder.encode(field2,
                    forKey: "text2")
        aCoder.encode(field3,
                    forKey: "text3")
    }
    required init(coder aDecoder: NSCoder)
    {
        field1 = aDecoder.decodeObject(
            forKey: "text1") as! String
        field2 = aDecoder.decodeObject(
            forKey: "text2") as! String
        field3 = aDecoder.decodeObject(
            forKey: "text3") as! String

            super.init()
    }
}
