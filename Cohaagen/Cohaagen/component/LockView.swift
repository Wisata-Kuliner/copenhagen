//
//  ContentView.swift
//  TriggerSliderExample
//
//  Created by Dominik Butz on 6/11/2021.
//

import SwiftUI
import TriggerSlider
import Neumorphic

struct LockView: View {
    
    @StateObject var dataModel = DataModel()
    
    @State private var simpleRightDirectionSliderOffsetX: CGFloat = 0
    @State private var simpleLeftDirectionSliderOffsetX: CGFloat = 0
    @State private var rectangularSliderOffsetX: CGFloat = 0
    @State private var  neumorphicSliderOffsetX: CGFloat = 0
    
    @State private var alertPresented: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    @State private var chromaShift = false

    var body: some View {
        VStack {
            
            Text("Cohaagen Application")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .hueRotation(.degrees(chromaShift ? 0: 720))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: true), value: chromaShift)
                .onAppear() {
                    self.chromaShift.toggle()
                }
            
            VStack {
                // Neumorphic
                TriggerSlider(sliderView: {
                    Circle().fill(Color.Neumorphic.main)
                        .softOuterShadow(offset:4, radius: 3)
                        .overlay(Image(systemName: "chevron.right").font(.system(size: 25)).foregroundColor(.white))
                }, textView: {
                    Text("Slide to Unlock").foregroundColor(Color.Neumorphic.secondary)
                },
                backgroundView: {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.Neumorphic.main)
                        .softInnerShadow(RoundedRectangle(cornerRadius: 30))
                }, offsetX: self.$neumorphicSliderOffsetX,
                  didSlideToEnd: {
                    print("Triggered left direction slider!")
                    self.alertPresented = true
                    self.simpleLeftDirectionSliderOffsetX = 0
                    self.simpleRightDirectionSliderOffsetX = 0
                    self.rectangularSliderOffsetX = 0
                    self.neumorphicSliderOffsetX = 0
                }, settings: TriggerSliderSettings(sliderViewVPadding: -5, slideDirection: .right)).padding(.vertical, 10).padding(.horizontal, 20)
                
            }.frame(maxHeight: 300)
            
            Spacer()
            
        }.background(Color.Neumorphic.main)
            .onChange(of: self.colorScheme) { newValue in
                print("color scheme changed to \(newValue)")
                Color.Neumorphic.colorSchemeType = newValue == .dark ? .dark : .light
            }.navigate(to:  NavigationView {
                GridView()
            }
            .environmentObject(dataModel)
            .navigationViewStyle(.stack), when: $alertPresented)

    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
