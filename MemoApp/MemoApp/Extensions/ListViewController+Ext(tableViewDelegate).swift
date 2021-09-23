//
//  ListViewController+Ext(tableViewDelegate).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let titleData = data[indexPath.row].title, let bodyData = data[indexPath.row].body {
            delegate?.passData(title: titleData, body: bodyData, indexPath: indexPath)
        } else {
            delegate?.initializeData(indexPath: indexPath)
        }
        
        if let detailViewController = delegate as? MemoViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }
}
