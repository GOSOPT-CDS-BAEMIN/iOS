//
//  StickyHeaderView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/23.
//

import UIKit

import SnapKit

class StickyHeaderView: UIView {
    
    // MARK: - Properties
    var flag: Int = 0
    
    var selectedIndex: Int = 0 {
        didSet {
            flag = selectedIndex
        }
    }
    
    // MARK: - UI Componenets
    
    // 정보 + 스피커 아이콘
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
                
        let attributedString1 = NSMutableAttributedString(string: I18N.StickyHeader.info)
        
        let imageAttachment1 = NSTextAttachment()
        imageAttachment1.image = UIImage.speaker
        imageAttachment1.bounds = CGRect(x: 0, y: 0, width: 18, height: 18)
        
        attributedString1.append(NSAttributedString(attachment: imageAttachment1))
        
        label.attributedText = attributedString1
        return label
    }()
    
    // 정보 + 스피커 아이콘
    private lazy var menusLabel: UILabel = {
        let info = UILabel()
        info.attributedText = NSMutableAttributedString(string: I18N.StickyHeader.menu)
        info.sizeToFit()
        return info
    }()
    
    // 정보 + 스피커 아이콘
    private lazy var reviewLabel: UILabel = {
        let info = UILabel()
        info.attributedText = NSMutableAttributedString(string: I18N.StickyHeader.review)
        info.sizeToFit()
        return info
    }()
    
    private lazy var segmentControl: SegmentControl = {
        let control = SegmentControl(items: [menusLabel.attributedText ?? "", infoLabel.attributedText ?? "", reviewLabel.attributedText ?? ""])
        control.sizeToFit()
        return control
    }()
    
    // MARK: - Initialize func

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        segmentControl.selectedSegmentIndex = 0
        setStyle()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    func setStyle() {
        backgroundColor = .white
    }
    
    func setLayOut() {
        
        self.segmentControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.gray_5!,
                .font: UIFont.AppleSDGothicNeo(.regular, size: 16.0)
            ],
            for: .normal
        )

        self.segmentControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.AppleSDGothicNeo(.semiBold, size: 16.0)
            ],
            for: .selected
        )
        
        addSubview(segmentControl)
        
        segmentControl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        self.segmentControl.addTarget(self, action: #selector(segmentedTouched), for: .valueChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("categoryIndex"), object: nil)
    }
    
    @objc
    func segmentedTouched(_ sender: Any) {
        
        selectedIndex = segmentControl.selectedSegmentIndex
        NotificationCenter.default.post(name: NSNotification.Name("categoryIndex"), object: flag)
    }
    
    @objc
    func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int
        self.segmentControl.selectedSegmentIndex = tmp
    }
}
