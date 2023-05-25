//
//  MainOptionView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import UIKit

import SnapKit

class MainOptionView: UIView {
    
    // MARK: - Properties
    
    private let item: [OptionItem] = OptionItem.item
    
    // MARK: - UI Components
    
    private lazy var baseButton: UIButton = {
        let button = UIButton()
        button.configuration?.baseForegroundColor = .black
        button.backgroundColor = .white
        let attributedTitle = NSAttributedString(string: "기본순",
                                                 attributes: [.font: UIFont.AppleSDGothicNeo(.bold, size: 13)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setImage(.arrow_up_down, for: .normal)
        button.makeCornerRound(radius: 15)
        button.makeBorder(width: 1, color: .gray_4!)
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 98, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setLayout()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension MainOptionView {
    private func register() {
        collectionView.register(cell: MainOptionCell.self)
    }
    
    private func setStyle() {
        backgroundColor = .clear
    }
    private func setLayout() {
        addSubviews(collectionView, baseButton)
        
        baseButton.snp.makeConstraints {
            $0.directionalVerticalEdges.leading.equalToSuperview()
            $0.width.equalTo(90)
        }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - CollectionViewDelegate, CollectionViewDataSource

extension MainOptionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainOptionCell = collectionView.dequeueReusableCell(for: indexPath)
        let item = item[indexPath.row]
        cell.bind(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as? MainOptionCell
        guard let cell = selectedCell else { return }
        let item = self.item[indexPath.row]
        cell.isTapped.toggle()
        cell.updateUI(item)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension MainOptionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat
        let cell: MainOptionCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.optionLabel.text = item[indexPath.row].option
        cell.optionLabel.sizeToFit()
        switch indexPath.item {
        case 4:
            cellWidth = cell.optionLabel.frame.width + 46
        default:
            cellWidth = cell.optionLabel.frame.width + 44
        }
        return CGSize(width: cellWidth, height: 32)
    }
}
