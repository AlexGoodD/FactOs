//
//  ContentView.swift
//  factos
//
//  Created by Alejandro on 21/03/25.
//

import SwiftUI
import FirebaseAnalytics

enum AuthenticationSheetView: String, Identifiable {
    case login
    case register
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        Spacer()
        VStack {
            Button {
                authenticationSheetView = .login
            } label: {
                Label("Inicia sesión con correo electrónico", systemImage: "envelope.fill")
            }
            .tint(.black)
        }
        .controlSize(.large)
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .padding(.top, 60)
        Spacer()
        HStack {
            Button {
                authenticationSheetView = .register
            } label: {
                Text("¿No tienes cuenta?")
                Text("Regístrate").underline()
            }
            .tint(.black)
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .register:
                RegisterEmailView(authenticationViewModel: authenticationViewModel)
            case .login:
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
        
}

#Preview {
    AuthenticationView(authenticationViewModel: AuthenticationViewModel())
}
