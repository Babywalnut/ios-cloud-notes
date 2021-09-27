//
//  ListViewController+Ext(tableViewDelegate).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let titleData = data[indexPath.row].title, let titleSpacing = data[indexPath.row].titleSpacing, let bodySpacing = data[indexPath.row].bodySpacing, let bodyData = data[indexPath.row].body {
            let fullText = combinedText(title: titleData, titleSpacing: titleSpacing, body: bodyData, bodySpacing: bodySpacing)
            delegate?.passData(text: fullText, indexPath: indexPath)
        } else {
            delegate?.initializeData(indexPath: indexPath)
        }
        
        if sizeClass() == .regular {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
        if let detailViewController = delegate as? MemoViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sizeClass() == .compact {
            return UIScreen.main.bounds.height / 6
        } else {
            return UIScreen.main.bounds.height / 10
        }
    }
}
