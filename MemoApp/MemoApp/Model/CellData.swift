//
//  CellData.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import Foundation

final class CellData {
    
    var title: String?
    var titleSpacing: Int?
    var body: String?
    var bodySpacing: Int?
    var date: TimeInterval
    
    init(title: String? = nil, titleSpacing: Int? = nil, body: String? = nil, bodySpacing: Int? = nil, date: TimeInterval) {
        self.title = title
        self.titleSpacing = titleSpacing
        self.body = body
        self.bodySpacing = bodySpacing
        self.date = date
    }
}
