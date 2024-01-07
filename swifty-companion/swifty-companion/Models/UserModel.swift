//
//  UserModel.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let login: String
    let first_name: String
    let last_name: String
    let usual_full_name: String
    let usual_first_name: String?
    let url: String
    let phone: String
    let displayname: String
    let kind: String
    let image: UserImage
    let correction_point: Int
    let pool_month: String
    let pool_year: String
    let location: String?
    let wallet: Int
    let anonymize_date: String
    let data_erasure_date: String
    let created_at: String
    let updated_at: String
    let alumnized_at: String?
    let cursus_users: [CursusUser]
    let projects_users: [ProjectUser]
}

struct UserImage: Codable {
    let link: String
    let versions: ImageVersions
}

struct ImageVersions: Codable {
    let large: String
    let medium: String
    let small: String
    let micro: String
}

struct CursusUser: Codable {
    let grade: String?
    let level: Double
    let skills: [Skill]
    let blackholed_at: String?
    let id: Int
    let begin_at: String
    let end_at: String?
    let cursus_id: Int
    let has_coalition: Bool
    let created_at: String
    let updated_at: String
    let cursus: Cursus
}

struct Skill: Codable {
    let id: Int
    let name: String
    let level: Double
}

struct Cursus: Codable {
    let id: Int
    let created_at: String
    let name: String
    let slug: String
    let kind: String
}

struct ProjectUser: Codable {
    let id: Int
    let occurrence: Int
    let final_mark: Int?
    let status: String
    let validated: Bool?
    let current_team_id: Int
    let project: Project
    let cursus_ids: [Int]
    let marked_at: String?
    let marked: Bool
    let retriable_at: String?
    let created_at: String
    let updated_at: String
}

struct Project: Codable {
    let id: Int
    let name: String
    let slug: String
    let parent_id: Int?
}


struct Coalition: Decodable {
    let id: Int
    let name: String
    let slug: String
    let image_url: String
    let cover_url: String
    let color: String
    let score: Int
    let user_id: Int
}
