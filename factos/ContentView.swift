//
//  ContentView.swift
//  factos
//
//  Created by Alejandro on 21/03/25.
//

import SwiftUI
import FirebaseAnalytics

struct ContentView: View {
    var body: some View {
        Text("Hola Firebase")
            .onAppear {
                Analytics.logEvent("pantalla_abierta", parameters: [
                    "origen": "debug"
                ])
            }
    }
}

#Preview {
    ContentView()
}
