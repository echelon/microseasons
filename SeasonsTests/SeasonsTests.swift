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
        var season = Seasons.getSeasonForDate(date)!
        XCTAssert(season.english == "Wheat sprouts under snow")
        
        // TODO: Dates are slightly off.
        date = Seasons.getDate(10, 13)!
        season = Seasons.getSeasonForDate(date)!
        XCTAssert(season.english == "Wild geese return")
        
        date = Seasons.getDate(12, 31)!
        season = Seasons.getSeasonForDate(date)!
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
