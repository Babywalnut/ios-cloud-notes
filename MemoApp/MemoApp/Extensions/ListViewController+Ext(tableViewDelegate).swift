//
//  ListViewController+Ext(tableViewDelegate).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bodyData = data[indexPath.row].body else {
            return }
        
        delegate?.passData(body: bodyData)
        
        if let detailViewController = delegate as? MemoViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
}
