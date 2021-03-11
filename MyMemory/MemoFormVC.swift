//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by suding on 2021/03/11.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
    UITextViewDelegate{

    var subject: String!
    
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    
    
    @IBAction func save(_ sender: Any) {
    }
    
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.preview.image = info[.editedImage] as? UIImage
        picker.dismiss(animated: false)
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
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
