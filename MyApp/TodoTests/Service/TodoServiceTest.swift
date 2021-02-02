//
//  TodoServiceTest.swift
//  GetirTodoTests
//
//  Created by Veli Bacik on 1/13/21.
//

import XCTest
@testable import GetirTodo


class TodoServiceTest: XCTestCase {

    let timeout: TimeInterval = 300.0


    let service: TodoServiceProtocol = TodoService()


    func testFetchTodoItems() {
        let completedExpectation = expectation(description: "Completed")

        service.fetchTodoItems { (response) in
            XCTAssertEqual(response?.isEmpty, false)
            completedExpectation.fulfill()
        } onError: { (error) in
            completedExpectation.fulfill()
        }

        wait(for: [completedExpectation], timeout: timeout)
    }

    func testAddTodoItems() {
        let completedExpectation = expectation(description: "Completed")

        service.addTodoItem(item: Todo(subTitle: "vb2", title: "vb3"), index: 1) { (response) in
            XCTAssertEqual(response?.isEmpty, false)
            completedExpectation.fulfill()
        } onError: { (error) in
            completedExpectation.fulfill()
        }

        wait(for: [completedExpectation], timeout: timeout)
    }



}
