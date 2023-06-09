import UIKit

import SnapKit

class DeliveryView: UIView {
    
    // MARK: - Properties
    private let first_label: [String] = ["최소주문금액", "결제방법", "배달시간", "배달팁"]
    private let second_label: [String] = ["8,000원", "바로결제, 만나서결제", "18~33분 소요 예상", "0원 ~ 2,000원"]
    
    private let firstView = DeliveryInfoBaseView()
    private let secondView = DeliveryInfoBaseView()
    private let thirdView = DeliveryInfoBaseView()
    private let fourthView = DeliveryInfoBaseView()
    
    // MARK: - UI Component

    private let detailTag: UIButton = {
        let tag = UIButton()
        tag.setImage(UIImage.detail.resized(toWidth: 44), for: .normal)
        tag.sizeToFit()
        return tag
    }()
    
    // MARK: - initialize func
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setting()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setting() {
        firstView.leftView.text = first_label[0]
        firstView.rightView.text = second_label[0]
        secondView.leftView.text = first_label[1]
        secondView.rightView.text = second_label[1]
        thirdView.leftView.text = first_label[2]
        thirdView.rightView.text = second_label[2]
        fourthView.leftView.text = first_label[3]
        fourthView.rightView.text = second_label[3]
    }
    
    private func setLayOut() {
        
        backgroundColor = .clear
        
        addSubviews(firstView, secondView, thirdView, fourthView, detailTag)
        
        firstView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }

        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom).offset(12)
            $0.leading.equalTo(firstView.snp.leading)
        }

        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom).offset(12)
            $0.leading.equalTo(firstView.snp.leading)
        }

        fourthView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(firstView.snp.leading)
        }
        
        detailTag.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(fourthView.snp.trailing).offset(6)
        }
    }
}
