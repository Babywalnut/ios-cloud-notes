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
    
    var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureListTableView()
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
    
    func convertedDate(indexPath: IndexPath) -> String {
        let dateFormetter = DateFormatter()
        let date = Date(timeIntervalSince1970: data[indexPath.row].date)
        dateFormetter.dateFormat = "yyyy-MM-dd"
        let convertedDate = dateFormetter.string(from: date)
        
        return convertedDate
    }
    
    func configureCell(cell: MemoCell, indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.separatorInset = .zero
        if let title = data[indexPath.row].title, let body = data[indexPath.row].body  {
            cell.titleLabel.text = title
            cell.thumbnailLabel.text = body
        } else {
            cell.titleLabel.text = InitialData.title.rawValue
            cell.thumbnailLabel.text = InitialData.body.rawValue
        }
        cell.dateLabel.text = "\(convertedDate(indexPath: indexPath))"
    }
}

extension ListViewController: DataUpdateDelegate {
    func updateData( body: String, indexPath: IndexPath) {
        var count = 0
        var titleIndex = 0
        var textElementsList = body.lines
        
        for (index,line) in textElementsList.enumerated() {
            if count == 0 && line != "" {
                data[indexPath.row].title = line
                count += 1
            } else if count == 1 && line != "" {
                titleIndex = index
                break
            } else if count == 0 && index == textElementsList.count - 1 {
                data[indexPath.row].title = ""
            }
        }
        
        if titleIndex != 0 {
            textElementsList.removeSubrange(0..<titleIndex)
            print(textElementsList)
        } else {
            textElementsList.removeSubrange(0...titleIndex)
        }
        
        data[indexPath.row].body = textElementsList.joined(separator: "\n")
        listTableView.reloadData()
    }
}
