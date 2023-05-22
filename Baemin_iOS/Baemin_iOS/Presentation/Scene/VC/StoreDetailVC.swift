//
//  StoreDetailVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/19.
//

import UIKit
import SnapKit

class StoreDetailVC: UIViewController {
    
    // 1. 가게 대표 이미지 UIImageView
    private let storeImage: UIImageView = {
        let img = UIImageView()
    //    img.image = UIImage.dummy
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    // 2. 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
