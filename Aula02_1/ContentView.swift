//
//  ContentView.swift
//  Aula02_1
//
//  Created by Turma01-15 on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var peso: Double = 0;
    @State var altura: Double = 0;
    @State var classificacao: String = "Sem classifiçao";
    @State var backgroundcolor: Color = .yellow;
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(backgroundcolor)
            
            VStack (spacing: 20){
                
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .padding(.top, 40)
                TextField("Peso", value: $peso, format: .number)
                    .frame(width: 350.0, height: 50.0)
                    .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Altura", value: $altura, format: .number)
                    .frame(width: 350.0, height: 50.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                
                Button("Calcular") {
                    let imc = peso / pow(altura, 2);
                    if(imc < 18.5){
                        backgroundcolor = .darkGreen;
                        classificacao = "Abaixo do peso!"
                    }else if(imc >= 18.5 && imc < 24.99){
                        backgroundcolor = .lightGreen;
                        classificacao = "Normal!"
                    }else if(imc >= 25 && imc < 29.99){
                        backgroundcolor = .lightOrange;
                        classificacao = "Sobrepeso"
                    }else if(imc >= 30){
                        backgroundcolor = .darkOrange;
                        classificacao = "Obeso!"
                    }
                }
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 45)
                .background(.blue)
                .cornerRadius(15)
                .foregroundColor(.white)
                
                Spacer()
                Text("\(classificacao)")
                    .font(.title);
                Spacer()
                Image("tabela-IMC")
                    .resizable()
                    .frame(width: 425, height:250)
                    .padding(.bottom, 20)
            }

        }
        .padding()
    }
}
#Preview {
    ContentView()
}
