//
//  ViewController.swift
//  MyMovieChart-Spinoff
//
//  Created by icoinnet on 2021/07/09.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }//end of vieDidLoad



  
}//end of class

//UITableViewDataSource 프로토콜:  테이블을 구성하기 위해 필요한 메소드 정의
//tableView(_:numberOfRowsInSection:) //테이블 뷰 행의 개수를 반환하는 메소드
//tableView(_:cellForRowAt:) //테이블 뷰 행을 구성하는 메소드(개별 행을 만들어내는 역할)
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //임의로 5개 셀 생성
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row)번째 테이터입니다."
        return cell
    }
    

}//end of UITableViewDataSource

//UITableViewDelegate 프로토콜 : 테이블에서 발생하는 액션/이벤트와 관련된 메소드 정의
//tableView(_:didSelectRowAt:) //테이블 셀을 클릭하거 터치했을 때 액션 처리
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row)번째 데이터가 클릭됨")
    }
}//end of UITableViewDelegate


