//
//  SeasonsTests.swift
//  SeasonsTests
//
//  Created by bt on 10/12/17.
//  Copyright © 2017 Brandon Thomas. All rights reserved.
//

import XCTest

class SeasonsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Setup code here.
    }
    
    override func tearDown() {
        // Teardown code here.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var date = Seasons.getDate(1, 1)!
        
        var season = Seasons.getSeasonForDate(date)!
        
        NSLog("Season: " + season.english)
        
        
        XCTAssert(season.english == "Wheat sprouts under snow")
        
        date = Seasons.getDate(12, 31)!
        season = Seasons.getSeasonForDate(date)!
        
        NSLog("Season: " + season.english)
        
        XCTAssert(season.english == "Deer shed antlers")
    }
    
    func testGetSeason() {
        var season = Seasons.getSeason(0)!
        XCTAssert(season.english == "Wheat sprouts under snow")
        
        season = Seasons.getSeason(50)!
        XCTAssert(season.english == "Wagtails sing")

        season = Seasons.getSeason(71)!
        XCTAssert(season.english == "Deer shed antlers")
    }
    
}
