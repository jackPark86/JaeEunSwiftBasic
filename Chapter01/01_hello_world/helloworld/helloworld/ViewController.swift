//
//  ViewController.swift
//  helloworld
//
//  Created by icoinnet on 2021/05/12.
//


/**
    뷰 컨트롤러를 규현한 클래스
    앱은 하나 이상의 화면을 가지는데, 이를 관리하기 위해 사용되는 것이 뷰 컨트롤러
    일반적으로 화면의 개수만큼 뷰 컨트롤러가 필요하다.
    - p17
 */
import UIKit //앱 화면을 구성하는 데에 필요한 모든 객체들이 포함된 프레임워크

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel! //아울렛 변수
    
    /**
            viewDidLoad()는 부모 클래스인 UIViewController 클래스에 정의되어 있는 메소드로, 뷰의 로딩이 완료되었을 때 시스템에 의해 자동으로 호출 됨. 따라서 일반적으로 리소스를 초기화하거나 초기 화면을 구성하는 등, 처음 한 번만 실행해야 하는 초기화 코드는 대부분 이 메소드 내부에 작성하면 됨. -p43
     */
    override func viewDidLoad() {
        // super.viewDidLoad()는 부모 클래스에 정의된 viewDidLoad() 메소드의 내용도 모두 실행한다는 의미 - p43
        super.viewDidLoad()
      
        
    
        // Do any additional setup after loading the view.
        
        
        
    }//end of viewDidLoad()


    
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, World"
        
    }//end of sayHello()
}

