//
//  AddAccidentViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 30/03/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift
import YPImagePicker

class AddAccidentsViewController: UIViewController, UINavigationControllerDelegate, MapDelegate, UITextFieldDelegate {
    
    let newAccident = Accident()
    var imagesDirectoryPath: String!
    var images = [UIImage()]
    
    @IBOutlet weak var accidentDescriptionTextField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var numeSoferTextField: UITextField!
    @IBOutlet weak var telefonSoferTextField: UITextField!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var scrollVIew: UIScrollView!
    
    
    override func viewDidLoad() {
        
        //scrollVIew.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height+100)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        accidentDescriptionTextField!.layer.borderWidth = 1
        accidentDescriptionTextField!.layer.borderColor = UIColor.black.cgColor
        accidentDescriptionTextField.text = ""
        
        numeSoferTextField!.layer.borderWidth = 1
        numeSoferTextField!.layer.borderColor = UIColor.black.cgColor
        
        telefonSoferTextField!.layer.borderWidth = 1
        telefonSoferTextField!.layer.borderColor = UIColor.black.cgColor
        
        self.numeSoferTextField.delegate = self
        self.telefonSoferTextField.delegate = self
        
    }
    
    @IBAction func pressedClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addMapCoordinates(_ sender: Any) {
        let mapViewController = storyboard?.instantiateViewController(withIdentifier: "mapView") as! MapViewController
        mapViewController.delegate = self
        present(mapViewController, animated: true, completion: nil)
    }
    
    func mapDataChanged(latitude: Double, longitude: Double) {
        mapButton.setTitle("Poziție selectata", for: .normal)
        newAccident.Latitude = latitude
        newAccident.Longitude = longitude
    }
    
    
    @IBAction func addPhotos(_ sender: Any) {
        var config = YPImagePickerConfiguration()
        config.library.mediaType = .photo
        config.library.maxNumberOfItems = 10
        config.showsFilters = false
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    self.images.append(photo.originalImage)
                case .video( _):
                    print("Videos not supported yet")
                }
            }
            if(self.images.count > 1)
            {
                self.photoButton.setTitle("Poze adaugate", for: .normal)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func pressedAdd(_ sender: AnyObject) {
        
        numeSoferTextField.layer.borderColor = UIColor.black.cgColor
        telefonSoferTextField.layer.borderColor = UIColor.black.cgColor
        
        guard !accidentDescriptionTextField.text!.isEmpty
            else {
                let alert = UIAlertController(title: "Descrierea nu poate lipsi", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
        }
        
        guard !numeSoferTextField.text!.isEmpty
            else {
                let alert = UIAlertController(title: "Nu ați completat datele șoferului", message: nil, preferredStyle: .alert)
                let myColor = UIColor.red
                numeSoferTextField.layer.borderColor = myColor.cgColor
                numeSoferTextField.layer.borderWidth = 1.0
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
        }
        
        guard !telefonSoferTextField.text!.isEmpty
            else {
                let alert = UIAlertController(title: "Nu ați completat datele șoferului", message: nil, preferredStyle: .alert)
                let myColor = UIColor.red
                telefonSoferTextField.layer.borderColor = myColor.cgColor
                telefonSoferTextField.layer.borderWidth = 1.0
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
        }
        
        newAccident.Descriere = accidentDescriptionTextField.text!
        newAccident.Data = datePicker.date
        newAccident.NumeSofer = numeSoferTextField.text!
        newAccident.TelefonSofer = telefonSoferTextField.text!
        
        if(images.count > 1)
        {
            for i in 1...(images.count-1){
                //print(images[i])
                newAccident.ImagesData.append(images[i].jpegData(compressionQuality: 1)!)
            }
        }
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newAccident)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}


