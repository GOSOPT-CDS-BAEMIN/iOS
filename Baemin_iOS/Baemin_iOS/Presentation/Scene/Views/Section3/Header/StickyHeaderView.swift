//
//  StickyHeaderView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/23.
//

import UIKit

import SnapKit

class StickyHeaderView: UIView {
    
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
    
    // 0. init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayOut()
        
        segmentControl.addTarget(self, action: #selector(segmentedTouched), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        segmentControl.selectedSegmentIndex = 0
        
        segmentControl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
    @objc
    func segmentedTouched(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("categoryIndex"), object: segmentControl.selectedSegmentIndex)
    }
}
