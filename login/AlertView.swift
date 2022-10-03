//
//  AlertView.swift
//  login
//
//  Created by Alessandre Livramento on 29/09/22.
//

import SwiftUI

struct AlertView: View {
    @State var anime = false
    
    @Binding var alertView: Bool
    @Binding var authorized: Bool
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: authorized ? "checkmark.shield": "exclamationmark.shield")
                    .font(.system(size: 70))
                    .foregroundColor(Color("foreground_alert"))
                    .padding(.bottom, 1)
                
                Text(authorized ? "Autorizado" : "Não autorizado!")
                    .font(.system(size: 16).bold())
                    .foregroundColor(Color("foreground_alert"))
                    .padding(.bottom, 1)
                
                Text(authorized ? "Seu acesso foi autorizado.": "Verifique os seus dados de acesso.")
                    .font(.system(size: 16))
                    .frame(width: 200)
                    .foregroundColor(.gray)
                
                    .multilineTextAlignment(.center)
            }
            .frame(width: 230, height: 200)
            .background(Color("background_alert"))
            .opacity(0.9)
            .cornerRadius(6)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotation3DEffect(.degrees(anime ? 360 : 0), axis: (0, 1, 0))
            .onAppear() {
                withAnimation {
                    self.anime.toggle()
                }
            }
        }
        .onTapGesture {
            self.alertView.toggle()
            
            if authorized {
                self.authorized.toggle()
            }
        }
    }
}
struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(alertView: .constant(false), authorized: .constant(false))
    }
}
