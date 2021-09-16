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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: .none)
    }
    
    private func configureListTableView() {
        view.addSubview(listTableView)
        listTableView.register(MemoCell.self, forCellReuseIdentifier: MemoCell.identifier)
        
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
