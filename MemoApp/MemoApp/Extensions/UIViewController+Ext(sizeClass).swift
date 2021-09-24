//
//  UIViewController+Ext(sizeClass).swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/24.
//

import UIKit

extension UIViewController {
    func sizeClass() -> UIUserInterfaceSizeClass {
        return self.traitCollection.verticalSizeClass
    }
}
