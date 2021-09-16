//
//  ViewController.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/12.
//

import UIKit

class CloudMemoViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    var listViewController: UINavigationController = {
        return UINavigationController(rootViewController: ListViewController())
    }()
    
    var memoViewController: UINavigationController = {
        return UINavigationController(rootViewController: MemoViewController())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setViewController(listViewController, for: .primary)
        setViewController(memoViewController, for: .secondary)
        preferredDisplayMode = .oneBesideSecondary
        preferredSplitBehavior = .tile
    }

    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}

