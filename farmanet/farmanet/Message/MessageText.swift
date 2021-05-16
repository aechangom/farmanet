//
//  MessageText.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation

class MessageText {
    static let shared = MessageText()
    let emptyUserMsg = "Usuario no debe estar vacío"
    let emptyPassMsg = "Contraseña no debe estar vacío"
    let succesUserandPass = "Autenticación exitosa"
    let invalidUserorPass = "Usuario o contraseña invalida"
    let networkError = "Por favor intente más tarde"
    let errorConversion = "Error al convertir el formato"
    let welcomeMsg = "Hola "
    let aceptMsg = "Aceptar"
    let errorMsg = "Error"
    let cancelMsg = "Cancelar"
}
