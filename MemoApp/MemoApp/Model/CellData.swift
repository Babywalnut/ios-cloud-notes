//
//  CellData.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import Foundation

final class CellData {
    
    var title: String?
    var body: String?
    var date: TimeInterval
    
    init(title: String? = "", body: String? = "", date: TimeInterval) {
        self.title = title
        self.body = body
        self.date = date
    }
}
