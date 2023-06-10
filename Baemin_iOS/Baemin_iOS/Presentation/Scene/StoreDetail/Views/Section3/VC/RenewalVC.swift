////
////  RenewalVC.swift
////  Baemin_iOS
////
////  Created by 김응관 on 2023/06/07.
////
//
//import UIKit
//
//import SnapKit
//
//class RenewalVC: UIViewController {
//
//    // var bringClosure: ((_ index: Int) -> Void)?
//
//    var foodList: [Food] = [] {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setStyle()
//        setLayOut()
//        register()
//    }
//
//    // MARK: - Properties
//
//    var cellCount = 0 {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }
//
//    var descriptionView = MenuDescriptionView()
//
//    // MARK: - UI Components
//
//    private var tableView: UITableView = {
//        let table = UITableView()
//        table.separatorStyle = .singleLine
//        table.backgroundColor = .clear
//        table.showsVerticalScrollIndicator = false
//        table.rowHeight = UITableView.automaticDimension
//        return table
//    }()
//
//    private let famous: UIImageView = {
//        let view = UIImageView()
//        view.image = .famous
//        view.sizeToFit()
//        return view
//    }()
//
//    // MARK: - Methods
//
//    private func register() {
//        tableView.register(RenewalTableViewCell.self, forCellReuseIdentifier: RenewalTableViewCell.identifier)
//
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//
//    private func setStyle() {
//        view.backgroundColor = .clear
//    }
//
//    private func setLayOut() {
//
//        view.addSubviews(descriptionView, tableView)
//
//        descriptionView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.top.equalToSuperview().inset(35)
//            $0.height.equalTo(108)
//        }
//
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(famous.snp.bottom).offset(20)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(800)
//        }
//    }
//}
//
//extension RenewalVC: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    // TableView 행의 길이
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellCount
//    }
//
//    // TableView cell 지정하기
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        default:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: RenewalTableViewCell.identifier, for: indexPath) as? RenewalTableViewCell else { return UITableViewCell() }
//
//            cell.bind(foodList[indexPath.row])
//            cell.indexClosure = { [weak self] index in
//                self?.bringClosure?(index)
//            }
//
//            return cell
//        }
//    }
//
//    // 행 높이 자동조절
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//}
