//
//  AddAccidentViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 30/03/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit
import RealmSwift

class AddAccidentsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var accidentDescriptionTextField: UITextView!
    
    override func viewDidLoad() {
        accidentDescriptionTextField!.layer.borderWidth = 1
        accidentDescriptionTextField!.layer.borderColor = UIColor.black.cgColor
    }
    
    let newAccident = Accident()
    let imagePicker = UIImagePickerController()
    
    @IBAction func pressedClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[.originalImage] as? UIImage {
//            newAccident.imageData = pickedImage.pngData()!
//        }
//        
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func pressedAdd(_ sender: AnyObject) {
        
        guard !accidentDescriptionTextField.text!.isEmpty
            else {
                let alert = UIAlertController(title: "Descrierea nu poate lipsi", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
        }
        
        newAccident.Descriere = accidentDescriptionTextField.text!
        newAccident.Data = Date()
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newAccident)
        }
        
        dismiss(animated: true, completion: nil)
    }
}


