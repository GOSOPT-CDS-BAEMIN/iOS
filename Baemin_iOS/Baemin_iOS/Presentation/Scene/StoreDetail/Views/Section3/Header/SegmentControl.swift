//
//  SegmentControl.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/25.
//

import UIKit

import SnapKit

class SegmentControl: UISegmentedControl {
    // MARK: - UI Componenets

    private lazy var overlineView: UIView = {
        let width = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let height = 2.0
        let xPosition = CGFloat(self.selectedSegmentIndex * Int(width))
        let yPosition = 0.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .black
        self.addSubview(view)
        return view
    }()
    
    private lazy var sidelineFirst: UIView = {
        let height = self.bounds.size.height
        let width = 1.0
        let xPosition = 15.0
        let yPosition = 0.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .gray_1
        self.addSubview(view)
        return view
    }()
    
    private lazy var sidelineSecond: UIView = {
        let height = self.bounds.size.height
        let width = 1.0
        let xPosition = 15.0
        let yPosition = 0.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .gray_1
        self.addSubview(view)
        return view
    }()
    
    private lazy var gray_divider_first: UIView = {
        var width = UIScreen.main.bounds.width / CGFloat(self.numberOfSegments)
        let xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: 1.0)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.gray_4
        self.addSubview(view)
        return view
    }()
    
    private lazy var gray_divider_second: UIView = {
        var width = UIScreen.main.bounds.width / CGFloat(self.numberOfSegments)
        let xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: 1.0)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.gray_4
        self.addSubview(view)
        return view
    }()
    
    // MARK: - Initialize func
    
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
    
    // MARK: - Methods
    
    private func removeBackgroundAndDivider() {
        let empty = UIImage()

        self.setBackgroundImage(empty, for: .normal, barMetrics: .default)
        self.setBackgroundImage(empty, for: .selected, barMetrics: .default)
        self.setBackgroundImage(empty, for: .highlighted, barMetrics: .default)
        
        self.setDividerImage(empty, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let overlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        UIView.animate(
            withDuration: 0.1,
            animations: {
                self.overlineView.frame.origin.x = overlineFinalXPosition
            }
        )
        
        if self.selectedSegmentIndex == 1 {
            
            let sidelineFirstXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.sidelineFirst.frame.origin.x = sidelineFirstXPosition
                }
            )
            
            let sidelineSecondXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex + 1)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.sidelineSecond.frame.origin.x = sidelineSecondXPosition
                }
            )
            
            let gray_dividerFirst = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex-1)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.gray_divider_first.frame.origin.x = gray_dividerFirst
                }
            )
            
            let gray_dividerSecond = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex + 1)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.gray_divider_second.frame.origin.x = gray_dividerSecond
                }
            )
        } else if self.selectedSegmentIndex == 2 {
            let sidelineFirstXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.sidelineFirst.frame.origin.x = sidelineFirstXPosition
                }
            )
            
            let gray_dividerFirst = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex - 2)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.gray_divider_first.frame.origin.x = gray_dividerFirst
                }
            )
            
            let gray_dividerSecond = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex - 1)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.gray_divider_second.frame.origin.x = gray_dividerSecond
                }
            )
        } else {
            let sidelineSecondXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex + 1)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.sidelineSecond.frame.origin.x = sidelineSecondXPosition
                }
            )
            
            let gray_dividerFirst = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex + 1)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.gray_divider_first.frame.origin.x = gray_dividerFirst
                }
            )
            
            let gray_dividerSecond = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex + 2)
            
            UIView.animate(
                withDuration: 0,
                animations: {
                    self.gray_divider_second.frame.origin.x = gray_dividerSecond
                }
            )
        }
        
    }
}
