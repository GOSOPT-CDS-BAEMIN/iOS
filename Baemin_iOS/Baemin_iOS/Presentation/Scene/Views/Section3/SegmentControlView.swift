//
//  SegmentControlView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/25.
//

import UIKit
import SnapKit

class SegmentControlView: UISegmentedControl {
    
    
    
    
    
    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.removeBackgroundAndDivider()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        self.removeBackgroundAndDivider()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.removeBackgroundAndDivider()
    }
    
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
      }
    
    
}
