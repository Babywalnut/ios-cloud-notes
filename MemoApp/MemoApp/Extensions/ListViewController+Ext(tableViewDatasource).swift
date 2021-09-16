//
//  ListViewController+Ext(tableViewDatasource).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.identifier, for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }

        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
}
