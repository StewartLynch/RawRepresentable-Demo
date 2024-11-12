//
//----------------------------------------------
// Original project: RawRepresentable Demo
// by  Stewart Lynch on 2024-11-11
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import Foundation

struct AppSettings: Codable {
    var name = ""
    var allowNotifications = false
    var skillLevel: SkillLevel = .beginner
    
    init() {}
    
    enum CodingKeys: CodingKey {
        case name
        case allowNotifications
        case skillLevel
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.allowNotifications = try container.decode(Bool.self, forKey: .allowNotifications)
        self.skillLevel = try container.decode(SkillLevel.self, forKey: .skillLevel)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.allowNotifications, forKey: .allowNotifications)
        try container.encode(self.skillLevel, forKey: .skillLevel)
    }
}


extension AppSettings: RawRepresentable {
    var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let appSettingsString = String(data: data, encoding: .utf8)
        else {
            return "{}"
        }
        return appSettingsString
    }
    
    init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let appSettings = try? JSONDecoder().decode(AppSettings.self, from: data)
        else {
            return nil
        }
        self = appSettings
    }
}
