//
//  VideoBackground_10Tests.swift
//  VideoBackground_10Tests
//
//  Created by 宋澎 on 2018/6/12.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import XCTest
@testable import VideoBackground_10

class VideoBackground_10Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        ViewController().test()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
