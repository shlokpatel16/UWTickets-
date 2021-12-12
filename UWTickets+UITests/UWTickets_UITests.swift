//
//  UWTickets_UITests.swift
//  UWTickets+UITests
//
//  Created by Michael He on 12/12/21.
//

import XCTest
import SwiftUI

class UWTickets_UITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
    }
    let app = XCUIApplication()
    
    func testInvalidLogin() {
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        //let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("bademail")
        
        loginpassword.tap()
        loginpassword.typeText("badpassword")
        
        app/*@START_MENU_TOKEN@*/.buttons["LoginButton"]/*[[".buttons[\"Login\"]",".buttons[\"LoginButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }
    
    func testvalidlogin() {
        //app.activate()
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
    
    // login first to test
    func testSaveEmail() {
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        let email = app.textFields["settingsEmail"]
       
        
        let emailsave = self.app.buttons["saveEmail"]
        
        let toggle = self.app.toggles["saveToggle"]
       
        
        email.tap()
        email.typeText("newemail@gmail.com\n")
        
        emailsave.tap()
        
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
         
        XCTAssertEqual(email.value as! String, "newemail@gmail.com")
    }
    
    func testSaveUsername() {
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        let username = app.textFields["settingsUsername"]
        
        let usernamesave = self.app.buttons["saveUsername"]
        
        username.tap()
        username.typeText("newusername\n")
        
        usernamesave.tap()
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        XCTAssertEqual(username.value as! String, "newusername")
    }
    
    func testSavePassword() {
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
    
        let password = app.textFields["settingsPassword"]
        
        let passwordsave = self.app.buttons["savePassword"]
        
        password.tap()
        password.typeText("newpassword")
        
        passwordsave.tap()
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        XCTAssertEqual(password.value as! String, "newpassword")
    }

    func testAverage() {
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        
        let average = app.staticTexts["marketAverage"]
        XCTAssertEqual(average, "$56.36")
        
    }
    func testFilter() {
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "Penn State")
        
        
    }
    
    
}
