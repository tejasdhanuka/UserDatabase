//
//  ConstantsTests.swift
//  UserDatabaseTests
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/28.
//

import XCTest
@testable import UserDatabase

class ConstantsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCellReuseIdentifiers() {
        XCTAssertEqual(Constants.userDatabaseURLString, "https://jsonplaceholder.typicode.com/users")
        XCTAssertEqual(Constants.userListCellReuseIdentifier, "UserListCell")
        XCTAssertEqual(Constants.userDetailCellReuseIdentifier, "UserDetailCell")
    }
}
