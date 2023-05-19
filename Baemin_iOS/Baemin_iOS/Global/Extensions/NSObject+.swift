//
//  NSObject+.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
