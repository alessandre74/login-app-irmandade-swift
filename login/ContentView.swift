//
//  ContentView.swift
//  login
//
//  Created by Alessandre Livramento on 29/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    
    @State var animated = false
    @State var alertView = false
    @State var authorized = false
    @State var forgotPassword = false
    @State var alertMessage = false
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer().frame(height: 12)
                
                ///Logo
                VStack {
                    Image(systemName: "timelapse")
                        .font(.system(size: 120, weight: .ultraLight))
                        .foregroundColor(Color("Color_Button_Logo"))
                    
                    Spacer().frame(height: 10)

                    Text("irmandadeSwift")
                        .font(.system(size: 36).bold())
                    
                    Text("Você consegue! #tmj")
                        .foregroundColor(.secondary)
                        .opacity(0.6)
                }
                .padding(.bottom, 40)
                
                
                ///Inputs
                VStack {
                    TextField("Email:", text: $email)
                        .padding(15)
                        .background(Color("Color_Input"))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                    
                    if !forgotPassword {
                        SecureField("Password:", text: $password)
                            .padding(15)
                            .background(Color("Color_Input"))
                            .cornerRadius(8)
                    }
                    
                    
                }
                .padding(.bottom, 9)
                
                
                ///Button Login
                
                VStack {
                    Button {
                        if forgotPassword && !email.isEmpty {
                            alertMessage.toggle()
                            return
                        }
                        
                
                        if email.isEmpty || password.isEmpty {
                            alertView.toggle()
                        } else {
                            alertView.toggle()
                            authorized.toggle()
                        }
                        
                        
                    } label: {
                        Text(!forgotPassword ? "Login" : "Solicitar")
                            .font(.system(size: 20).bold())
                            .frame(maxWidth: .infinity, maxHeight: 38)
                    }
                    .padding(.bottom, 10)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Color_Button_Logo"))
                    
                    Button {
                        withAnimation {
                            forgotPassword.toggle()
                            password = ""
                        }
                        
                    } label: {
                        Text(!forgotPassword ? "Esqueceu a senha ?" : "Fazer login")
                            .foregroundColor(Color("Color_Button_Logo"))
                    }
                    
                }
                
                
            
                Spacer()
                
                ///Footer
                HStack {
                    Text("Não consegue acessar sua conta? ")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text("Solicite Ajuda!")
                        .font(.system(size: 14))
                        .foregroundColor(Color("Color_Button_Logo"))
                }
            }
            .padding()
            .opacity(alertView ? 0.7 : 1)
            .alert("Atenção", isPresented: $alertMessage){
                Button("Ok") {
                    email = ""
                    alertMessage.toggle()
                    
                }
            } message: {
                Text("Solicitação enviada com sucesso!")
            }
              
            
            
            if alertView {
                AlertView(alertView: $alertView, authorized: $authorized)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
