//
//  File.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/23.
//

import Foundation

struct TabBarItem {
    var name: String
    
   static func tabBar() -> [TabBarItem] {
       var items: [TabBarItem] =
        [TabBarItem(name: "전체"),
                TabBarItem(name: "족발∙보쌈"),
                TabBarItem(name: "찜∙탕∙찌개"),
                TabBarItem(name: "돈까스∙회∙일식"),
                TabBarItem(name: "고기∙구이"),
                TabBarItem(name: "피자"),
                TabBarItem(name: "찜∙탕∙찌개"),
                TabBarItem(name: "양식"),
                TabBarItem(name: "중식"),
                TabBarItem(name: "아시안"),
                TabBarItem(name: "치킨"),
                TabBarItem(name: "백반∙죽∙국수"),
                TabBarItem(name: "버거"),
                TabBarItem(name: "분식"),
                TabBarItem(name: "카페∙디저트")
        ]
       return items
    }
}
