//
//  LoginEmailView.swift
//  factos
//
//  Created by Alejandro on 25/03/25.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var textFieldEmail: String = ""
    @State private var textFieldPassword: String = ""
    
    var body: some View {
        Spacer()
        VStack {
            DismissView()
            Group {
                Text("Login")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .font(.largeTitle)
            .tint(.primary)
            Spacer()

            Group {
                TextField("Ingresa tu correo electrónico", text: $textFieldEmail)
                TextField("Ingresa tu contraseña", text: $textFieldPassword)
                Button {
                    print("Login")
                } label: {
                Label("Iniciar sesión", systemImage: "arrow.right.circle")
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
    }
}

#Preview {
    LoginEmailView(authenticationViewModel: AuthenticationViewModel())
}
