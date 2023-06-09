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

    var useOneItemIndex: Int = 0
    var tabBarItems: [TabBarItem] = TabBarItem.tabBar()
    
    var item: [MainData] = []
    
    var oneItem: [MainData] = [] {
        didSet {
            pageCollectionView.reloadData()
        }
    }
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    
    private let naviView = CustomNavigaionView(type1: .main(.leftButton), type2: .main(.rightButton), storeName: "")
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
        OptionData()
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
        pageCollectionView.register(cell: MainPageCell.self)
        pageCollectionView.register(cell: MainFirstPageCell.self)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        lineView.backgroundColor = .gray_4
        naviView.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        naviView.iconButton.rightButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
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
    
    private func setupTabBarCollectioView() {
         self.navigationController?.isNavigationBarHidden = true
         tabBarcollectionView.isScrollEnabled = true
         let indexPath = IndexPath(item: 0, section: 0)
         tabBarcollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
         requstMainAPI(index: 0)
     }
    
    private func OptionData() {
        optionView.oneServiceClosure = { [weak self] index in
            self?.useOneItemIndex = index
            guard let oneItem = self?.item else { return }
            switch index {
            case 1:
                let filteredItems = oneItem.filter { $0.couponExist == false }
                self?.oneItem = filteredItems
            case 2:
                let  filteredItems = oneItem.filter { $0.storeType == "치킨" }
                self?.oneItem = filteredItems
            case 3:
                let  filteredItems = oneItem.sorted { $0.deliveryFee < $1.deliveryFee}
                self?.oneItem = filteredItems
            case 4:
                let  filteredItems = oneItem.sorted { $0.rate > $1.rate}
                self?.oneItem = filteredItems
            case 5:
                let  filteredItems = oneItem.sorted { $0.minOrderPrice < $1.minOrderPrice}
                self?.oneItem = filteredItems
            default:
                self?.oneItem = oneItem
            }
        }
    }
    
    private func OptionViewReload() {
         self.optionView.item[self.useOneItemIndex].status = .off
         self.optionView.item[self.useOneItemIndex] = self.optionView.item[self.useOneItemIndex].isSelected()
         self.optionView.collectionView.reloadData()
         self.useOneItemIndex = 0
     }
}

extension MainVC {
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func cartButtonTapped() {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
        requstMainAPI(index: itemAt)
        tabBarcollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        tabBarcollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        OptionViewReload()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabBarcollectionView {
            let cell: MainTabbarCell = collectionView.dequeueReusableCell(for: indexPath)
            let item = tabBarItems[indexPath.item]
            cell.bind(item)
            return cell
        } else if collectionView == pageCollectionView {
            let cell: MainPageCell = collectionView.dequeueReusableCell(for: indexPath)
            
            if (1...5).contains(useOneItemIndex) { cell.items = oneItem }
            else { cell.items = item }
                   
            cell.indexClosure = { [weak self] index in
                let vc = StoreDetailVC()
                vc.dataIndex = cell.items[index].storeID
                vc.storeName = cell.items[index].storeName
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
            OptionViewReload()
           
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
        MainAPI.shared.getStore(id: index  ) {response in
            print("🍀🍀🍀 response 🍀🍀🍀")
            print(response)
            switch response {
            case .success(let data):
                guard let data = data as? MainResponseDTO else { return }
                let dataArray = data.data
                self.item = dataArray
                self.pageCollectionView.reloadData()
                let filterArray: [MainData]

                let validNames: [String] = ["전체", "족발,보쌈", "찜,탕,찌개", "돈까스,회,일식", "고기,구이", "피자", "양식", "중식", "아시안", "치킨", "백반,죽,국수", "버거", "분식", "카페,디저트"]
                if index == 0 {
                    return }
                else if index < validNames.count {
                    let targetName = validNames[index]
                    filterArray = self.item.filter { $0.storeType == targetName }
                } else { filterArray = [] }
                self.item = filterArray
            default:
                print(response)
            }
        }
    }
}
