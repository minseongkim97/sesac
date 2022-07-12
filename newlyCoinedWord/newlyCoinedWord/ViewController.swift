//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by MIN SEONG KIM on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let newlyWord = [
        "삼귀자": "연애를 시작하기 전 썸 단계!",
        "윰차": "유모차",
        "실매": "실시간 매니저",
        "만반잘부": "만나서 반가워.\n잘 부탁해",
        "꾸안꾸": "꾸민 듯\n안 꾸민 듯",
        "점메추": "점심 메뉴 추천",
        "캘박": "캘린더 박제",
        "웃안웃": "웃긴데 안 웃겨"
    ]
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var tagButtons: [UIButton]!
    @IBOutlet weak var meaningLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchView()
        setTagButton(borderWidth: 1, borderColor: .black, cornerRadius: 7)
    }
    
    //MARK: - Action
    @IBAction func didTappedSearchButton(_ sender: UIButton) {
        searchNewlyWord()
    }
    
    @IBAction func didTappedTotalView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func didTappedReturnKey(_ sender: UITextField) {
        searchNewlyWord()
    }
    
    //MARK: - Helpers
    private func findMeaning(word: String) -> String {
        if let meaning = newlyWord[word] {
            return meaning
        }
        return "신조어 사전에 등록되어 있지 않은 단어입니다."
    }
    
    private func setSearchView() {
        searchView.layer.borderWidth = 2
        searchView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setTagButton(borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        for button in tagButtons {
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor.cgColor
            button.layer.cornerRadius = cornerRadius
        }
    }
    
    private func searchNewlyWord() {
        if let word = searchTextField.text {
            meaningLabel.text = findMeaning(word: word)
        }
        self.view.endEditing(true)
    }
}

