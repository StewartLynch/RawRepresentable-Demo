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

enum SkillLevel: String, Identifiable, CaseIterable, Codable {
    var id: Self { self }
    case beginner
    case novice
    case intermediate
    case advanced
    case expert
    case master
    case guru
}
