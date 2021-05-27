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
    // 커넥션 인스펙터 탭을 이용하여 Referencing Outlets 영역 원을 클릭 후 마우스 드래그 후 변수 생성
    @IBOutlet var uiTitle02: UILabel!
    
    //ViewController에 직접 입력 후 원을 클릭해서 연결
    @IBOutlet var uiTitle03: UILabel!
    
    //우선 변수부터 클래스에 작성 후 커넥션 인스펙터 탭에 원을 드래그해 인터페이스 빌더 라벨 오브젝트에 연결
    @IBOutlet var uiTitle04: UILabel!
    
    //문서 개요창을 열고 control 키와 마우스 드래그 후 변수 생성한다
    @IBOutlet var uiTitle05: UILabel!
    
    
    /**
            뷰의 로딩이 완료되었을 때 시스템에 의해 자동으로 호출됨.
        따라서 일반적으로 리소스를 초기화하거나 초기 화면을 구성하는 등, 처음 한 번만 실행해야 하는 초기화 코드는 대부분 이 메소드 내부에 작성하면 됨
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }//end of viewDidLoad()


    
    @IBAction func clickBtn01(_ sender: Any) {
        //Button01이 클릭되었을 때 Label01의 텍스트를 변경함
        self.uiTitle01.text = "Button01 Clicked"
    }//end of clickBtn01()
        
    @IBAction func clickBtn02(_ sender: Any) {
        //Button02이 클릭되었을 때 Label02의 텍스트를 변경함
        self.uiTitle02.text = "Button02 Clicked"
    }//end of clickBtn02()
    
    //인터페이스 빌더 객체 클릭 후 드래그 후 메소드 영역 활성화 후 연결
    @IBAction func clickBtn03(_ sender: Any){
        self.uiTitle03.text = "Button03 Clicked"
    }//end of clickBtn03()
    
    //메소드부터 클래스 작성 후 커넥션 인스펙터 탭에서 원들 드래그해 인터페이스 빌더 버튼 오브젝트에 연결
    @IBAction func clickBtn04(_ sender: Any){
        self.uiTitle04.text = "Button04 Clicked"
    }//end of clickBtn04()
    
    
    //문서 개요창을 열고 control 키와 마우스 드래그 후 메소드 생성
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "Button05 Clicked"
    }//end of clickBtn05()
    
}//end of class

