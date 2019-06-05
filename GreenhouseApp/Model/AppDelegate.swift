//
//  AppDelegate.swift
//  GreenhouseApp
//
//  Created by Elizaveta on 5/31/19.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        if !UserDefaults.standard.bool(forKey: "HasLaunchedOnce")
        {
            UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.register(defaults: ["user1" : "111"])
            UserDefaults.standard.register(defaults: ["user2" : "222"])
            UserDefaults.standard.register(defaults: ["user3" : "333"])
            UserDefaults.standard.register(defaults: ["user4" : "444"])
            
            // add coordinates ?
            
        }
        var applicationDocumentsDirectory: NSURL = {
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return urls[urls.count-1] as NSURL
        }()
        print(applicationDocumentsDirectory )
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

//        let container = NSPersistentContainer(name: "GreenhouseApp")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//
//
        
        
        
        let databaseName = "GreenhouseApp"
        
        let container = NSPersistentContainer(name: databaseName)
        
        var persistentStoreDescriptions: NSPersistentStoreDescription
        
        let storeUrl = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!.appendingPathComponent(databaseName + ".sqlite")
        
        print("stroreUrl : ")
        print(storeUrl)
        
        let storeUrlFolder = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!
        
        if !FileManager.default.fileExists(atPath: (storeUrl.path))
        {
            print("ok!!")
            
            let seededDataUrl = Bundle.main.url(forResource: databaseName, withExtension: "sqlite")
            let seededDataUrl2 = Bundle.main.url(forResource: databaseName, withExtension: "sqlite-shm")
            let seededDataUrl3 = Bundle.main.url(forResource: databaseName, withExtension: "sqlite-wal")
            
            try! FileManager.default.copyItem(at: seededDataUrl!, to: storeUrl)
            try! FileManager.default.copyItem(at: seededDataUrl2!, to: storeUrlFolder.appendingPathComponent(databaseName + ".sqlite-shm"))
            try! FileManager.default.copyItem(at: seededDataUrl3!, to: storeUrlFolder.appendingPathComponent(databaseName + ".sqlite-wal"))
            
        }
        
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: storeUrl)]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                
                fatalError("Unresolved error \(error),")
            }
        })

        
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

