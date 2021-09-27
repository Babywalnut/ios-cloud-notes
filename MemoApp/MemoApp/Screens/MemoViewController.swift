//
//  MemoViewController.swift
//  MemoApp
//
//  Created by 김민성 on 2021/09/13.
//

import UIKit

class MemoViewController: UIViewController {

    var delegate: DataUpdateDelegate?
    var indexPath: IndexPath?
    
    var memoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureMemoTextView()
        memoTextView.delegate = self
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: .none)
    }
    
    private func configureMemoTextView() {
        view.addSubview(memoTextView)
        
        NSLayoutConstraint.activate([
            memoTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            memoTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            memoTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            memoTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension MemoViewController: DataPassingDelegate {

    func passData(text: String, indexPath: IndexPath) {
        memoTextView.text = text
        self.indexPath = indexPath
    }
    
    func initializeData(indexPath: IndexPath) {
        memoTextView.text = ""
        self.indexPath = indexPath
    }
}
