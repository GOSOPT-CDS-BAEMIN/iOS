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
  //  var oneService: [MainData] = []
    var item: [MainData] = []
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    
    private let naviView = CustomNavigaionView(type1: .main(.leftButton), type2: .main(.rightButton))
    private let lineView = UIView()
    private let optionView = MainOptionView()
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var tabBarcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 18, bottom: 0, right: 18)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var pageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBarCollectioView()
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
    
    func reloadData() {
        for item in self.item {
            let minumPrice = item.storeType
            if minumPrice == "1인분" {
                requstMainAPI(index: 1)
            }
        }
    }
    
    func setupTabBarCollectioView() {
        tabBarcollectionView.isScrollEnabled = true
        let indexPath = IndexPath(item: 0, section: 0)
        tabBarcollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        requstMainAPI(index: 0)
    }
    
    private func register() {
        tabBarcollectionView.register(cell: MainTabbarCell.self)
        pageCollectionView.register(cell: MainPageCell.self)
        pageCollectionView.register(cell: MainFirstPageCell.self)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        lineView.backgroundColor = .gray_4
        optionView.oneServiceClosure = {
            self.reloadData()
        }
    }
    
    private func setLayout() {
        view.addSubviews(naviView, optionView, tabBarcollectionView, lineView, pageCollectionView)
        
        naviView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(44)
        }
        
        tabBarcollectionView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(44)
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(tabBarcollectionView.snp.bottom).offset(-2)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        optionView.snp.makeConstraints {
            $0.top.equalTo(tabBarcollectionView.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(32)
        }
        
        pageCollectionView.snp.makeConstraints {
            $0.top.equalTo(tabBarcollectionView.snp.bottom).offset(60)
            $0.directionalHorizontalEdges.bottom.equalToSuperview()
        }
    }
}

// MARK: - Delegate, DataSource

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabBarItems.count
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let targetXContentOffset = targetContentOffset.pointee.x
        let itemAt = Int(targetXContentOffset / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        
        tabBarcollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        tabBarcollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabBarcollectionView {
            let cell: MainTabbarCell = collectionView.dequeueReusableCell(for: indexPath)
            let item = tabBarItems[indexPath.item]
            cell.bind(item)
            return cell
        } else if collectionView == pageCollectionView {
            let cell: MainPageCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.items = item
           
            cell.indexClosure = { [weak self] index in
                let vc = StoreDetailVC()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabBarcollectionView {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            let pageIndexPath = IndexPath(item: indexPath.item, section: 0)
            pageCollectionView.scrollToItem(at: pageIndexPath, at: .centeredHorizontally, animated: true)
            requstMainAPI(index: indexPath.item)
            
        } else if collectionView == pageCollectionView {
            let middleIndex = collectionView.bounds.width / 2
            let desiredOffsetX = CGFloat(indexPath.item) * collectionView.bounds.width - middleIndex
            let targetOffset = CGPoint(x: desiredOffsetX, y: 0)
            collectionView.setContentOffset(targetOffset, animated: true)
        }
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tabBarcollectionView {
            let cell: MainTabbarCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.tabBarLabel.text = tabBarItems[indexPath.row].name
            cell.tabBarLabel.sizeToFit()
            let cellWidth = cell.tabBarLabel.frame.width + 20
            return CGSize(width: cellWidth, height: 40)
        } else if collectionView == pageCollectionView {
            return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
        }
        return CGSize.zero
    }
}

extension MainVC {
    func requstMainAPI(index: Int) {
        MainAPI.shared.getStore(id: index + 1 ) {response in
            print("🍀🍀🍀 response 🍀🍀🍀")
            print(response)
            switch response {
            case .success(let data):
                guard let data = data as? MainResponseDTO else { return }
                let dataArray = data.data
                for item in dataArray {
                    self.item.append(item)
                    print("💎\(self.item)")
                }
               self.pageCollectionView.reloadData()
                print("🍀🍀🍀  ARRAY에 담긴 데이터들  🍀🍀🍀")
            default:
                print("🍀🍀🍀  왜 안 오ㅏ  🍀🍀🍀")
                print(response)
            }
        }
    }
}
