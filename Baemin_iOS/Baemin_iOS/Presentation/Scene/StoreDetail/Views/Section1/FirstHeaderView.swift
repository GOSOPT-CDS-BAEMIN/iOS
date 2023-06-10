//
//  FirstHeaderView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/06/01.
//

import UIKit

import SnapKit

class FirstHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Property
    var tmpView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: CGFloat.leastNonzeroMagnitude))
    
    // MARK: - Init func

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    func setStyle() {
        addSubview(tmpView)
        
        tmpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
