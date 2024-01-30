//
//  finalpjtApp.swift
//  finalpjt
//
//  Created by ryu hyunsun on 2023/09/19.
//

import SwiftUI

@main
struct finalpjtApp: App {
    let appState = AppState()
    var body: some Scene {
        WindowGroup {
            FirstView().environmentObject(appState)
        }
    }
}
