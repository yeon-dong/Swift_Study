
//
//  ViewController.swift
//  LowerCaseAlphabetCollector
//
//  Created by User on 12/11/24.
//
// - 사용자 입력을 받아서 소문자를 모으는 앱
// - 소문자의 중복을 허용하지 않는다.
// - 테이블뷰에 리스트의 형식으로 오름차순으로 보여준다.
// - 사용하는 컬렉션: Array, Dictionary, Set

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var lowerCaseAlphabets: Set<Character> = []
    
    // Set을 배열로 변환 후 정렬
    var sortedData: [String] {
        return lowerCaseAlphabets.map { String($0) }.sorted()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    @IBAction func register(_ sender: UIButton) {
        let input = textField.text!
        if input.count == 1 {
            let char = Character(input)
            if char.isLowercase {
                lowerCaseAlphabets.insert(char)
                print("lowerCaseAlphabets: \(lowerCaseAlphabets)")
                tableView.reloadData()
            } else {
                // 소문자가 아닐 때
                showAlert(on: self, title: "소문자가 아닙니다.")
            }
        } else {
            // 한 글자가 아닐 때
            showAlert(on: self, title: "한 글자가 아닙니다.")
        }
    }
    
    func showAlert( on viewController: UIViewController, title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(sortedData[indexPath.row])
        return cell
    }
}
