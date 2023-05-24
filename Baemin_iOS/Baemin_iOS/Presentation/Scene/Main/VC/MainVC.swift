//
//  MainVC.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/23.
//

import UIKit

import SnapKit

class MainVC: UIViewController {
    
    // MARK: - Properties
    
    var tabBarItems: [TabBarItem] = TabBarItem.tabBar()
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var tabBarcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarcollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        register()

    }
}

// MARK: - Methods

extension MainVC {
    private func register() {
        tabBarcollectionView.register(cell: MainTabbarCell.self)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(tabBarcollectionView)
        
        tabBarcollectionView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(52)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(44)
        }
    }
}

// MARK: - Delegate, DataSource

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabBarItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainTabbarCell = collectionView.dequeueReusableCell(for: indexPath)
        let item = tabBarItems[indexPath.row]
        cell.dataBind(item: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let cell: MainTabbarCell = collectionView.dequeueReusableCell(for: indexPath)
               cell.tabBarLabel.text = tabBarItems[indexPath.row].name
               cell.tabBarLabel.sizeToFit()
               let cellWidth = cell.tabBarLabel.frame.width
               return CGSize(width: cellWidth, height: 40)
            }
}
