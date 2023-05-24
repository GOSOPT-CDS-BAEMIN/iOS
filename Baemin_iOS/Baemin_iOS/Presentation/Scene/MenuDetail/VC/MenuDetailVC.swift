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
    
    private let  naviView = CustomNavigaionView(type1: .menu(.leftButton), type2: .menu(.rightButton))
    
    private let verticalStackView: UIStackView = {
      let stackView = UIStackView()
        return stackView
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
        view.addSubviews(naviView)
        
        naviView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(44)
        }
        
    }
}
