//
//  Seasons.swift
//  Japanese Microseasons
//
//  Created by bt on 10/12/17.
//  Copyright © 2017 Brandon Thomas. All rights reserved.
//
//  The 72 ancient Japanese microseasons.
//  From http://www.nippon.com/en/features/h00124/
//

import Foundation

public class Seasons {
    
    public struct Season {
        let english: String
        let japanese: String
        let romaji: String
        let monthIndex: Int
        let dayIndex: Int
        
        // Both monthStart and dayStart are 1-indexed for human readability.
        init(_ japanese: String, _ romaji: String, _ english: String, _ monthStart: Int, _ dayStart: Int) {
            self.japanese = japanese
            self.romaji = romaji
            self.english = english
            self.monthIndex = monthStart
            self.dayIndex = dayStart
        }
    }
    
    // TODO: Missing the 24 divisions
    public static let SEASONS = [
        Season("雪下出麦", "Yuki watarite mugi nobiru", "Wheat sprouts under snow", 1, 1), // January 1 - 4
        Season("芹乃栄", "Seri sunawachi sakau", "Parsley flourishes", 1, 5), // January 5 - 9
        Season("水泉動", "Shimizu atataka o fukumu", "Springs thaw", 1, 10), // January 10 - 14
        Season("雉始雊", "Kiji hajimete naku", "Pheasants start to call", 1, 15), // January 15 - 19
        Season("款冬華", "Fuki no hana saku", "Butterburs bud", 1, 20), // January 20 - 24
        Season("水沢腹堅", "Kiwamizu kōri tsumeru", "Ice thickens on streams", 1, 25), // January 25 - 29
        Season("鶏始乳", "Niwatori hajimete toya ni tsuku", "Hens start laying eggs", 1, 30), // January 30 - February 3
        Season("東風解凍", "Harukaze kōri o toku", "East wind melts the ice", 2, 4), // February 4 - 8
        Season("黄鶯睍睆", "Kōō kenkan su", "Bush warblers start singing in the mountains", 2, 9), // February 9 - 13
        Season("魚上氷", "Uo kōri o izuru", "Fish emerge from the ice", 2, 14), // February 14 - 18
        Season("土脉潤起", "Tsuchi no shō uruoi okoru", "Rain moistens the soil", 2, 19), // February 19 - 23
        Season("霞始靆", "Kasumi hajimete tanabiku", "Mist starts to linger", 2, 24), // February 24 - 28 (**NB: Skips leap year)
        Season("草木萌動", "Sōmoku mebae izuru", "Grass sprouts, trees bud", 3, 1), // March 1 - 5
        Season("蟄虫啓戸", "Sugomori mushito o hiraku", "Hibernating insects surface", 3, 6), // March 6 - 10
        Season("桃始笑", "Momo hajimete saku", "First peach blossoms", 3, 11), // March 11 - 15
        Season("菜虫化蝶", "Namushi chō to naru", "Caterpillars become butterflies", 3, 16), // March 16 - 20
        Season("雀始巣", "Suzume hajimete sukū", "Sparrows start to nest", 3, 21), // March 21 - 25
        Season("櫻始開", "Sakura hajimete saku", "First cherry blossoms", 3, 26), // March 26 - 30
        Season("雷乃発声", "Kaminari sunawachi koe o hassu", "Distant thunder", 3, 31), // March 31 - April 4
        Season("玄鳥至", "Tsubame kitaru", "Swallows return", 4, 5), // April 5 - 9
        Season("鴻雁北", "Kōgan kaeru", "Wild geese fly north", 4, 10), // April 10 - 14
        Season("虹始見", "Niji hajimete arawaru", "First rainbows",4 , 15), // April 15 - 19
        Season("葭始生", "Ashi hajimete shōzu", "First reeds sprout", 4, 20), // April 20 - 24
        Season("霜止出苗", "Shimo yamite nae izuru", "Last frost, rice seedlings grow", 4, 25), // April 25 - 29
        Season("牡丹華", "Botan hana saku", "Peonies bloom", 4, 30), // April 30 - May 4
        Season("蛙始鳴", "Kawazu hajimete naku", "Frogs start singing", 5, 5), // May 5 - 9
        Season("蚯蚓出", "Mimizu izuru", "Worms surface", 5, 10), // May 10 - 14
        Season("竹笋生", "Takenoko shōzu", "Bamboo shoots sprout", 5, 15), // May 15 - 20
        Season("蚕起食桑", "Kaiko okite kuwa o hamu", "Silkworms start feasting on mulberry leaves", 5, 21), // May 21 - 25
        Season("紅花栄", "Benibana sakau", "Safflowers bloom", 5, 26), // May 26 - 30
        Season("麦秋至", "Mugi no toki itaru", "Wheat ripens and is harvested", 5, 31), // May 31 - June 5
        Season("蟷螂生", "Kamakiri shōzu", "Praying mantises hatch", 6, 6), // June 6 - 10
        Season("腐草為螢", "Kusaretaru kusa hotaru to naru", "Rotten grass becomes fireflies", 6, 11), // June 11 - 15
        Season("梅子黄", "Ume no mi kibamu", "Plums turn yellow", 6, 16), // June 16 - 20
        Season("乃東枯", "Natsukarekusa karuru", "Self-heal withers", 6, 21), // June 21 - 26
        Season("菖蒲華", "Ayame hana saku", "Irises bloom", 6, 27), // June 27 - July 1
        Season("半夏生", "Hange shōzu", "Crow-dipper sprouts", 7, 2), // July 2 - 6
        Season("温風至", "Atsukaze itaru", "Warm winds blow", 7, 7), // July 7 - 11
        Season("蓮始開", "Hasu hajimete hiraku", "First lotus blossoms", 7, 12), // July 12 - 16
        Season("鷹乃学習", "Taka sunawachi waza o narau", "Hawks learn to fly", 7, 17), // July 17 - 22
        Season("桐始結花", "Kiri hajimete hana o musubu", "Paulownia trees produce seeds", 7, 23), // July 23 - 28
        Season("土潤溽暑", "Tsuchi uruōte mushi atsushi", "Earth is damp, air is humid", 7, 29), // July 29 - August 2
        Season("大雨時行", "Taiu tokidoki furu", "Great rains sometimes fall", 8, 3), // August 3 - 7
        Season("涼風至", "Suzukaze itaru", "Cool winds blow", 8, 8), // August 8 - 12
        Season("寒蝉鳴", "Higurashi naku", "Evening cicadas sing", 8, 13), // August 13 - 17
        Season("蒙霧升降", "Fukaki kiri matō", "Thick fog descends", 8, 18), // August 18 - 22
        Season("綿柎開", "Wata no hana shibe hiraku", "Cotton flowers bloom", 8, 23), // August 23 - 27
        Season("天地始粛", "Tenchi hajimete samushi", "Heat starts to die down", 8, 28), // August 28 - September 1
        Season("禾乃登", "Kokumono sunawachi minoru", "Rice ripens", 9, 2), // September 2 - 7
        Season("草露白", "Kusa no tsuyu shiroshi", "Dew glistens white on grass", 9, 8), // September 8 - 12
        Season("鶺鴒鳴", "Sekirei naku", "Wagtails sing", 9, 13), // September 13 - 17
        Season("玄鳥去", "Tsubame saru", "Swallows leave", 9, 18), // September 18 - 22
        Season("雷乃収声", "Kaminari sunawachi koe o osamu", "Thunder ceases", 9, 23), // September 23 - 27
        Season("蟄虫坏戸", "Mushi kakurete to o fusagu", "Insects hole up underground", 9, 28), // September 28 - October 2
        Season("水始涸", "Mizu hajimete karuru", "Farmers drain fields", 10, 3), // October 3 - 7
        Season("鴻雁来", "Kōgan kitaru", "Wild geese return", 10, 8), // October 8 - 12
        Season("菊花開", "Kiku no hana hiraku", "Chrysanthemums bloom", 10, 13), // October 13 - 17
        Season("蟋蟀在戸", "Kirigirisu to ni ari", "Crickets chirp around the door", 10, 18), // October 18 - 22
        Season("霜始降", "Shimo hajimete furu", "First frost", 10, 23), // October 23 - 27
        Season("霎時施", "Kosame tokidoki furu", "Light rains sometimes fall", 10, 28), // October 28 - November 1
        Season("楓蔦黄", "Momiji tsuta kibamu", "Maple leaves and ivy turn yellow", 11, 2), // November 2 - 6
        Season("山茶始開", "Tsubaki hajimete hiraku", "Camellias bloom", 11, 7), // November 7 - 11
        Season("地始凍", "Chi hajimete kōru", "Land starts to freeze", 11, 12), // November 12 - 16
        Season("金盞香", "Kinsenka saku", "Daffodils bloom", 11, 17), // November 17 - 21
        Season("虹蔵不見", "Niji kakurete miezu", "Rainbows hide", 11, 22), // November 22 - 26
        Season("朔風払葉", "Kitakaze konoha o harau", "North wind blows the leaves from the trees", 11, 27), // November 27 - December 1
        Season("橘始黄", "Tachibana hajimete kibamu", "Tachibana citrus tree leaves start to turn yellow", 12, 2), // December 2 - 6
        Season("閉塞成冬", "Sora samuku fuyu to naru", "Cold sets in, winter begins", 12, 7), // December 7 - 11
        Season("熊蟄穴", "Kuma ana ni komoru", "Bears start hibernating in their dens", 12, 12), // December 12 - 16
        Season("鱖魚群", "Sake no uo muragaru", "Salmons gather and swim upstream", 12, 17), // December 17 - 21
        Season("乃東生", "Natsukarekusa shōzu", "Self-heal sprouts", 12, 22), // December 22 - 26
        Season("麋角解", "Sawashika no tsuno otsuru", "Deer shed antlers", 12, 27), // December 27 - 31
    ]
    
    public static func getDate(_ month: Int, _ day: Int) -> Date? {
        var components = DateComponents()
        components.year = 2004 // NB: Must be a leap year. Any leap year will do.
        components.month = month
        components.day = day
        let calendar = Calendar.current
        return calendar.date(from: components)
    }
    
    public static func getSeason(_ index: Int) -> Season? {
        if (index < 0 || index >= SEASONS.count) {
            return nil
        }
        return SEASONS[index]
    }
    
    public static func getSeasonForDate(_ date: Date) -> Season {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        var lastSeason = SEASONS[0]
        
        // TODO: Make more efficient with binary search or hashing
        for i in 0 ... SEASONS.count - 1 {
            let season = SEASONS[i]
            if (season.monthIndex > month) {
                break
            } else if (season.monthIndex == month && season.dayIndex > day) {
                break
            }
            lastSeason = season
        }
        
        return lastSeason
    }
    
    public static func getCurrentSeason() -> Season {
        let date = Date()
        return getSeasonForDate(date)
    }
}
