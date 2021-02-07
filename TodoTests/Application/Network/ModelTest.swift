//
//  ModelTest.swift
//  GetirTodoTests
//
//  Created by Veli Bacik on 1/14/21.
//

import XCTest
@testable import Todo


class ModelTest: XCTestCase {

    let timeout: TimeInterval = 300.0


    let service: TodoServiceProtocol = TodoService()


    func testModelGenerate() {
        let model = Todo(subTitle: "vb", title: "a")
//
//        do {
//            let jsonData = try JSONEncoder().encode(model)
//            let jsonString = String(data: jsonData, encoding: .utf8)!
//            print(jsonString) // [{"sentence":"Hello world","lang":"en"},{"sentence":"Hallo Welt","lang":"de"}]
//
//            // and decode it back
//            let decodedSentences = try JSONDecoder().decode(Todo.self, from: jsonData)
//
//            print(decodedSentences)
//        } catch { print(error) }

        do {
            let dict = try model.asDictionary()
        
            XCTAssert(dict != nil)
        } catch {
            XCTFail("Status code: 400")

        }
        XCTFail("Status code: 500")
//        wait(for: [completedExpectation], timeout: timeout)
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
