//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by suding on 2021/03/11.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
    UITextViewDelegate{

    var subject: String! // 제목 저장
    
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    
    // 저장 버튼 눌렀을때 호출되는 메소드
    @IBAction func save(_ sender: Any) {
        guard self.contents.text?.isEmpty == false else{
            let alert = UIAlertController(title: nil,
                                          message: "내용을 입력하세요!",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        
        let data = MemoData()
        data.title = self.subject // 제목
        data.contents = self.contents.text // 내용
        data.image = self.preview.image // 이미지
        data.regdate = Date() // 작성 시각
        
        // appDelegate에 있는 배열 memolist읽어온 다음에 MemoData객체 추가
        // UIApplication.shared는 UIApplication 객체의 인스터스를 참조하기위해 제공되는 타입  프로퍼티임.
        // UIApplication 객체는 우리가 직접 인스턴스를 생성할 수 없으며 위 구문처럼 유일객체를 참조하는것만 허용됨 .
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        // 작성폼 화면을 종료하고 이전 화면으로 돌아감
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 카메라 버튼 눌렀을때 호출되는 메소드
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        // 이미지 피커 컨트롤러 인스턴스의 델리게이트 속성을 현재의 뷰 컨트롤러 인스턴스로 설정
        picker.delegate = self
        // 이미지 변경 허용
        picker.allowsEditing = true
        // 이미지 피커 컨트롤러 화면에 표시
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택된 이미지를 미리보기(preview)에 출력
        self.preview.image = info[.editedImage] as? UIImage
        // 이미지 피커 컨트롤러 닫기
        picker.dismiss(animated: false)
    }
    
    
    // 사용자가 텍스트 뷰에 뭔가를 입력하면 자동으로 이 메소드 출력
    func textViewDidChange(_ textView: UITextView) {
        // 내용 최대 15자를 읽어 subject 변수에 저장하는 부분
        
        // NSString 타입으로 캐스팅
        let contents = textView.text as NSString
        let length = ( ( contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location:0, length: length))
        
        self.navigationItem.title = self.subject
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
        // Do any additional setup after loading the view.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
