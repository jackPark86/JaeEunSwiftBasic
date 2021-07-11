//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by icoinnet on 2021/07/10.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO! //목록 화면에서 전달하는 영화 정보를 받을 변수
   
    //뷰가 처음 메모리에 로드될 때 호출되는 메소드
    override func viewDidLoad() {
        NSLog("linkurl = \(self.mvo.detail!), title = \(self.mvo.title!)")
        //WKNavigationDelegate의 델리게이트 객체를 지정
        self.wv.navigationDelegate = self
        
        //네비게이션 바의 타이틀에 영화명을 출력한다.
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        if let url = self.mvo.detail {
            //URLRequest 인스턴스를 생성한다.
            if let urlObj = URL(string: url){
                let req = URLRequest(url: urlObj)
                
                //loadRequest 메소드를 호출하면서 req를 인자값으로 전달한다.
                self.wv.load(req)
                
            }else{ //URL 형식이 잘못되었을 경우에 대한 예외처리
                //경고창 형식으로 오류 메시지를 표시해준다.
                showAlert(title: "오류", message: "잘못된 URL입니다")
            }//end of if ~ else
            
        } else { // URL 값이 전달되지 않았을 경우에 대한 예외처리
          showAlert(title: "오류", message: "필수 파라미터가 누락되었습니다,")
        }//end of if ~ else
        
    
    }//end of viewDidLoad()
    
    
    private func showAlert(title: String, message: String){
        //경고창 형식으로 오류 메시지 표실해준다.
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
            //이전 페이지로 되돌려보낸다.
            _ = self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }//end of showAlert
    
}//end of class


// MARK:- WKNavigationDelegate 프로토콜 구현
//프로토콜을 구현할 때에는 본래의 클래스에 코드를 추가하기보다 익스텐션 구문을 활용하는 것이 유지보수 측면에서 더 낫다.
extension DetailViewController: WKNavigationDelegate {
    
    //웹뷰가 웹 콘텐츠를 받기 시작할 때 호출되는 메서드
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()//인디케이터 뷰의 애니메이션을 실행
    }//end of webView
    
    
    //웹뷰가 콘텐츠 로딩을 완전히 마쳤을 때 호출되는 메소드
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating() //인디케이터 뷰의 애니메이션을 중단
    }//end of webview
    
    //웹뷰가 콘텐츠 로딩이 실패했을 때 호출되는 메소드
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating() //인디케이터 뷰의 애니메이션을 중단
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            //버튼 클릭 시, 이전 화면으로 되돌려 보낸다.
            _ = self.navigationController?.popViewController(animated: true)
        }
    }//end of webView
    
    //잘못된 URL 또는 네트워크가 정상적이지 않아서 웹 페이지를 불러오지 못할 때 호출되는 메소드
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating() //인디케이터 뷰의 애니메이션을 중단
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            //버튼 클릭 시, 이전 화면으로 되돌려 보낸다.
            _ = self.navigationController?.popViewController(animated: true)
        }
    }//end of webView
    
}//end of extension DetailViewController

// MARK:- 심플한 경고창 함수 정의용 익스텐션
//UIViewController에 대한 확장이기 때문에, 어디에라도 작성해 두기만 하면 UIViewController 클래스를 상속받은 모든 뷰 컨트롤러에서 사용이 가능
extension UIViewController {
    
    func alert(_ message: String, onClick: (() -> Void)? = nil){
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }//end of alert
}//end of extension UIViewController
