//
//  UserDatabaseViewModelTests.swift
//  UserDatabaseTests
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/28.
//

import XCTest
@testable import UserDatabase

class UserDatabaseViewModelTests: XCTestCase {
    
    var sut: UserDatabaseAPIClient!
    var sut2: UserDatabaseViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testfetchUserDatabaseList() {
        sut = UserDatabaseAPIClient()
        sut2 = UserDatabaseViewModel()
        
        var userDatabaseList: [UserDatabase]? = nil
        
        sut.fetchUserDatabaseList(completion: { result in
            switch result {
            case let .success(response):
                userDatabaseList = response.userList
                self.sut2.userDatabaseList = response.userList
                
                // tests to check that response should not be nil
                XCTAssertNotNil(response.userList, "The list should not be empty on success response as none is optional property.")
                XCTAssertNotNil(userDatabaseList, "The list should not be empty on success response as none is optional property.")
                
                // tests to check that response should be correct
                XCTAssertEqual(response.userList[0].id, 1)
                XCTAssertEqual(response.userList[0].name, "Leanne Graham")
                XCTAssertEqual(response.userList[0].username, "Bret")
                XCTAssertEqual(response.userList[0].email, "Sincere@april.biz")
                XCTAssertEqual(response.userList[0].address.street, "Kulas Light")
                XCTAssertEqual(response.userList[0].address.suite, "Apt. 556")
                XCTAssertEqual(response.userList[0].address.city, "Gwenborough")
                XCTAssertEqual(response.userList[0].address.zipcode, "92998-3874")
                XCTAssertEqual(response.userList[0].address.geo.lat, "-37.3159")
                XCTAssertEqual(response.userList[0].address.geo.lng, "81.1496")
                XCTAssertEqual(response.userList[0].phone, "1-770-736-8031 x56442")
                XCTAssertEqual(response.userList[0].website, "hildegard.org")
                XCTAssertEqual(response.userList[0].company.name, "Romaguera-Crona")
                XCTAssertEqual(response.userList[0].company.catchPhrase, "Multi-layered client-server neural-net")
                XCTAssertEqual(response.userList[0].company.bs, "harness real-time e-markets")
                
                // tests to check that correct datasources are formed
                XCTAssertEqual(self.sut2.numberOfSections(), 1)
                XCTAssertEqual(self.sut2.numberOfRows(in: 0), 10)

            case let .failure(error):
                XCTAssertNil(userDatabaseList, "The list should not be empty on success response as none is optional property.")
                XCTAssertNotNil(error, "Error should provide a valid error object")
            }
        })
    }
}
