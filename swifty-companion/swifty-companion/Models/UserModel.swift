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

struct UserCursus: Decodable {
    let grade: String?
    let level: Double?
    let skills: [Skill]
    let blackholed_at: String?
    let id: Int?
    let begin_at: String?
    let end_at: String?
    let cursus_id: Int?
    let has_coalition: Bool?
    let created_at: String?
    let updated_at: String?
    let user: User?
    let cursus: Cursus?
}

struct Skill: Decodable {
    let id: Int?
    let name: String?
    let level: Double?
}

struct Cursus: Decodable {
    let id: Int?
    let created_at: String?
    let name: String?
    let slug: String?
    let kind: String?
}


struct ProjectEvaluation: Decodable {
    let id: Int?
    let occurrence: Int?
    let final_mark: Int?
    let status: String?
    let validated: Bool?
    let current_team_id: Int?
    let project: ProjectDetails?
    let cursus_ids: [Int]
    let user: ProjectUser?
    let teams: [Team]
}

struct ProjectDetails: Decodable {
    let id: Int?
    let name: String?
    let slug: String?
    let parent_id: Int?
}

struct ProjectUser: Decodable {
    let id: Int?
    let login: String?
    let url: String?
}

struct TeamUser: Decodable {
    let id: Int?
    let login: String?
    let url: String?
    let leader: Bool?
    let occurrence: Int?
    let validated: Bool?
    let projects_user_id: Int?
}

struct Team: Decodable {
    let id: Int?
    let name: String?
    let url: String?
    let final_mark: Int?
    let project_id: Int?
    let created_at: String?
    let updated_at: String?
    let status: String?
    let terminating_at: String?
    let users: [TeamUser]
    let locked: Bool?
    let validated: Bool?
    let closed: Bool?
    let repo_url: String?
    let repo_uuid: String?
    let locked_at: String?
    let closed_at: String?
    let project_session_id: Int?
}

