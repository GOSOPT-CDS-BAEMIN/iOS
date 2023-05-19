//
//  UILabel+.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

extension NSMutableAttributedString {
    func addImageInBetweenString(firstSentence: String, image: UIImage?, lastSentence: String) -> NSMutableAttributedString {
        
        let fullString = NSMutableAttributedString(string: firstSentence)
        
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = image
        image1Attachment.bounds = CGRect(x: 0, y: -2, width: 70, height: 15)
        let image1String = NSAttributedString(attachment: image1Attachment)
        
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: lastSentence))
        
        return fullString
    }
}

extension NSAttributedString {
    func withLineSpacing(_ spacing: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
}
