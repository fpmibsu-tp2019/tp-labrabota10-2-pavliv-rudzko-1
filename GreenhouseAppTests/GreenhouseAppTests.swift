//
//  GreenhouseAppTests.swift
//  GreenhouseAppTests
//
//  Created by Elizaveta on 5/31/19.
//

import CoreData
import XCTest
import MapKit
@testable import GreenhouseApp

class GreenhouseAppTests: XCTestCase {

    
    
    override func setUp() {
   
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
    func testGreenhouseAnnotation(){
        let titleTest = "shop1"
        let ga = GreenhouseAnnotation(title: titleTest, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: 1.1)!, longitude:CLLocationDegrees(exactly: 1.1)! ))
        XCTAssert(ga.subtitle! == titleTest)
    }
    
    func testAuthorization(){
        let login = "userTest"
        let password = "passwordTest"
        let login2 = "userTest2"
        let password2 = "passwordTest2"
        let ap = AppDelegate.init()
        let persistentContainer = ap.persistentContainer
        
        let testObject = AuthorizationEntity(persistentContainer: persistentContainer, login: login, password: password)
        let testObject2 = AuthorizationEntity(persistentContainer: persistentContainer, login: login2, password: password2)
        XCTAssert(testObject.login()! == login)
        XCTAssert(testObject.password()! == password)
        XCTAssert(testObject.user_id()! == (testObject2.user_id()! - 1))
        testObject.delete(persistentContainer: persistentContainer)
        testObject2.delete(persistentContainer: persistentContainer)
        XCTAssert(testObject.login() == nil)
        XCTAssert(testObject.password() == nil)
        XCTAssert(testObject.user_id() == nil)
    }

    func testUser(){
        let login = "userTest"
        let login2 = "userTest2"
        let ap = AppDelegate.init()
        let persistentContainer = ap.persistentContainer
        let testObject = UserEntity(persistentContainer: persistentContainer, login: login)
        let testObject2 = UserEntity(persistentContainer: persistentContainer, login: login2)
        XCTAssert(testObject.login()! == login)
        XCTAssert(testObject.id()! == (testObject2.id()! - 1))
        testObject.delete(persistentContainer: persistentContainer)
        testObject2.delete(persistentContainer: persistentContainer)
        XCTAssert(testObject.id() == nil)
        XCTAssert(testObject.login() == nil)
    }
    
    func testOrders(){
        let userID: Int32 = 4
        let amount: Int32 = 10
        let cost: Int32 = 100
        let flower_composition = "RedRoses"
        let ap = AppDelegate.init()
        let persistentContainer = ap.persistentContainer
        let testObject = OrdersEntity(persistentContainer: persistentContainer, user_id: userID, amount: amount, cost: cost, flower_composition: flower_composition)
        let testObject2 = OrdersEntity(persistentContainer: persistentContainer, user_id: userID)
        XCTAssert(testObject.id()! == testObject2.id()!)
        XCTAssert(testObject.amount()! == amount)
        XCTAssert(testObject.cost()! == cost)
        XCTAssert(testObject.user_id()! == userID)
        XCTAssert(testObject.flower_composition()! == flower_composition)
        testObject.delete(persistentContainer: persistentContainer)
        testObject2.delete(persistentContainer: persistentContainer)
        XCTAssert(testObject.amount() == nil)
        XCTAssert(testObject.cost() == nil)
        XCTAssert(testObject.flower_composition() == nil)
        XCTAssert(testObject.id() == nil)
        XCTAssert(testObject.user_id() == nil)
    }
    
    func testFlower(){
        let amount: Int32 = 10
        let cost: Int32 = 100
        let flower_composition = "RedRoses"
        let kind = "Yellow"
        let name = "ForMyWoman"
        let ap = AppDelegate.init()
        let persistentContainer = ap.persistentContainer
        let testObject = Flower_compositionsEntity(persistentContainer: persistentContainer, amount: amount, cost: cost, composition_name: flower_composition, kind: kind, name: name)
        let testObject2 = Flower_compositionsEntity(persistentContainer: persistentContainer, flower_composition: flower_composition)
        XCTAssert( testObject.composition_name()! == flower_composition)
        XCTAssert(testObject.amount()! == amount)
        XCTAssert(testObject.cost()! == cost)
        XCTAssert(testObject.kind()! == kind)
        XCTAssert(testObject.name()! == name)
        XCTAssert(testObject.id() == testObject2.id())
        testObject.delete(persistentContainer: persistentContainer)
        testObject2.delete(persistentContainer: persistentContainer)
        XCTAssert(testObject.amount() == nil)
        XCTAssert(testObject.cost() == nil)
        XCTAssert(testObject.composition_name() == nil)
        XCTAssert(testObject.id() == nil)
        XCTAssert(testObject.name() == nil)
        XCTAssert(testObject.kind() == nil)
    }
    
    func testCompositions(){
        let amount: Int32 = 10
        let cost: Int32 = 100
        let composition_name = "RedRoses"
        let ap = AppDelegate.init()
        let persistentContainer = ap.persistentContainer
        let testObject = CompositionsEntity(persistentContainer: persistentContainer, amount: amount, cost: cost, composition_name: composition_name)
        let testObject2 = CompositionsEntity(persistentContainer: persistentContainer, composition_name: composition_name)
        XCTAssert(testObject.id()! == testObject2.id()!)
        XCTAssert(testObject.amount()! == amount)
        XCTAssert(testObject.composition_name()! == composition_name)
        XCTAssert(testObject.cost()! == cost)
        testObject.delete(persistentContainer: persistentContainer)
        testObject2.delete(persistentContainer: persistentContainer)
        XCTAssert(testObject.id() == nil)
        XCTAssert(testObject.amount() == nil)
        XCTAssert(testObject.composition_name() == nil)
        XCTAssert(testObject.cost() == nil)
    }
    
}
