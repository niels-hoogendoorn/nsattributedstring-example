//
//  String+NSAttributedString.swift
//  NSAttributedString Example
//
//  Created by Niels Hoogendoorn on 02/12/2017.
//  Copyright © 2017 Niels Hoogendoorn. All rights reserved.
//

import Foundation
import UIKit
import ZSWTappableLabel

extension String {
    func convertHTMLStringToAttributedString() -> NSMutableAttributedString {
        // Convert HTML string to Attributed String
        guard let data = data(using: .utf8, allowLossyConversion: true),
            let attributedString = try? NSMutableAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            else { return NSMutableAttributedString() }
        
        // Call function that loops through NSMutableAttributed String
        // and sets system fonts, headers and links.
        let updatedAttributedString = checkAndSetAttributes(attributedString: attributedString)
        
        return updatedAttributedString
    }
    
    func checkAndSetAttributes (attributedString: NSMutableAttributedString) -> NSMutableAttributedString {
        
        // Loop through the attributes per character to set the correct font
        var index = 0
        while index < attributedString.length {
            
            // Check attributes at index
            let attribute = attributedString.attributes(at: index, effectiveRange: nil)
            let range = NSRange(location: index, length: 1)
            
            // Set font to Bold, Italic or System
            let font = attribute[.font] as? UIFont
            
            // Set font to boldSystemFont if attribute contains bold in font name
            if font?.fontName.lowercased().contains("bold") == true {
                attributedString.addAttribute(.font,
                                              value: UIFont.boldSystemFont(ofSize: 16),
                                              range: range)
            }
            // Set font to italicSystemFont if attribute contains italic in font name
            else if font?.fontName.lowercased().contains("italic") == true {
                attributedString.addAttribute(.font,
                                              value: UIFont.italicSystemFont(ofSize: 16),
                                              range: range)
            }
                
            // Else set normal systemFont
            else {
                attributedString.addAttribute(.font,
                                              value: UIFont.systemFont(ofSize: 16),
                                              range: range)
            }
            
            // Set the links and make them tappable
            if let link = attribute[.link] as? URL {
                // Add link attribute
                attributedString.addAttribute(.link,
                                              value: link,
                                              range: range)
                
                // Make it tappable through ZSWTappableLabel
                attributedString.addAttribute(.tappableRegion,
                                              value: true,
                                              range: range)
            }
            
            // Set header sizes
            // Standard font size from parsed HTML is 12.0
            if font?.pointSize == 18.0 {
                // Set H1, font size from parsed HTML is 18.0
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 26), range: range)
            } else if font?.pointSize == 16.0 {
                // Set H2, font size from parsed HTML is 16.0
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 22), range: range)
            } else if font?.pointSize == 14.0 {
                // Set H3, font size from parsed HTML is 14.0
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range)
            }
            
            index += 1
        }
        
        return attributedString
    }
    
}
