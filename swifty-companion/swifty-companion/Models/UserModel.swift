//
//  UserModel.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let email: String?
    let login: String?
    let first_name: String?
    let last_name: String?
    let usual_full_name: String?
    let usual_first_name: String?
    let url: String?
    let phone: String?
    let displayname: String?
    let kind: String?
    let image: UserImage?
    let staff: Bool?
    let correction_point: Int?
    let pool_month: String?
    let pool_year: String?
    let location: String?
    let wallet: Int?
    let anonymize_date: String?
    let data_erasure_date: String?
    let created_at: String?
    let updated_at: String?
    let alumnized_at: String?
    let alumni: Bool?
    let active: Bool?
}

struct UserImage: Decodable {
    let link: String?
    let versions: ImageVersions?

    struct ImageVersions: Decodable {
        let large: String?
        let medium: String?
        let small: String?
        let micro: String?
    }
}
