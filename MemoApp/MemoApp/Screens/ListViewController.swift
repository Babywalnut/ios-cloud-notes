//
//  ListViewController.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

class ListViewController: UIViewController {
    
    var data: [CellData] = []
    
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
        cell.titleLabel.text = data[indexPath.row].title
        cell.dateLabel.text = "\(convertedDate(indexPath: indexPath))"
        cell.thumbnailLabel.text = data[indexPath.row].body
    }
}
