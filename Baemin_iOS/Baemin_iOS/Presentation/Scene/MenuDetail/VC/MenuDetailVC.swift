//
//  MenuDetailVC.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class MenuDetailVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    private var items: MenuDetail?
    var price: Int = 0
    var index: Int = 0
    var foodId: Int = 0
    var clientId: Int = 0
    var foodIds: [Int]?
    var foodCount: Int = 0
    var foodCounts: [Int] = []

    // MARK: - UI Components
    
    private let menuView =  MenuDetailView()
    private let bottomView =  UIView()
    private let naviView = CustomNavigaionView(type1: .menu(.leftButton), type2: .menu(.rightButton), storeName: "")
    private let menuImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let minimumPriceLabel: UILabel = {
        let label = UILabel()
        label.basic(text: I18N.MenuDetail.minumumPrice, font: .AppleSDGothicNeo(.regular, size: 12), color: .gray_5!)
        return label
    }()
    
    private let minimumPrice: UILabel = {
        let label = UILabel()
        label.basic(text: "", font: .AppleSDGothicNeo(.regular, size: 14), color: .black)
        return label
    }()
    
    private lazy var saveButon: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.MenuDetail.save, for: .normal)
        button.backgroundColor = .primary_2
        button.titleLabel?.font = .AppleSDGothicNeo(.bold, size: 18)
        button.makeCornerRound(radius: 2)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestMenuDetail(id: self.index)
//        requestMenuPut(body: .init(clientId: 1, foodIds: [1], foodCounts: [1]))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

// MARK: - Methods

extension MenuDetailVC {
    private func setStyle() {
        self.price = menuView.price
        view.backgroundColor = .gray_2
        
        naviView.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        naviView.iconButton.leftButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        naviView.iconButton.rightButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubviews(menuImage, menuView, naviView, bottomView)
        bottomView.addSubviews(minimumPriceLabel, minimumPrice, saveButon)
        
        naviView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(44)
        }
        
        menuImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(264)
        }
        
        menuView.snp.makeConstraints {
            $0.top.equalTo(menuImage.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(250)
        }
        
        bottomView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.bottom.equalTo(safeArea)
            $0.height.equalTo(70)
        }
        minimumPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(15)
        }
        minimumPrice.snp.makeConstraints {
            $0.top.equalTo(minimumPriceLabel.snp.bottom).offset(6)
            $0.leading.equalTo(minimumPriceLabel.snp.leading)
        }
        
        saveButon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 250, height: 50))
        }
    }
    
    func bind(item: MenuDetail) {
        menuImage.getImageFromURL(item.foodImageURL)
        minimumPrice.text = "\(Utils.convertToCurrencyFormat(price: item.price)) 원 담기"
    }
}

// MARK: - Action

extension MenuDetailVC {
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func saveButtonTapped() {
        self.foodCount = menuView.count
        self.foodCounts.append(self.foodCount)
        requestMenuPut(body: .init(clientId: 1, foodIds: [self.foodId], foodCounts: self.foodCounts))
        let vc = CartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func homeButtonTapped() {
       let vc = MainVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func cartButtonTapped() {
        let vc = CartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MenuDetailVC {
    func requestMenuDetail(id: Int) {
        MenuDetailAPI.shared.getMenuDetail(id: id) {response in
            print("🍀🍀🍀 response 🍀🍀🍀")
            print(response)
            switch response {
            case .success(let data):
                guard let data = data as? MenuDetailResponseDTO else { return }
                self.bind(item: data.data)
                self.menuView.bind(item: data.data, button: self.saveButon)
                self.items = data.data
                self.foodId = data.data.foodID
                print("✅food Id:\(self.foodId)")
                print("🍀🍀🍀  ARRAY에 담긴 데이터들  🍀🍀🍀")
            default:
                print("🍀🍀🍀  왜 안 오ㅏ  🍀🍀🍀")
                print(response)
            }
        }
    }
    
    func requestMenuPut(body: MenuDetailRequest) {
        MenuDetailAPI.shared.putMenuDetail(body: body) {response in
            print("🍀🍀🍀 response 🍀🍀🍀")
            print(response)
            switch response {
            case .success(let data):
                print(data)
                print("🍀🍀🍀  ARRAY에 담긴 데이터들  🍀🍀🍀")
            default:
                print("🍀🍀🍀  왜 안 오ㅏ  🍀🍀🍀")
                print(response)
            }
        }
    }
}
