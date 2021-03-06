//
//  MemoViewController+Ext(TextViewDelegate).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/16.
//

import UIKit

extension MemoViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let indexPath = self.indexPath {
            delegate?.updateData(body: memoTextView.text, indexPath: indexPath)
            print(memoTextView.text.lines)
        }
    }
}
