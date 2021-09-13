//
//  MemoViewController.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

class MemoViewController: UIViewController {
    
    var memoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureMemoTextView()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
    }
    
    func configureMemoTextView() {
        view.addSubview(memoTextView)
        
        NSLayoutConstraint.activate([
            memoTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            memoTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            memoTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            memoTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
