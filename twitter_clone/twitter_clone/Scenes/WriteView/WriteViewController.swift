//
//  WriteViewController.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/26.
//

import SnapKit
import UIKit

final class WriteViewController: UIViewController {
    private lazy var presenter = WritePresenter(viewController: self)
    
    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: "닫기",
            style: .plain,
            target: self,
            action: #selector(didTapLeftBarButtonItem)
        )
        
        return barButtonItem
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: "트윗",
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
        
        return barButtonItem
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.textColor = .secondaryLabel
        textView.text = "Tweet"
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension WriteViewController: WriteProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubview(textView)
        
        let superViewInset: CGFloat = 16.0
        textView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superViewInset)
            $0.leading.trailing.equalToSuperview().inset(superViewInset)
            $0.height.equalTo(160.0)
        }
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}

private extension WriteViewController {
    @objc func didTapLeftBarButtonItem() {
        presenter.didTapLeftBarButtonItem()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem(text: textView.text)
    }
}

extension WriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = nil
        textView.textColor = .label
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor != .secondaryLabel else { return }
        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
}
