//
//  B_BApp.swift
//  B&B
//
//  Created by MattiaJ03 on 12/02/24.
//

import SwiftUI

@main
struct B_BApp: App {
    var eserciziManager = EserciziManager()
    var body: some Scene {
        WindowGroup {
            ContentView(datiUtente: userData())
                .environmentObject(eserciziManager)
        }
    }
}
