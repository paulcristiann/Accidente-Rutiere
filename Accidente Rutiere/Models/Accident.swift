//
//  Accident.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 30/03/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import Foundation
import RealmSwift

class Accident: Object {
    
    @objc dynamic var Descriere = ""
    @objc dynamic var Data = Date()
    //@objc dynamic var imageData: Data =  [UIImage(named:"none")!.pngData()]
    
}
