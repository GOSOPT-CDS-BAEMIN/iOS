//
//  ReviewBottomSheetVC.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class ReviewBottomSheetVC: UIViewController {
    
    // MARK: - Properties
    
    var index: Int = 0
    private var items: [Food] = []
    private var selectedIndices: Set<Int> = []
    
    private var isTapped: Bool = false
    
    // MARK: - UI Components
    
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Review.title
        label.font = .AppleSDGothicNeo(.bold, size: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var bottomButton: CustomButton = {
        let button = CustomButton()
        button.resetting.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requestReview(index: self.index)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        register()
    }
}

// MARK: - Methods

extension ReviewBottomSheetVC {
    
    private func register() {
        collectionView.register(cell: ReviewCell.self)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    
    }
    
    private func setLayout() {
        view.addSubviews(menuLabel, collectionView, bottomButton)
        
        menuLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.leading.equalToSuperview().offset(16)
        }
        
        bottomButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(28)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.bottom).offset(30)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(bottomButton.snp.top)
        }
    }
    
    private func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.bounds.width-32, height: 22)
        return layout
    }
    
    private func updateButtonState() {
        let isButtonActive = !selectedIndices.isEmpty
        bottomButton.updateUI(isTapped: isButtonActive)
    }
    
    @objc
    private func resetButtonTapped() {
            selectedIndices.removeAll()
            collectionView.reloadData()
            updateButtonState()
        }
}

// MARK: - CollectionView Delegate, CollectionViewDataSource

extension ReviewBottomSheetVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ReviewCell = collectionView.dequeueReusableCell(for: indexPath)
        if indexPath.item < items.count {
            cell.bind(item: items[indexPath.item])
       }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReviewCell {
            cell.isTapped = !cell.isTapped
        }
        if selectedIndices.contains(indexPath.item) {
            selectedIndices.remove(indexPath.item)
        } else {
            selectedIndices.insert(indexPath.item)
        }
        updateButtonState()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReviewCell {
            cell.isTapped = !cell.isTapped
        }
        selectedIndices.remove(indexPath.item)
        updateButtonState()
    }
}

extension ReviewBottomSheetVC {
    func requestReview(index: Int) {
        StoreAPI.shared.getStoreInfo(request: index) {response in
            print("🍀🍀🍀 response 🍀🍀🍀")
            print(response)
            switch response {
            case .success(let data):
                guard let data = data as? StoreResponseDTO else { return }
                let dataArray = data.data.foods
                self.items = dataArray
                self.collectionView.reloadData()
                print("🍀🍀🍀  ARRAY에 담긴 데이터들  🍀🍀🍀")
            default:
                print("🍀🍀🍀  왜 안 오ㅏ  🍀🍀🍀")
                print(response)
            }
        }
    }
}
