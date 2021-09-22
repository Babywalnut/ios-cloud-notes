//
//  ViewController.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/12.
//

import UIKit

class CloudMemoViewController: UISplitViewController, UISplitViewControllerDelegate, UITextViewDelegate {
    
    lazy var listViewController: ListViewController = {
        let viewController = ListViewController()
        return viewController
    }()
    
    lazy var memoViewController: MemoViewController = {
        let viewController = MemoViewController()
        return viewController
    }()
    
    lazy var listNavigationController: UINavigationController = {
        return UINavigationController(rootViewController: listViewController)
    }()
    
    lazy var memoNavigationController: UINavigationController = {
        return UINavigationController(rootViewController: memoViewController)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        listViewController.delegate = memoViewController
        memoViewController.delegate = listViewController
        setViewController(listNavigationController, for: .primary)
        setViewController(memoNavigationController, for: .secondary)
        preferredDisplayMode = .oneBesideSecondary
        preferredSplitBehavior = .tile
    }

    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}
