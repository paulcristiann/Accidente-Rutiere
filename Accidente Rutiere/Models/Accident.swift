//
//  Accident.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 30/03/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import Foundation
import RealmSwift
import MapKit

class Accident: Object {
    
    @objc dynamic var NumeSofer = ""
    @objc dynamic var TelefonSofer = ""
    @objc dynamic var Data = Date()
    @objc dynamic var Descriere = ""
    @objc dynamic var Latitude = 0.0
    @objc dynamic var Longitude = 0.0
    var ImagesData: List<Data> = List<Data>()
}
