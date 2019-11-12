//
//  PhotoEditViewController.swift
//  PhotoLetter
//
//  Created by Yebin Kim on 2019/10/25.
//  Copyright © 2019 김예빈. All rights reserved.
//

import UIKit

final class PhotoEditViewController: UIViewController {
    
    var letter = Letter()
    let picker = UIImagePickerController()
    
    @IBOutlet var ratioView: UIView!
    @IBOutlet var photoView: UIImageView!
    @IBOutlet var photoTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        photoTabBar.delegate = self
        
        ratioView.clipsToBounds = true
        
        photoView.isUserInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture))
        photoView.addGestureRecognizer(panGesture)
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        photoView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        photoView.center = CGPoint(x: photoView.center.x + translation.x, y: photoView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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

extension PhotoEditViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 0) {
            let alert =  UIAlertController(title: "", message: "배경으로 사용할 사진을 선택해주세요", preferredStyle: .actionSheet)
            
            let library =  UIAlertAction(title: "앨범", style: .default) { (action) in self.openLibrary()
            }
            
            let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
                self.openCamera()
            }
            
            let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            alert.addAction(library)
            alert.addAction(camera)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            
        } else if(item.tag == 1) {
            print("ratio")
        } else if(item.tag == 2) {
            print("filter")
        } else if(item.tag == 3) {
            print("rotate")
        }
    }
}

extension PhotoEditViewController: UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else {
            print("Camera not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            photoView.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
