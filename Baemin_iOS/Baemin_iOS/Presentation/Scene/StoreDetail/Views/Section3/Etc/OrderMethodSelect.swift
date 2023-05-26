//
//  OrderMethodSelect.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class OrderMethodSelect: UIView {
    
    var flag: Int = 0
    
    var selectedIndex: Int = 0 {
        didSet {
            flag = selectedIndex
        }
    }
    
    private var delivery_stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.alignment = .center
        stackView.sizeToFit()
        return stackView
    }()
    
    private var pickUp_stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.alignment = .center
        stackView.sizeToFit()
        return stackView
    }()
    
    private var delivery: UIButton = {
        let deliver = UIButton()
        deliver.setTitle(I18N.StoreDetail.delivery, for: .normal)
        deliver.titleLabel?.font = UIFont.AppleSDGothicNeo(.bold, size: 16)
        deliver.setTitleColor(.black, for: .normal)
        deliver.sizeToFit()
        deliver.tag = 0
        return deliver
    }()
    
    private var pickUp: UIButton = {
        let pickUp = UIButton()
        pickUp.setTitle(I18N.StoreDetail.pickUp, for: .normal)
        pickUp.titleLabel?.font = UIFont.AppleSDGothicNeo(.regular, size: 16)
        pickUp.setTitleColor(.black, for: .normal)
        pickUp.sizeToFit()
        pickUp.tag = 1
        return pickUp
    }()
    
    private lazy var delivery_line: UIView = {
        var width = 4.0
        let height = 4.0
        var xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .black
        self.addSubview(view)
        return view
    }()
    
    private lazy var pickUp_line: UIView = {
        var width = 4.0
        let height = 4.0
        let xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .black
        self.addSubview(view)
        return view
    }()
    
    private lazy var gray_divider: UIView = {
        var width = UIScreen.main.bounds.width
        let xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: 1.0)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.gray_4
        self.addSubview(view)
        return view
    }()
    
    private let totalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.sizeToFit()
        return stackView
    }()
    
    func configureContents() {
        
        delivery_stack.addArrangedSubviews(delivery, delivery_line)
        
        pickUp_stack.addArrangedSubviews(pickUp, pickUp_line)
        
        totalStack.addArrangedSubview(delivery_stack)
        
        addSubviews(pickUp_stack, totalStack, gray_divider)
        
        totalStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(68.5)
        }
        
        pickUp_stack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(68.5)
        }
        
        pickUp.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        pickUp_line.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pickUp.snp.bottom).offset(8)
            $0.height.equalTo(4)
            $0.width.equalTo(pickUp.snp.width)
        }
        
        delivery_stack.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(delivery.snp.width)
        }
        
        delivery_stack.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        
        delivery.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        delivery_line.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(delivery.snp.bottom).offset(8)
            $0.height.equalTo(4)
            $0.width.equalTo(delivery.snp.width)
        }
        
        gray_divider.snp.makeConstraints {
            $0.top.equalTo(totalStack.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.bottom.equalToSuperview()
        }
    }
    
    // 0. init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        configureContents()
        
        delivery.addTarget(self, action: #selector(deliveryTouched), for: .touchUpInside)
        pickUp.addTarget(self, action: #selector(pickUpTouched), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        pickUp_line.isHidden = true
        //contentView.backgroundColor = .white
        backgroundColor = .white
    }
    
    @objc
    func deliveryTouched(_ sender: Any) {
        delivery.titleLabel?.font = UIFont.AppleSDGothicNeo(.bold, size: 16)
        delivery_line.isHidden = false
        
        pickUp.titleLabel?.font = UIFont.AppleSDGothicNeo(.regular, size: 16)
        pickUp_line.isHidden = true
        
        selectedIndex = 0
        
        NotificationCenter.default.post(name: NSNotification.Name("orderIndex"), object: flag)
    }
    
    @objc
    func pickUpTouched(_ sender: Any) {
        pickUp.titleLabel?.font = UIFont.AppleSDGothicNeo(.bold, size: 16)
        pickUp_line.isHidden = false
        
        delivery.titleLabel?.font = UIFont.AppleSDGothicNeo(.regular, size: 16)
        delivery_line.isHidden = true
        
        selectedIndex = 1
        
        NotificationCenter.default.post(name: NSNotification.Name("orderIndex"), object: flag)
    }
}

