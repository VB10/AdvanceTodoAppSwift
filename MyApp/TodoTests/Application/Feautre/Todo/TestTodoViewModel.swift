//
//  TodoServiceTest.swift
//  GetirTodoTests
//
//  Created by Veli Bacik on 1/13/21.
//

import XCTest
@testable import Todo


class TodoViewModelTest: XCTestCase {

    let timeout: TimeInterval = 300.0

    var viewModel: TodoViewModelMock?

    override func setUp() {
        super.setUp()
        let service: TodoServiceProtocol = TodoServiceMock()
        viewModel = TodoViewModelMock(service: service)
    }

    func testFetchItemsControl() {
        let completedExpectation = expectation(description: "Completed")
        viewModel?.fetchTodoItems()
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel?.todoItems.isEmpty, false)
            completedExpectation.fulfill()
        }

        wait(for: [completedExpectation], timeout: timeout)
    }


    func testLoadingBar() {
        let completedExpectation = expectation(description: "Completed")
        let concurrentQueue = DispatchQueue(label: "hwa", attributes: .concurrent)

        concurrentQueue.async {
            self.viewModel?.fetchTodoItems()
        }

        concurrentQueue.async {
            XCTAssert(self.viewModel?.isLoading ?? false)
            completedExpectation.fulfill()
        }

        wait(for: [completedExpectation], timeout: timeout)
    }

}
