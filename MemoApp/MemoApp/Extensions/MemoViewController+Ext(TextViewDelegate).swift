//
//  MemoViewController+Ext(TextViewDelegate).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/16.
//

import UIKit

extension MemoViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        //ListView TitleLabel수정
        if let indexPath = self.indexPath {
            delegate?.passData(body: memoTextView.text, indexPath: indexPath)
        print("hi")
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("eh")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("222")
    }
}
