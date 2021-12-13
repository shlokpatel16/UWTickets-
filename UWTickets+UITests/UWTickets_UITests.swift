import XCTest
import SwiftUI

class UWTickets_UITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
    }
    let app = XCUIApplication()
    var globalCount = 0;
    
    // Make sure user is logged out before testing, tests valid login and password
    func testvalidlogin() {
        //app.activate()
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        
        
        // navigates to Setting Screen, if this block does not execute that means the login failed
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        let username = app.textFields["settingsUsername"]
        
        XCTAssertEqual(username.value as! String, "Change Username")

    }
    
    // Make sure user is logged out before testing, tests invalid login and password
    func testInvalidLogin() {
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("bademail")
        
        loginpassword.tap()
        loginpassword.typeText("badpassword\n")
        
        loginbutton.tap()
        
        // if user is not logged in, buy button from the home view should not exist
        let buybutton = self.app.buttons["buybutton"]
        
        XCTAssertEqual(buybutton.exists, false)
    }
    
    // login first to test
    func testSaveEmail() {
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        let email = app.textFields["settingsEmail"]
       
        
        let emailsave = self.app.buttons["saveEmail"]
        
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
        password.typeText("newpassword\n")
        
        passwordsave.tap()
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        XCTAssertEqual(password.value as! String, "newpassword")
    }

    // tests CURRENT AVERAGE shown. If you add more tickets, manually change values below
    func testAverage() {
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        let average = app.staticTexts["marketAverage"]
        XCTAssertEqual(average.exists, true)
        
        // wait for data to be loaded from database
        sleep(10)
        XCTAssertEqual(average.label, "Average asking price: $56.36")
    }

    
    // tests CURRENT AVERAGE shown. If you add more tickets, manually change values below
    func testNumberInMarket() {
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        
        // wait for data to appear in marketplace
        sleep(10)
        
        let count = self.app.tables["marketTable"]
        let num = count.children(matching: .cell).count
        XCTAssertEqual(count.exists, true)
        XCTAssertEqual(num, 24)
        
        globalCount = num;
        XCTAssertEqual(globalCount, 24)
        
    }
    
    func testAddTicketToMarket() {
        app.tabBars["Tab Bar"].buttons["Home"].tap()
        
        let sellbutton = app.buttons["Penn Statesell"]
        sellbutton.tap()
        
        let postOffer = app.sheets.buttons["sellTicket"].firstMatch
        
        
        XCTAssertEqual(postOffer.exists, false)
        
    }
    
    func testFilter() {
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        sleep(10)
        
        let picker = app.pickers["picker"]
        
        XCTAssertEqual(picker.exists, true)
        
    }
    
    
    
}
