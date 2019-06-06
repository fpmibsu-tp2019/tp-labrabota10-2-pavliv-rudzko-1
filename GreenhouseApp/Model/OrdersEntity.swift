//
//  OrdersEntity.swift
//  GreenhouseApp
//
//  Created by Lizaveta Rudzko on 3/15/1398 AP.
//

import Foundation
import CoreData

class OrdersEntity
{
    private var databaseObject: NSManagedObject?
    
    init(persistentContainer: NSPersistentContainer, user_id: Int32) // ??
    {
        let managedContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Orders")
        request.predicate = NSPredicate(format: "user_id = %d", user_id) // ?? %d
        let objects = try! managedContext.fetch(request) as! [NSManagedObject]
        
        if objects.count > 0
        {
            self.databaseObject = objects[0]
        } else {
            self.databaseObject = nil
        }
    }
    
    init(persistentContainer: NSPersistentContainer, user_id: Int32, amount: Int32, cost: Int32, flower_composition: String)
    {
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Orders", in: managedContext)!
        let id = try! managedContext.count(for: NSFetchRequest(entityName: "Orders"))
        
        databaseObject = NSManagedObject(entity: entity, insertInto: managedContext)
        databaseObject!.setValue(id + 1, forKey: "id")
        databaseObject!.setValue(user_id, forKey: "user_id")
        databaseObject!.setValue(amount, forKey: "amount")
        databaseObject!.setValue(cost, forKey: "cost")
        databaseObject!.setValue(flower_composition, forKey: "flower_composition")
        
        try! managedContext.save()
    }
    
    func delete(persistentContainer: NSPersistentContainer)
    {
        persistentContainer.viewContext.delete(databaseObject!)
        try! persistentContainer.viewContext.save()
    }
    
    func id() -> Int32?
    {
        return databaseObject?.value(forKey: "id") as? Int32
    }
    
    func user_id() -> Int32?
    {
        return databaseObject?.value(forKey: "user_id") as? Int32
    }
    
    func flower_composition() -> String?
    {
        return databaseObject?.value(forKey: "flower_composition") as? String
    }
    
    func amount() -> Int32?
    {
        return databaseObject?.value(forKey: "amount") as? Int32
    }
    
    func cost() -> Int32?
    {
        return databaseObject?.value(forKey: "cost") as? Int32
    }
    
}
