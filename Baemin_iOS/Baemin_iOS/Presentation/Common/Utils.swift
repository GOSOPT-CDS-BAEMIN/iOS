//
//  Utils.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/27.
//

import Foundation

final class Utils {
    class func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: price))!
    }
}
