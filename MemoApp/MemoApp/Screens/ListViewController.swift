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
        data[indexPath.row].title = body.lines[0]
        var bodyArray = body.lines
        bodyArray.removeFirst()
        print(bodyArray)
        let bodyData = bodyArray.joined(separator: "\n")
        data[indexPath.row].body = bodyData
        listTableView.reloadData()
    }
}
