//
//  UWTickets_UITests.swift
//  UWTickets+UITests
//
//  Created by Michael He on 12/12/21.
//

import XCTest

class UWTickets_UITests: XCTestCase {

    let app = XCUIApplication()
    
    func testvalidlogin() {
        app.activate()
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe")
        
        loginbutton.tap()
        
        let homebuy = self.app.buttons["buybutton"]
        XCTAssertEqual(homebuy.exists, true)
    }
    
    func testSaveUsername() {
        
    }
    
    
}
