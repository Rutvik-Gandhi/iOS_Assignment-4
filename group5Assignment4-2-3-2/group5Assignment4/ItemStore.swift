//
//  ItemStore.swift
//  group5Assignment4
//
//  Created by user215207 on 11/10/22.
//
import Foundation

class ItemStore {
    var itemArray : [Item] = []
    let ItemArchiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for:.documentDirectory,in:
            .userDomainMask)
        let documentDirectory = documentDirectories.first!
        print(documentDirectory)
        return documentDirectory.appendingPathComponent("item hidden")
}()
    init() {
        do {
            if let data = UserDefaults.standard.data(forKey: "items stored") {
                let archiveditems = try NSKeyedUnarchiver.unarchivedObject(ofClasses:
[NSArray.self, Item.self], from: data) as? [Item];self.itemArray = archiveditems!
            }
        else{
            print("Data not found")
            }
        }
        catch {
            print (" failed")
            }
        }
    func saveChanges () -> Bool {
        var result : Bool = true
    print("storing items at \(ItemArchiveURL.path)")

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: itemArray, requiringSecureCoding: true)
            try data.write(to: ItemArchiveURL)
            UserDefaults.standard.set(data, forKey: "stored item")
        }
    catch{
        result = false
        print(" failed")
        }
    return result
    }
}
