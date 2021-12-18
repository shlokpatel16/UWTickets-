import XCTest
import SwiftUI

extension XCUIElement {
    func selectPicker(value: String, timeout: TimeInterval) {
            let pickerWheel = pickerWheels.firstMatch
            let row = pickerWheels[value]
            
            while !row.waitForExistence(timeout: timeout) {
                pickerWheel.adjust(toPickerWheelValue: value)
            }
    }
}
class UWTickets_UITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
    }
    let app = XCUIApplication()
    var globalCount = 0;
    

    /*
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
     */
    
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

        let logout = self.app.buttons["logoutButton"]
        logout.tap()

    }
    
    // login first to test
    func testSaveEmail() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        let email = app.textFields["settingsEmail"]
       
        
        let emailsave = self.app.buttons["saveEmail"]
        
        email.tap()
        email.typeText("newemail@gmail.com\n")
        
        emailsave.tap()
        
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
         
        XCTAssertEqual(email.value as! String, "newemail@gmail.com")
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
    }
    
    func testSaveUsername() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        let username = app.textFields["settingsUsername"]
        
        let usernamesave = self.app.buttons["saveUsername"]
        
        username.tap()
        username.typeText("newusername\n")
        
        usernamesave.tap()
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        XCTAssertEqual(username.value as! String, "newusername")
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
    }
    
    func testSavePassword() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
    
        let password = app.textFields["settingsPassword"]
        
        let passwordsave = self.app.buttons["savePassword"]
        
        password.tap()
        password.typeText("newpassword\n")
        
        passwordsave.tap()
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        
        XCTAssertEqual(password.value as! String, "newpassword")
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
    }

    // tests CURRENT AVERAGE shown. If you add more tickets, manually change values below
    func testAverage() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        let average = app.staticTexts["marketAverage"]
        XCTAssertEqual(average.exists, true)
        
        // wait for data to be loaded from database
        sleep(10)
        XCTAssertEqual(average.label, "Average asking price: $111.10")
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
    }

    
    // tests CURRENT AVERAGE shown. If you add more tickets, manually change values below
    func testNumberInMarket() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        
        // wait for data to appear in marketplace
        sleep(10)
        
        let count = self.app.tables["marketTable"]
        let num = count.children(matching: .cell).count
        XCTAssertEqual(count.exists, true)
        XCTAssertEqual(num, 10)
        
        globalCount = num;
        XCTAssertEqual(globalCount, 10)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testAddTicketToMarket() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ///
        app.tabBars["Tab Bar"].buttons["Home"].tap()
        
//        let sellbutton = app.buttons["Penn Statesell"]
        //sellbutton.tap()
        
        //let postOffer = app.sheets.buttons["sellTicket"].firstMatch
        
        
        //XCTAssertEqual(postOffer.exists, false)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testFilter() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        sleep(10)
        /*
        let picker = app.pickers["picker"]
        picker.selectPicker(value: "Illinois", timeout: 1)
         */
        
        //XCTAssertEqual(picker.exists, true)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testFilter2() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        sleep(10)
        /*
        let picker = app.pickers["picker"]
        picker.selectPicker(value: "Illinois", timeout: 1)
         */
        
        //XCTAssertEqual(picker.exists, true)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testFilter3() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Market"].tap()
        sleep(10)
        /*
        let picker = app.pickers["picker"]
        picker.selectPicker(value: "Illinois", timeout: 1)
         */
        
        //XCTAssertEqual(picker.exists, true)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testExchangeField() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        sleep(10)
        /*
        let picker = app.pickers["picker"]
        picker.selectPicker(value: "Illinois", timeout: 1)
         */
        
        //XCTAssertEqual(picker.exists, true)
        
        let p = self.app.textFields["ExchangePrice"]
        p.tap()
        p.typeText("50\n")
        //let link = self.app.navigationBars.links["currentLink"]
        //XCTAssertEqual(link.exists, true)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testExchangeButton() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        sleep(5)
        /*
        let picker = app.pickers["picker"]
        picker.selectPicker(value: "Illinois", timeout: 1)
         */
        
        //XCTAssertEqual(picker.exists, true)
        let p = self.app.textFields["ExchangePrice"]
        p.tap()
        p.typeText("50\n")
        let send = self.app.buttons["offerButton"]
        send.tap()
        XCTAssertEqual(self.app.alerts.element.label, "Invalid Game")
        
        let ok = app.alerts["chooseGame"]
        let button = ok.buttons["Ok"]
        button.tap()
        //XCTAssertEqual(link.exists, true)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        
    }
    
    func testCurrent() {
        // LOGIN FIRST
        let loginemail = self.app.textFields["LoginEmail"]
        let loginpassword = self.app.secureTextFields["Password"]
        let loginbutton = self.app.buttons["LoginButton"]
        
        loginemail.tap()
        loginemail.typeText("michaelhe@gmail.com")
        
        loginpassword.tap()
        loginpassword.typeText("michaelhe\n")
        
        loginbutton.tap()
        ////
        app.tabBars["Tab Bar"].buttons["Exchange"].tap()
        sleep(5)
        /*
        let picker = app.pickers["picker"]
        picker.selectPicker(value: "Illinois", timeout: 1)
         */
        
        //XCTAssertEqual(picker.exists, true)
        
        //let link = self.app.links["currentLink"]
        //XCTAssertEqual(link.exists, true)
        
        //LOGOUT
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        let logout = self.app.buttons["logoutButton"]
        logout.tap()
        

        
        
    }
    

    
}
