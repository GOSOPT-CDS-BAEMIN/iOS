//
//  DetailInfoCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class DetailInfoCell: UITableViewCell {
    
    // MARK: - Properties
    
    var indexClosure: ((_ id: Int) -> Void)?
    
    var infoView = DeliveryView(frame: .zero, price: 0, time: "")
    var commentView = ReviewTab()
    
    var foodList: [Food] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - UI Components
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .singleLine
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    // MARK: - init func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayOut()
        setStyle()
        setNotificationCenter()
        register()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func register() {
        tableView.register(RenewalTableViewCell.self, forCellReuseIdentifier: RenewalTableViewCell.identifier)
        
        tableView.register(MenuDescriptionView.self, forHeaderFooterViewReuseIdentifier: MenuDescriptionView.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setStyle() {
        backgroundColor = .clear
    }
    
    func setLayOut() {
        addSubviewsInContentView(tableView, infoView, commentView)
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        infoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        commentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.isHidden = false
        infoView.isHidden = true
        commentView.isHidden = true
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("categoryIndex"), object: nil)
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int

        if tmp == 0 {
            tableView.isHidden = false
            infoView.isHidden = true
            commentView.isHidden = true
        } else if tmp == 1 {
            tableView.isHidden = true
            infoView.isHidden = false
            commentView.isHidden = true
        } else {
            tableView.isHidden = true
            infoView.isHidden = true
            commentView.isHidden = false
        }
    }
    
}

extension DetailInfoCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexClosure?(foodList[indexPath.item].foodID)
    }
    
    // 섹션의 개수 지저
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableView 행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    // TableView cell 지정하기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RenewalTableViewCell.identifier, for: indexPath) as? RenewalTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.bind(foodList[indexPath.item])
                   
            return cell
        }
    }
    
    // 섹션 헤더 지정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        default:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuDescriptionView.identifier) as! MenuDescriptionView
       
            view.article.text = foodList.first?.foodDescription
            return view
        }
    }
    
    // 행 높이 자동조절
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // 섹션 헤더 높이 자동조절
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}
