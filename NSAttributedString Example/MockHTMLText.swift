//
//  MockHTMLText.swift
//  NSAttributedString Example
//
//  Created by Niels Hoogendoorn on 02/12/2017.
//  Copyright © 2017 Niels Hoogendoorn. All rights reserved.
//

let mockHTMLString: String = """
    <div>TestBody</div> <div>&nbsp;</div> <div>example@example.nl</div> <div><a href="http://example@example.nl" target="_blank">linkedEmail</a></div> <div>&nbsp;</div> <div><em>Italic</em></div> <div><strong>Bold</strong></div> <div><u>Underline</u></div> <div><br /> <a href="http://www.google.com" target="_blank">linkedURL</a><br /> www.google.com<br /> <a href="http://www.reddit.com" target="_blank">www.reddit.com</a><br /> &nbsp;</div> <div><s>Strikethrough</s></div> <div>TestBody<sub>smalltext</sub></div> <div>TestBodysmalltext</div> <blockquote> <div>Blockquote</div> </blockquote> <div style="text-align:center">Aligned Mid</div> <div style="text-align:right">Aligned Right</div> <div style="margin-left:40px">Indented</div> <ol> <li>Numbered list 1</li> <li>Numbered list 2</li> </ol> <ul> <li>Unordered list 1</li> <li>Unordered list 2</li> </ul> <div><span style="color:#800000">Colored text</span></div> <div><span style="background-color:#8B4513">Colored background</span></div> <h1 class="contentTitle1" style="font-size:18px; font-weight:bold">heading 1</h1> <h2 class="contentTitle2" style="font-size:16px; font-weight:bold">heading 2</h2> <h3 class="contentTitle3" style="font-size:14px; font-weight:bold">heading 3</h3>
"""
