//
//  RegisterEmailView.swift
//  factos
//
//  Created by Alejandro on 25/03/25.
//

import SwiftUI

struct RegisterEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var textFieldEmail: String = ""
    @State private var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            
            DismissView()
            Group {
                Text("Register")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .font(.largeTitle)
            .tint(.primary)
            Spacer()
            Group {
                Label("Ingresa correo electrónico", systemImage: "envelope.fill")
                TextField("Ingresa tu correo electrónico", text: $textFieldEmail)
                    .padding(.vertical, 20)
                Label("Ingresa una contraseña", systemImage: "lock.fill")
                TextField("Ingresa tu contraseña", text: $textFieldPassword)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 10)
            Spacer()
            Button {
                authenticationViewModel.createNewUser(email: textFieldEmail, password: textFieldPassword)
            } label: {
                Label("Registrarse", systemImage: "arrow.right.circle")
            }
            .padding(.top, 18)
            .buttonStyle(.bordered)
            .tint(.blue)

            if let messageError = authenticationViewModel.messageError {
                Text(messageError)
                    .bold()
                    .font(.body)
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
}

#Preview {
    RegisterEmailView(authenticationViewModel: AuthenticationViewModel())
}
