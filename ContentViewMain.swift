//
//  ContentView.swift
//  pirateCompass
//
//  Created by Кристина Игоревна on 17.04.2025.
//

import SwiftUI

struct ContentViewMain: View {
    @State private var angle: Double = 0;
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            //Заголовок: Compas Capitain Jack Sparrow
            Text("Compas Capitain Jack Sparrow")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(.top, 10)
            //DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.01...0.1)) {}
            Compas(angle: $angle)
            
                
            Button {
                //проверка сколько раз вращался (27-29)
                if self.angle != 0 { print("вращался уже")
                    self.angle = 0 // если вращался -> обнуляем угол вращения
                }
                self.angle += 5
                
                
                //angle = contentViewModel.angle
                contentViewModel.degreeShift()
                
            } label : {
                Text("Go")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .padding(.top, 1)
                    .foregroundColor(.white)
                    .cornerRadius(19)
                    
            }
            .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .onChange(of: self.angle){
            print("захожу и все, \(contentViewModel.angle)")
            if self.angle < contentViewModel.angle {
                
                print("работаю, \(self.angle)")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.01...0.1)) { self.angle += 5 }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.01...0.1)) { self.angle -= 5 }
            }
            
        }
    }
    
}


#Preview {
    ContentViewMain()
}
