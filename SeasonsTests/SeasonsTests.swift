//
//  SeasonsTests.swift
//  SeasonsTests
//
//  Created by bt on 10/12/17.
//  Copyright © 2017 Brandon Thomas. All rights reserved.
//

import XCTest

class SeasonsTests: XCTestCase {
    
    func testGetSeasonForDate() {
        var date = Seasons.getDate(1, 1)!
        var season = Seasons.getSeasonForDate(date)
        XCTAssert(season.english == "Wheat sprouts under snow")

        date = Seasons.getDate(2, 28)!
        season = Seasons.getSeasonForDate(date)
        NSLog(season.english)
        XCTAssert(season.english == "Mist starts to linger")
        
        // Leap years
        date = Seasons.getDate(2, 29)!
        season = Seasons.getSeasonForDate(date)
        NSLog(season.english)
        XCTAssert(season.english == "Mist starts to linger")
        
        date = Seasons.getDate(5, 8)!
        season = Seasons.getSeasonForDate(date)
        XCTAssert(season.english == "Frogs start singing")
        
        date = Seasons.getDate(10, 13)!
        season = Seasons.getSeasonForDate(date)
        XCTAssert(season.english == "Chrysanthemums bloom")
        
        date = Seasons.getDate(12, 31)!
        season = Seasons.getSeasonForDate(date)
        XCTAssert(season.english == "Deer shed antlers")
    }
    
    func testGetSeason() {
        var season = Seasons.getSeason(0)!
        XCTAssert(season.english == "Wheat sprouts under snow")
        
        season = Seasons.getSeason(50)!
        XCTAssert(season.english == "Wagtails sing")

        season = Seasons.getSeason(71)!
        XCTAssert(season.english == "Deer shed antlers")
        
        XCTAssertNil(Seasons.getSeason(72))
    }
}
