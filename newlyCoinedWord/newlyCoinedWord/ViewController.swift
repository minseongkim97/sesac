//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by MIN SEONG KIM on 2022/07/11.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Properties
    let newlyWord = [
        "삼귀자": "연애를 시작하기 전 썸 단계!",
        "윰차": "유모차",
        "실매": "실시간 매니저",
        "만반잘부": "만나서 반가워.\n잘 부탁해",
        "꾸안꾸": "꾸민 듯\n안 꾸민 듯",
        
    ]
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var tagButtons: [UIButton]!
    @IBOutlet weak var meaningLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchView()
        setTagButton()
    }
    
    //MARK: - Action
    @IBAction func didTappedSearchButton(_ sender: UIButton) {
        searchNewlyWord()
    }
    
    @IBAction func didTappedTotalView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchNewlyWord()
        return true
    }
    
    //MARK: - Helpers
    private func setDelegate() {
        searchTextField.delegate = self
    }
    
    private func setSearchView() {
        searchView.layer.borderWidth = 2
        searchView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setTagButton() {
        for button in tagButtons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 7
        }
    }
    
    private func searchNewlyWord() {
        if let word = searchTextField.text {
            meaningLabel.text = newlyWord[word] == nil ? "신조어 사전에 등록되어 있지 않은 단어입니다." : newlyWord[word]!
        }
        self.view.endEditing(true)
    }
}

