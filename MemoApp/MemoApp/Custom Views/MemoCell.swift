//
//  MemoCellTableViewCell.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

class MemoCell: UITableViewCell {
    
    static let identifier = "MemoCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var thumbnailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var contentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellStackView()
        configureTitleLabel()
        configureContentsStackView()
        configureDateLabel()
        configureThumbnailLabel()
        accessoryType = AccessoryType.disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureCellStackView() {
        addSubview(cellStackView)
        
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30)
        ])
    }
    
    private func configureTitleLabel() {
        cellStackView.addArrangedSubview(titleLabel)
    }
    
    private func configureContentsStackView() {
        cellStackView.addArrangedSubview(contentsStackView)
    }
    
    private func configureDateLabel() {
        contentsStackView.addArrangedSubview(dateLabel)
    }
    
    private func configureThumbnailLabel() {
        contentsStackView.addArrangedSubview(thumbnailLabel)
    }
}
