//
//  AlbumListTests.swift
//  AlbumListTests
//
//  Created by Ryan Ofori on 8/12/22.
//

import XCTest
@testable import AlbumList
class AlbumListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoginSuccess() throws {
            let result = JSONParser.parse("AllAlbums", model: AllAlbum.self)
            switch result {
            case .success(let model):
                XCTAssert(model.feed.results[0].artistName == "Rod Wave", "found: \(model.feed.results[0].artistName)")
                XCTAssert(model.feed.results[0].name == "Beautiful Mind", "found: \(model.feed.results[0].name)")
            case .failure(let error):
                XCTFail("Error type: \(error)")
            }
        }
}
