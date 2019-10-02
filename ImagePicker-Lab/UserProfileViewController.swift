//
//  UserProfileViewController.swift
//  ImagePicker-Lab
//
//  Created by Liana Norman on 10/2/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit
import Photos

class UserProfileViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imgOutlet: UIImageView!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    // MARK: Properties
    var userImg = UIImage() {
        didSet {
            imgOutlet.image = userImg
        }
    }
    
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        let imgPickVC = UIImagePickerController()
        imgPickVC.delegate = self
        imgPickVC.sourceType = .photoLibrary
        
        present(imgPickVC, animated: true, completion: nil)
    }
    
    // MARK: Private Methods
    
}

// MARK: Extensions
extension UserProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        self.userImg = image
        nameLabelOutlet.text = "Flower-Power"
        dismiss(animated: true, completion: nil)
    }
}
