//
//  PageCell.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class MainPageCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var items: [MainData] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var indexClosure: ((_ index: Int) -> Void)?

    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 18
        let collectionViw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViw.showsVerticalScrollIndicator = false
        collectionViw.delegate = self
        collectionViw.dataSource = self
        return collectionViw
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setLayout()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Methods

extension MainPageCell {
    
    private func setStyle() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubview(collectionView)
        collectionView.register(cell: MainFirstPageCell.self)
        
        collectionView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(14)
            $0.directionalVerticalEdges.equalToSuperview()
        }
    }
}
extension MainPageCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainFirstPageCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.bind(items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexClosure?(items[indexPath.item].storeID)

    }
}
extension MainPageCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 270)
    }
}
