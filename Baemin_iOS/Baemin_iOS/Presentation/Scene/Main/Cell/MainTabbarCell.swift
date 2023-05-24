//
//  MainTabbarCell.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/23.
//

import UIKit

import SnapKit

class MainTabbarCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            underLineView.backgroundColor = isSelected ? .black : .clear
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                self.underLineView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            underLineView.backgroundColor = isSelected ? .black : .clear
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                self.underLineView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    var tabBarLabel: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.textColor = .gray_5
        label.sizeToFit()
        return label
    }()
    
    private var underLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        tabBarLabel.text = ""
        underLineView.backgroundColor = .clear
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension MainTabbarCell {
    
    private func setStyle() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubviews(tabBarLabel, underLineView)
        
        tabBarLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints {
            $0.directionalHorizontalEdges.bottom.equalToSuperview().inset(2)
            $0.height.equalTo(2)
        }
    }
    
    func dataBind(item: TabBarItem) {
        tabBarLabel.text = item.name
    }
}
