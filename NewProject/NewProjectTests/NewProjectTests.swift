//
//  NewProjectTests.swift
//  NewProjectTests
//
//  Created by Tabish Umer Farooqui on 18/07/2017.
//  Copyright © 2017 Nisum Technologies. All rights reserved.
//

import XCTest
@testable import NewProject

class NewProjectTests: XCTestCase {
    
    let myView = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let selectedTextField = UITextField()
        
        let testValue = 10
        selectedTextField.text = "2"
        selectedTextField.tag = 12
        
        let getValue = myView.calculateTotalAmountTest(tag: selectedTextField.tag, textField: selectedTextField)

        XCTAssert(Int(getValue) == testValue)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

