//
//  MainTabbarCell.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/23.
//

import UIKit

import SnapKit

class MainTabbarCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    var tabBarLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            updateSelectionAppearance()
        }
    }
    
    // MARK: - Initialization
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setStyle()
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
        tabBarLabel.text = nil
        tabBarLabel.textColor = .gray
        underLineView.isHidden = true
    }
    
    private func setLayout() {
        contentView.addSubviews(tabBarLabel, underLineView)
        
        tabBarLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(8)
            $0.height.equalTo(3)
        }
    }
    
    private func updateSelectionAppearance() {
        underLineView.isHidden = !isSelected
        if isSelected {
                tabBarLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                tabBarLabel.textColor = .black
            } else {
                tabBarLabel.font = UIFont.systemFont(ofSize: 16)
                tabBarLabel.textColor = .gray
            }
    }
    
    func bind(_ item: TabBarItem) {
        tabBarLabel.text = item.name
    }
}
