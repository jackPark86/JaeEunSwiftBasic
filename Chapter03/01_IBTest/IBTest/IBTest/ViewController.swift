//
//  ViewController.swift
//  IBTest
//
//  Created by icoinnet on 2021/05/25.
//

import UIKit

/**
    - p123
  인터페이스 빌더로부터 객체를 클래스에 다양하게 연결하는 방법을 배움
 */
class ViewController: UIViewController {
  
    //Label를 control 키와 + 마우스 드래그로 변수 생성
    @IBOutlet var uiTitle01: UILabel!
    // 커넥션 인스펙터 탭을 이용하여 Referemcomg Outlets 영역 원을 클릭 후 마우스 드래그 후 변수 생성
    @IBOutlet var uiTitle02: UILabel!
    
    //ViewController에 직접 입력 후 원을 클릭해서 연결
    @IBOutlet var uiTitle03: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }//end of viewDidLoad()


    
    @IBAction func clickBtn01(_ sender: Any) {
        
    }//end of clickBtn01()
        
    @IBAction func clickBtn02(_ sender: Any) {
        
    }//end of clickBtn02()
    
    //인터페이스 빌더 객체 클릭 후 드래그 후 메소드 영역 활성화 후 연결
    @IBAction func clickBtn03(_ sender: Any){
        
    }//end of clickBtn03()
    
    
}//end of class

