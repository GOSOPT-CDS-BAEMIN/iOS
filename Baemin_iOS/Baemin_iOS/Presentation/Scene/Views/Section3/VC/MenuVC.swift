//
//  MenuVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuVC: UIViewController {
    
    let descriptionView = MenuDescriptionView()
    let menuView = MenuView()
    
    private let famous: UIImageView = {
        let view = UIImageView()
        view.image = .famous
        view.sizeToFit()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStyle()
        setLayOut()
        setNotificationCenter()
    }
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayOut() {
        
        view.addSubviews(descriptionView, famous, menuView)
        
        descriptionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(21)
            $0.height.equalTo(108)
        }
        
        famous.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.bottom).offset(72)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        menuView.snp.makeConstraints {
            $0.top.equalTo(famous.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("gotoMenuDetailVC"), object: nil)
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int
        print(tmp)

        if tmp == 1 {
            let vc = MenuDetailVC()
            self.navigationController?.pushViewController(self, animated: true)
        }
    }
}
