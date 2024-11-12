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


import SwiftUI

struct ContentView: View {
//    @AppStorage("name") var name = ""
//    @AppStorage("allowNotifications") var allowNotifications = false
//    @AppStorage("skillLevel") var skillLevel: SkillLevel = .beginner
    @AppStorage("appSettings") var appSettings = AppSettings()
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $appSettings.name)
                    .textFieldStyle(.roundedBorder)
                Toggle("Allow Notifications", isOn: $appSettings.allowNotifications)
                Picker("Skill Level", selection: $appSettings.skillLevel) {
                    ForEach(SkillLevel.allCases) { skillLevel in
                        Text(skillLevel.rawValue.capitalized)
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .onAppear {
            print(URL.libraryDirectory.appending(path: "Preferences").path())
        }
    }
}

#Preview {
    ContentView()
}
