//
//  StickyHeaderView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/23.
//

import UIKit

import SnapKit

class StickyHeaderView: UITableViewHeaderFooterView {
    
    private let menuLabel: UILabel = {
        let label = UILabe()
        label.text = I18N.StickyHeader.menu
        label.font = .AppleSDGothicNeo(.semiBold, size: 16)
        label.sizeToFit()
        return label
    }()
    
    private let infoLabel: UILable = {
        let label = UILabe()
        label.text = I18N.StickyHeader.info
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.textColor = .gray_5
        label.sizeToFit()
        return label
    }()
    
    private let speaker: UIImageView = {
        let icon = UIImageView()
        icon.image = .speaker.resized(toWidth: 18)
        icon.sizeToFit()
        icon.contentMode = .scaleAspectFit
        
        return icon
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.sizeToFit()
        return stackView
    }()
    
    private let review: UILable = {
        let label = UILabe()
        label.text = I18N.StickyHeader.review
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.textColor = .gray_5
        label.sizeToFit()
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let control = SegmentControl(items: ["메뉴", "정보", "리뷰"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.sizeToFit()
        return control
    }
    
    // init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStyle()
        setInfoStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInfoStack() {
        stackView.addArrangedSubviews(infoLabel, speaker)
    }
    
    func setStyle() {
        contentView.backgroundColor = .clear
    }
    
    func setSegment() {
        self.segmentControl.setTitleAttributes(
            [
        )
    }
    
}
