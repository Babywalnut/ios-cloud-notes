//
//  DataUpdateDelegate.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/23.
//

import UIKit

protocol DataUpdateDelegate {
    
    func updateData(body: String, indexPath: IndexPath)
}
