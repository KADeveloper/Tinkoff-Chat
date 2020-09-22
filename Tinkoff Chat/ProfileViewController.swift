//
//  ProfileViewController.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 14.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}

class ProfileViewController: UIViewController {
    //IBOutlet
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var initialNameLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileDescriptionLabel: UILabel!
    @IBOutlet weak var profileSaveButton: UIButton!
    @IBOutlet weak var profileEditButton: UIButton!
    
    //Private
    private let userName: [String: String] = ["Marina": "Dudarenko"]
    private let userDescription: String = "UI/UX designer, web-designer"
    private let userLocation: String = "Moscow, Russia"
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        printInConsole(function: "\(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printInConsole(function: "\(#function)")
        
        showUIElements()
        hideInitialNameLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printInConsole(function: "\(#function)")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        printInConsole(function: "\(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        printInConsole(function: "\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printInConsole(function: "\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printInConsole(function: "\(#function)")
    }
    
    //MARK: - Private
    private func printInConsole(function: String) {
        #if DEBUG
        print("\(function)")
        #endif
    }
    
    private func showUIElements() {
        for (name, surname) in userName {
            initialNameLabel.labelSettings(textAlignment: .center, font: UIFont.systemFont(ofSize: 120, weight: .regular), textColor: UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1), numberOfLines: 1, text: "\(name.first?.uppercased() ?? "")\(surname.first?.uppercased() ?? "")", cornerRadius: profileImageView.bounds.width / 2)
            profileNameLabel.labelSettings(textAlignment: .center, font: UIFont.systemFont(ofSize: 24, weight: .bold), textColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), numberOfLines: 2, text: "\(name) \(surname)", cornerRadius: 0)
        }
        profileDescriptionLabel.labelSettings(textAlignment: .left, font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), numberOfLines: 0, text: "\(userDescription)\n\(userLocation)", cornerRadius: 0)
        profileEditButton.buttonSettings(title: "Edit", textAlignment: .center, titleType: .normal, textColor: UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), backgroundColor: .clear, cornerRadius: 0, clipsToBounds: false)
        profileSaveButton.buttonSettings(title: "Save", textAlignment: .center, titleType: .normal, textColor: UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), backgroundColor: UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1), cornerRadius: 14, clipsToBounds: true)
        
        profileImageView.imageViewSettings(cornerRadius: profileImageView.bounds.width / 2, contentMode: .scaleAspectFill, backgroundColor: UIColor(red: 228/255, green: 232/255, blue: 43/255, alpha: 1))
    }
    
    private func hideInitialNameLabel() {
        if profileImageView.image == nil {
            initialNameLabel.isHidden = false
        } else {
            initialNameLabel.isHidden = true
        }
    }
    
    //MARK: - IBAction
    @IBAction func editProfile(_ sender: UIButton) {
        if sender.tag == 1 {
            let alert = UIAlertController(title: "Edit profile", message: .none, preferredStyle: .actionSheet)
            let choosePhotoFromGalery = UIAlertAction(title: "Photo from galery", style: .default, handler: {_ in
                self.showImagePickerController(sourceType: .photoLibrary)
            })
            let choosePhotoFromCamera = UIAlertAction(title: "Make a photo", style: .default, handler: {_ in
                self.showImagePickerController(sourceType: .camera)
            })
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(choosePhotoFromGalery)
            alert.addAction(choosePhotoFromCamera)
            alert.addAction(cancelButton)
            alert.pruneNegativeWidthConstraints()
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: -
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerControllerActionSheet() {
        
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        hideInitialNameLabel()
        dismiss(animated: true, completion: nil)
    }
}
