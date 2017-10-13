//
//  Seasons.swift
//  Microseasons
//
//  Created by bt on 10/12/17.
//  Copyright © 2017 Brandon Thomas. All rights reserved.
//

import Foundation

public class Seasons {
    
    public struct Season {
        let english: String
        let japanese: String
        let romaji: String
        
        init(_ japanese: String, _ romaji: String, _ english: String) {
            self.japanese = japanese
            self.romaji = romaji
            self.english = english
        }
    }
    
    public static let SEASONS = [
        Season("雪下出麦", "Yuki watarite mugi nobiru", "Wheat sprouts under snow"), // January 1 - 4
        Season("芹乃栄", "Seri sunawachi sakau", "Parsley flourishes"), // January 5 - 9
        Season("水泉動", "Springs thaw", "Shimizu atataka o fukumu"), // January 10 - 14
        Season("雉始雊", "Kiji hajimete naku", "Pheasants start to call"), // January 15 - 19
        Season("款冬華", "Fuki no hana saku", "Butterburs bud"), // January 20 - 24
        Season("水沢腹堅", "Kiwamizu kōri tsumeru", "Ice thickens on streams"), // January 25 - 29
        Season("鶏始乳", "Niwatori hajimete toya ni tsuku	", "Hens start laying eggs"), // January 30 - February 3
        Season("", "", ""), // January
        Season("", "", ""), // January
        Season("", "", ""), // January
        Season("", "", ""), // January
        Season("", "", ""), // January
        Season("", "", ""), // January
    ]
    
    
}
