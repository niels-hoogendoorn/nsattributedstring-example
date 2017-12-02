//
//  LabelScreen.swift
//  NSAttributedString Example
//
//  Created by Niels Hoogendoorn on 02/12/2017.
//  Copyright © 2017 Niels Hoogendoorn. All rights reserved.
//

import Foundation
import UIKit
import ZSWTappableLabel

class LabelScreen: ViewController {
    
    @IBOutlet weak var label: ZSWTappableLabel!
    
    override func viewDidLoad() {
        setAttributedTextInUILabel(text: mockHTMLString, label: label)
    }
}


extension LabelScreen: ZSWTappableLabelTapDelegate {
    // Set attributed text for UILabels
    func setAttributedTextInUILabel (text: String, label: ZSWTappableLabel) {
        
        // Set ZSWTappable Delegate
        label.tapDelegate = self
        
        // Convert String to NSMutableAttributedString
        let attributedText = text.convertHTMLStringToAttributedString()
        
        // Set range to the whole NSMutableAttributedString
        let rangeAll = NSRange(location: 0, length: attributedText.length)
        
        // Detect written URL's (not detected by NSAttributedString (no <a href>)
        detectURLFromText(attributedString: attributedText, label: label, range: rangeAll)
        
        // Set the attributed text to the label
        label.attributedText = attributedText
    }
    
    // Set ZSWTappable label to open URLs on tap
    func tappableLabel(_ tappableLabel: ZSWTappableLabel,
                       tappedAt idx: Int,
                       withAttributes attributes: [NSAttributedStringKey: Any]) {
        if let url = attributes[.link] as? URL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // Detect written URL's (www.google.com for example) in text and make them tappable
    func detectURLFromText(attributedString: NSMutableAttributedString,
                           label: ZSWTappableLabel,
                           range: NSRange) {
        
        let detector = try? NSDataDetector(types: NSTextCheckingAllSystemTypes)
        
        detector?.enumerateMatches(in: attributedString.string,
                                   options: [],
                                   range: range) { (result, _, _) in
                                    guard let result = result else { return }
                                    
                                    // Set attributes
                                    var attributes = [NSAttributedStringKey: Any]()
                                    
                                    // Only set attributes if it's a URL
                                    if let link = result.url {
                                        attributes[.tappableRegion] = true
                                        attributes[.init(rawValue: "NSTextCheckingResult")] = result
                                        attributes[.link] = link
                                        attributedString.addAttributes(attributes,
                                                                       range: result.range)
                                    }
        }
        
    }
}
