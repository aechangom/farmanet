//
//  Pharmacy.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation
struct Pharmacy: Codable {
    let date: String
    let localId: String
    let localName: String
    let comunaName: String
    let localidadName: String
    let localAddress: String
    let openingTime: String
    let closingTime: String
    let phone: String
    let lat: String
    let long: String
    let operationDay: String
    let region: String
    let comuna: String
    let localidad: String
    
    enum CodingKeys: String, CodingKey {
        case date = "fecha"
        case localId = "local_id"
        case localName = "local_nombre"
        case comunaName = "comuna_nombre"
        case localidadName = "localidad_nombre"
        case localAddress = "local_direccion"
        case openingTime = "funcionamiento_hora_apertura"
        case closingTime = "funcionamiento_hora_cierre"
        case phone = "local_telefono"
        case lat = "local_lat"
        case long = "local_lng"
        case operationDay = "funcionamiento_dia"
        case region = "fk_region"
        case comuna = "fk_comuna"
        case localidad = "fk_localidad"

        }
}
