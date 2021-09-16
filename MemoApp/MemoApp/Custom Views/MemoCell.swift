//
//  MemoCellTableViewCell.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

class MemoCell: UITableViewCell {
    
    static let identifier = "MemoCell"
    
    let cellStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
