//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by 111542 on 2/2/21.
//

import XCTest

class TodoUITests: XCTestCase {

    override class func setUp() {
        XCUIApplication().launch()
    }

    func testAddItem() {

        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Add Todo Item"]/*[[".buttons[\"Add Todo Item\"].staticTexts[\"Add Todo Item\"]",".staticTexts[\"Add Todo Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let elementsQuery = app.alerts["Tasks"].scrollViews.otherElements
        
        let enterTaskNameTextField = XCUIApplication().alerts["Tasks"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Task Name"]/*[[".cells.textFields[\"Enter Task Name\"]",".textFields[\"Enter Task Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterTaskNameTextField.tap()
        enterTaskNameTextField.typeText("ookkss")
        enterTaskNameTextField.swipeUp()
        
        let enterTheTaskDescriptionTextField = XCUIApplication().alerts["Tasks"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter The Task Description"]/*[[".cells.textFields[\"Enter The Task Description\"]",".textFields[\"Enter The Task Description\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterTheTaskDescriptionTextField.tap()
        enterTheTaskDescriptionTextField.typeText("ooook")
        enterTheTaskDescriptionTextField.swipeUp()
    
        elementsQuery.buttons["Save"].tap()
        app.buttons["Refresh"].tap()

    }
}
