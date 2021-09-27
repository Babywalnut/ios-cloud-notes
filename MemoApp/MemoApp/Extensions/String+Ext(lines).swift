//
//  String+Ext(lines).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/27.
//

import Foundation

extension String {
    
    var lines: [String] {
        get {
            return self.components(separatedBy: NSCharacterSet.newlines)
        }
    }
}
