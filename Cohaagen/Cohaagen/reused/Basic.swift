//
//  Basic.swift
//  Cohaagen
//
//  Created by Bryanza Novirahman on 04/06/22.
//

import SwiftUI

struct Basic: View {
    
    @State private var slide  = false
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(width: 200, height: 40)
            .rotationEffect(.degrees(0), anchor: .trailing)
            .opacity(0.5)
            .scaleEffect(x: slide ? 0 : 1, y : 1, anchor: .trailing)
            .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false).speed(2), value: slide)
            .onAppear() {
                self.slide.toggle()
            }.alert(isPresented: $slide) {
                Alert(title: Text("Slider Action"), message: Text("Slider Action"), dismissButton: Alert.Button.cancel(Text("Reset"), action: {
                    withAnimation {
                       
                    }
                }))
            }
    }
}

struct Basic_Previews: PreviewProvider {
    static var previews: some View {
        Basic()
    }
}
