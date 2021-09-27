//
//  MemoViewControllerDelegate.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/16.
//

import UIKit

protocol DataPassingDelegate {
    
    func passData(text: String, indexPath: IndexPath)
    
    func initializeData(indexPath: IndexPath)
}
