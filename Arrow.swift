//
//  Arrow.swift
//  pirateCompass
//
//  Created by Кристина Игоревна on 20.04.2025.
//

import SwiftUI

struct Arrow: View {
    @State  var angle: Double = 0
    @State  var isAnimatring: Double = 0
    var body: some View {

        
        VStack() {
            //стрелка наконечник
            Path { path in
                path.move(to:CGPoint(x: 0, y: -30)) //вытянутость наконечника стрелки
                //боковые ответвления струлки
                path.addLine(to: CGPoint(x: -8, y: 0))
                path.addLine(to:CGPoint(x:8, y: 0))
            }
            .fill(Color.black)
            .frame(width: 1, height: 1)
            .rotationEffect(.degrees(angle))
            .offset(y: 10)//стрелка на конце

            Rectangle()
                .fill(Color.black)
                .frame(width: 4, height: 80)
                .rotationEffect(.degrees(angle))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: angle)  
        }
    }
    
}

#Preview {
    Arrow()
}
