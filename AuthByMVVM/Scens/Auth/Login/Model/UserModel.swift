//
//  UserModel.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 12/06/2021.
//
import Foundation

struct UserModelResponse : Codable {
    let value, key , msg: String?
    let data: User?
}

struct User: Codable {
    let name, phone, email, address: String?
    let lat, lng, code, userType: String?
    let deviceID, deviceType: String?
    let avatar: String?
    let date, token: String?

    enum CodingKeys: String, CodingKey {
        case name, phone, email, address, lat, lng, code
        case userType = "user_type"
        case deviceID = "device_id"
        case deviceType = "device_type"
        case avatar, date, token
    }
}

