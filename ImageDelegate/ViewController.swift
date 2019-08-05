//
//  ViewController.swift
//  ImageDelegate
//
//  Created by Yolanda H. on 2019/8/5.
//  Copyright © 2019 Yolanda H. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var buttonImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func photopicker(){
        let photoController = UIImagePickerController()
        photoController.delegate = self
        photoController.sourceType = .photoLibrary
        present(photoController, animated: true, completion: nil)
    }
    func camera(){
        let cameraController = UIImagePickerController()
        cameraController.delegate = self
        cameraController.sourceType = .camera
        present(cameraController, animated: true, completion: nil)
    }
    @IBAction func ImageButton(_ sender: UIButton) {
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "開啟相機拍照", style: .default) { (_) in
            self.camera()
        }
        let libraryAction = UIAlertAction(title: "從相簿中選擇", style: .default) { (_) in
            self.photopicker()
        }
        let deleteAction = UIAlertAction(title: "刪除", style: .destructive) { (_) in
            sender.setImage(UIImage(named: "user"), for: .normal)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(cameraAction)
        controller.addAction(libraryAction)
        controller.addAction(deleteAction)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        buttonImage.setImage(image, for: .normal)
        dismiss(animated: true, completion: nil)
    }

}

