//
//  Seasons.swift
//  Microseasons
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
        
        init(_ japanese: String, _ romaji: String, _ english: String) {
            self.japanese = japanese
            self.romaji = romaji
            self.english = english
        }
    }
    
    // TODO: Missing the 24 divisions
    public static let SEASONS = [
        Season("雪下出麦", "Yuki watarite mugi nobiru", "Wheat sprouts under snow"), // January 1 - 4
        Season("芹乃栄", "Seri sunawachi sakau", "Parsley flourishes"), // January 5 - 9
        Season("水泉動", "Springs thaw", "Shimizu atataka o fukumu"), // January 10 - 14
        Season("雉始雊", "Kiji hajimete naku", "Pheasants start to call"), // January 15 - 19
        Season("款冬華", "Fuki no hana saku", "Butterburs bud"), // January 20 - 24
        Season("水沢腹堅", "Kiwamizu kōri tsumeru", "Ice thickens on streams"), // January 25 - 29
        Season("鶏始乳", "Niwatori hajimete toya ni tsuku", "Hens start laying eggs"), // January 30 - February 3
        Season("東風解凍", "Harukaze kōri o toku", "East wind melts the ice"), // February 4 - 8
        Season("黄鶯睍睆", "Kōō kenkan su", "Bush warblers start singing in the mountains"), // February 9 - 13
        Season("魚上氷", "Uo kōri o izuru", "Fish emerge from the ice"), // February 14 - 18
        Season("土脉潤起", "Tsuchi no shō uruoi okoru", "Rain moistens the soil"), // February 19 - 23
        Season("霞始靆", "Kasumi hajimete tanabiku", "Mist starts to linger"), // February 24 - 28 (**NB: Skips leap year)
        Season("草木萌動", "Sōmoku mebae izuru", "Grass sprouts, trees bud"), // March 1 - 5
        Season("蟄虫啓戸", "Sugomori mushito o hiraku", "Hibernating insects surface"), // March 6 - 10
        Season("桃始笑", "Momo hajimete saku", "First peach blossoms"), // March 11 - 15
        Season("菜虫化蝶", "Namushi chō to naru", "Caterpillars become butterflies"), // March 16 - 20
        Season("雀始巣", "Suzume hajimete sukū", "Sparrows start to nest"), // March 21 - 25
        Season("櫻始開", "Sakura hajimete saku", "First cherry blossoms"), // March 26 - 30
        Season("雷乃発声", "Kaminari sunawachi koe o hassu", "Distant thunder"), // March 31 - April 4
        Season("玄鳥至", "Tsubame kitaru", "Swallows return"), // April 5 - 9
        Season("鴻雁北", "Kōgan kaeru", "Wild geese fly north"), // April 10 - 14
        Season("虹始見", "Niji hajimete arawaru", "First rainbows"), // April 15 - 19
        Season("葭始生", "Ashi hajimete shōzu", "First reeds sprout"), // April 20 - 24
        Season("霜止出苗", "Shimo yamite nae izuru", "Last frost, rice seedlings grow"), // April 25 - 29
        Season("牡丹華", "Botan hana saku", "Peonies bloom"), // April 30 - May 4
        Season("蛙始鳴", "Kawazu hajimete naku", "Frogs start singing"), // May 5 - 9
        Season("蚯蚓出", "Mimizu izuru", "Worms surface"), // May 10 - 14
        Season("竹笋生", "Takenoko shōzu", "Bamboo shoots sprout"), // May 15 - 20
        Season("蚕起食桑", "Kaiko okite kuwa o hamu", "Silkworms start feasting on mulberry leaves"), // May 21 - 25
        Season("紅花栄", "Benibana sakau", "Safflowers bloom"), // May 26 - 30
        Season("麦秋至", "Mugi no toki itaru", "Wheat ripens and is harvested"), // May 31 - June 5
        Season("蟷螂生", "Kamakiri shōzu", "Praying mantises hatch"), // June 6 - 10
        Season("腐草為螢", "Kusaretaru kusa hotaru to naru", "Rotten grass becomes fireflies"), // June 11 - 15
        Season("梅子黄", "Ume no mi kibamu", "Plums turn yellow"), // June 16 - 20
        Season("乃東枯", "Natsukarekusa karuru", "Self-heal withers"), // June 21 - 26
        Season("菖蒲華", "Ayame hana saku", "Irises bloom"), // June 27 - July 1
        Season("半夏生", "Hange shōzu", "Crow-dipper sprouts"), // July 2 - 6
        Season("温風至", "Atsukaze itaru", "Warm winds blow"), // July 7 - 11
        Season("蓮始開", "Hasu hajimete hiraku", "First lotus blossoms"), // July 12 - 16
        Season("鷹乃学習", "Taka sunawachi waza o narau", "Hawks learn to fly"), // July 17 - 22
        Season("桐始結花", "Kiri hajimete hana o musubu", "Paulownia trees produce seeds"), // July 23 - 28
        Season("土潤溽暑", "Tsuchi uruōte mushi atsushi", "Earth is damp, air is humid"), // July 29 - August 2
        Season("大雨時行", "Taiu tokidoki furu", "Great rains sometimes fall"), // August 3 - 7
        Season("涼風至", "Suzukaze itaru", "Cool winds blow"), // August 8 - 12
        Season("寒蝉鳴", "Higurashi naku", "Evening cicadas sing"), // August 13 - 17
        Season("蒙霧升降", "Fukaki kiri matō", "Thick fog descends"), // August 18 - 22
        Season("綿柎開", "Wata no hana shibe hiraku", "Cotton flowers bloom"), // August 23 - 27
        Season("天地始粛", "Tenchi hajimete samushi", "Heat starts to die down"), // August 28 - September 1
        Season("禾乃登", "Kokumono sunawachi minoru", "Rice ripens"), // September 2 - 7
        Season("草露白", "Kusa no tsuyu shiroshi", "Dew glistens white on grass"), // September 8 - 12
        Season("鶺鴒鳴", "Sekirei naku", "Wagtails sing"), // September 13 - 17
        Season("玄鳥去", "Tsubame saru", "Swallows leave"), // September 18 - 22
        Season("雷乃収声", "Kaminari sunawachi koe o osamu", "Thunder ceases"), // September 23 - 27
        Season("蟄虫坏戸", "Mushi kakurete to o fusagu", "Insects hole up underground"), // September 28 - October 2
        Season("水始涸", "Mizu hajimete karuru", "Farmers drain fields"), // October 3 - 7
        Season("鴻雁来", "Kōgan kitaru", "Wild geese return"), // October 8 - 12
        Season("菊花開", "Kiku no hana hiraku", "Chrysanthemums bloom"), // October 13 - 17
        Season("蟋蟀在戸", "Kirigirisu to ni ari", "Crickets chirp around the door"), // October 18 - 22
        Season("霜始降", "Shimo hajimete furu", "First frost"), // October 23 - 27
        Season("霎時施", "Kosame tokidoki furu", "Light rains sometimes fall"), // October 28 - November 1
        Season("楓蔦黄", "Momiji tsuta kibamu", "Maple leaves and ivy turn yellow"), // November 2 - 6
        Season("山茶始開", "Tsubaki hajimete hiraku", "Camellias bloom"), // November 7 - 11
        Season("地始凍", "Chi hajimete kōru", "Land starts to freeze"), // November 12 - 16
        Season("金盞香", "Kinsenka saku", "Daffodils bloom"), // November 17 - 21
        Season("虹蔵不見", "Niji kakurete miezu", "Rainbows hide"), // November 22 - 26
        Season("朔風払葉", "Kitakaze konoha o harau", "North wind blows the leaves from the trees"), // November 27 - December 1
        Season("橘始黄", "Tachibana hajimete kibamu", "Tachibana citrus tree leaves start to turn yellow"), // December 2 - 6
        Season("閉塞成冬", "Sora samuku fuyu to naru", "Cold sets in, winter begins"), // December 7 - 11
        Season("熊蟄穴", "Kuma ana ni komoru", "Bears start hibernating in their dens"), // December 12 - 16
        Season("鱖魚群", "Sake no uo muragaru", "Salmons gather and swim upstream"), // December 17 - 21
        Season("乃東生", "Natsukarekusa shōzu", "Self-heal sprouts"), // December 22 - 26
        Season("麋角解", "Sawashika no tsuno otsuru", "Deer shed antlers"), // December 27 - 31
    ]
    
    public static func getDate(_ month: Int, _ day: Int) -> Date? {
        var components = DateComponents()
        //components.year = 2004 // NB: Any leap year will do
        components.month = month
        components.day = day
        //components.hour = 0
        //components.minute = 0
        //components.second = 0
        
        let calendar = Calendar.current
        return calendar.date(from: components)
    }
    
    public static func getSeason(_ index: Int) -> Season? {
        if (index < 0 || index >= SEASONS.count) {
            return nil
        }
        return SEASONS[index]
    }
    
    public static func getSeasonForDate(_ date: Date) -> Season? {
        let calendar = Calendar.current
        guard let day = calendar.ordinality(of: .day, in: .year, for: date) else {
            return nil
        }
        
        let percent = Float(day) / 365.0
        let index = Int(percent * Float(SEASONS.count))
        
        return SEASONS[index % SEASONS.count]
    }
}
