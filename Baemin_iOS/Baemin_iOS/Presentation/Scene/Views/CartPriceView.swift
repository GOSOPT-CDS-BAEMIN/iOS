//
//  CartPriceView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/19.
//

import UIKit
import SnapKit

class CartPriceView: UIView {

    private let totalPriceStackView = UIStackView()
    private let totalPayStackView = UIStackView()
    private let deliveryTipLabel = UILabel()
    private let noticeLabel = UILabel()
    var totalPriceLabel = UILabel()
    var totalPayLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartPriceView {
    
    func setStyle() {
        
    }
    
    func setLayout() {
        
    }
    


}
