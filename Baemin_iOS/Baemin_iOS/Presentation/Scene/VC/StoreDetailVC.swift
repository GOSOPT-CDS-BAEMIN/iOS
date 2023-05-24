//
//  StoreDetailVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/19.
//

import UIKit

import SnapKit

class StoreDetailVC: UIViewController {
    
    private let rowNum = [1, 1, 1, 5, 4]
    
    // 0. 전체 TableView
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.sectionHeaderHeight = UITableView.automaticDimension
        table.sectionFooterHeight = UITableView.automaticDimension
        table.rowHeight = UITableView.automaticDimension
        table.contentInsetAdjustmentBehavior = .never
        return table
    }()
    
    // 2. viewDidLoad 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayOut()
        register()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    // 레이아웃 세팅
    private func setLayOut() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(StoreInfoCell.self, forCellReuseIdentifier: StoreInfoCell.identifier)
        tableView.register(OrderMethodSelectView.self, forHeaderFooterViewReuseIdentifier: OrderMethodSelectView.identifier)
        tableView.register(OrderInfoCell.self, forCellReuseIdentifier: OrderInfoCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension StoreDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    // 섹션의 개수 정의
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 각 섹션마다의 셀 개수 정의
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNum[section]
    }
    
    // 각 섹션마다의 보여줄 셀 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoreInfoCell.identifier, for: indexPath) as? StoreInfoCell else { return UITableViewCell() }
            cell.isCoupon(1)
            return cell
        default:
            guard let deliverCell = tableView.dequeueReusableCell(withIdentifier: OrderInfoCell.identifier, for: indexPath) as? OrderInfoCell else { return UITableViewCell()
            }
            return deliverCell
        }
    }
    
    // 섹션 헤더뷰 보여주기
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        default:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: OrderMethodSelectView.identifier) as! OrderMethodSelectView
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
