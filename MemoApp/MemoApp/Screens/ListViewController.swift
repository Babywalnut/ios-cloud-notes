//
//  ListViewController.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

class ListViewController: UIViewController {
    
    var data: [CellData] = []
    var delegate: DataPassingDelegate?
    
    
    lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureListTableView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard let selectedRow = listTableView.indexPathsForSelectedRows else {
            return
        }
        
        if sizeClass() == .regular {
            listTableView.deselectRow(at: selectedRow[0], animated: false)
        }
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMemo))
    }
    
    @objc func addNewMemo() {
        data.append(CellData(date: Date().timeIntervalSince1970))
        listTableView.reloadData()
    }
    
    private func configureListTableView() {
        view.addSubview(listTableView)
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(MemoCell.self, forCellReuseIdentifier: MemoCell.identifier)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func convertedDate(indexPath: IndexPath) -> String {
        let dateFormetter = DateFormatter()
        let date = Date(timeIntervalSince1970: data[indexPath.row].date)
        dateFormetter.dateFormat = "yyyy-MM-dd"
        let convertedDate = dateFormetter.string(from: date)
        
        return convertedDate
    }
    
    private func initializeCellData(cell: MemoCell, indexPath: IndexPath) {
        if let title = self.data[indexPath.row].title, let body = self.data[indexPath.row].body  {
            cell.titleLabel.text = title
            cell.thumbnailLabel.text = body
        } else {
            cell.titleLabel.text = InitialData.title.rawValue
            cell.thumbnailLabel.text = InitialData.body.rawValue
        }
        cell.dateLabel.text = convertedDate(indexPath: indexPath)
    }
    
    func configureCell(cell: MemoCell, indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.separatorInset = .zero
        initializeCellData(cell: cell, indexPath: indexPath)
    }
    
    func combinedText(title: String, titleSpacing: Int, body: String, bodySpacing: Int) -> String {
        var textElementList: [String] = []
        var combinedText: String
        textElementList.append(String(repeating: "\n", count: titleSpacing))
        textElementList.append(title)
        textElementList.append(String(repeating: "\n", count: bodySpacing))
        textElementList.append(body)
        combinedText = textElementList.joined()
        
        return combinedText
    }
    
    func numberOfSpacingLine(textArray: [String]) -> Int {
        var spacing = 0
        for (index,line) in textArray.enumerated() {
            if line != "" {
                spacing = index
                break
            }
        }

        return spacing
    }
}

extension ListViewController: DataUpdateDelegate {
    
    func updateData(body: String, indexPath: IndexPath) {
        let textArray = body.lines
        let titleSpacing = numberOfSpacingLine(textArray: textArray)
        let bodySpacing = numberOfSpacingLine(textArray: Array(textArray[(titleSpacing + 1)...]))
        
        data[indexPath.row].title = textArray[titleSpacing]
        data[indexPath.row].titleSpacing = titleSpacing
        data[indexPath.row].body = textArray[(titleSpacing + bodySpacing + 1)...].joined(separator: "\n")
        data[indexPath.row].bodySpacing = bodySpacing
        listTableView.reloadRows(at: [indexPath], with: .none)
    }
}
