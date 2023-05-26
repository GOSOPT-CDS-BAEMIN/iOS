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

    // MARK: - UI Components
    
    private let menuView =  MenuDetailView()
    private let naviView = CustomNavigaionView(type1: .menu(.leftButton), type2: .menu(.rightButton))
    private let menuImage: UIImageView = {
        let image = UIImageView()
        image.image = .empty_2
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var saveButon: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.backgroundColor = .primary_2
        button.makeCornerRound(radius: 2)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

// MARK: - Methods

extension MenuDetailVC {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(menuImage, menuView, naviView, saveButon)
        
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
        saveButon.snp.makeConstraints {
            $0.bottom.equalTo(safeArea).inset(10)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(11)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func saveButtonTapped() {
        let vc = CartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
