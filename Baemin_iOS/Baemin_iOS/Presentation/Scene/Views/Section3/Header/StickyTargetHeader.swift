//
//  StickyHeaderView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/23.
//

import UIKit

import SnapKit

class StickyTargetHeader: UITableViewHeaderFooterView {
    
    // 세그먼트 탭마다 나타날 VC
    private let menuView = MenuVC()
    private let infoView = InfoVC()
    private let commentView = ReviewVC()
    
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
    
    // init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayOut()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        contentView.backgroundColor = .clear
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
        
        contentView.addSubviews(segmentControl, menuView.view, infoView.view, commentView.view)
        
        segmentControl.selectedSegmentIndex = 0
        
        segmentControl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
//    @objc func indexChanged(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            menuView.view.isHidden = false
//            infoView.view.isHidden = true
//            commentView.view.isHidden = true
//        case 1:
//            menuView.view.isHidden = true
//            infoView.view.isHidden = false
//            commentView.view.isHidden = true
//        case 2:
//            menuView.view.isHidden = true
//            infoView.view.isHidden = true
//            commentView.view.isHidden = false
//        }
//    }
}

//menuView.view.snp.makeConstraints {
//    $0.edges.equalToSuperview()
//}
//
//infoView.view.snp.makeConstraints {
//    $0.edges.equalToSuperview()
//}
//
//commentView.view.snp.makeConstraints {
//    $0.edges.equalToSuperview()
//}
//
//menuView.view.isHidden = false
//infoView.view.isHidden = true
//commentView.view.isHidden = true
