//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Jovins on 2021/7/19.
//

import SwiftUI
import UIKit
import Bursts

struct ContentView: View {
    
    @State var title: String = "Hello Burst"
    @State var subtitle: String = "Use Bursts show alerts"
    @State var position: Int = 0
    @State var duration: TimeInterval = 2.0 // default
    @State var hasIcon: Bool = false
    @State var hasActionIcon: Bool = false
     
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 20) {
                VStack {
                    HStack {
                        Text("Title").font(.caption)
                        Spacer()
                    }
                    TextField("Title", text: $title).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack {
                    HStack {
                        Text("Subtitle").font(.caption)
                        Spacer()
                    }
                    TextField("Subtitle", text: $subtitle).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack {
                    HStack {
                        Text("Select Action").font(.caption)
                        Spacer()
                    }
                    HStack(spacing: 60) {
                        Toggle("Icon", isOn: $hasIcon)
                        Spacer()
                        Toggle("Button", isOn: $hasActionIcon)
                    }
                }
                VStack {
                    HStack {
                        Text("Position").font(.caption)
                        Spacer()
                    }
                    Picker(selection: $position, label: Text("Position")) {
                        Text("Top").tag(0)
                        Text("Bottom").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                VStack {
                    HStack {
                        Text("Duration (\(String(format: "%.1f", duration)) s)").font(.caption)
                        Spacer()
                    }
                    Slider(value: $duration, in: 0.1...10).accentColor(Color(hex: 0x66ccff))
                }
                Spacer()
                Button(action: {
                    
                    showBursts()
                }, label: {
                    Text("Show Drop")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                })
                .frame(maxWidth: .infinity)
                .background(Color(hex: 0x66ccff))
                .cornerRadius(7.5)
                .padding(.bottom, 160)
            }
            .padding()
            .padding(.top, 64)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
    private func showBursts() {
        
        UIApplication.shared.endEditing()
        let title = self.title.trimmingCharacters(in: .whitespacesAndNewlines)
        let subtitle = self.subtitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let iposition: Burst.Position = self.position == 0 ? .top : .bottom
        let icon = self.hasIcon ? UIImage(systemName: "star.fill") : nil
        let btnIcon = self.hasActionIcon ? UIImage(systemName: "arrowshape.turn.up.left") : nil
        let burst = Burst(
            title: title,
            subtitle: subtitle,
            icon: icon,
            action: .init(icon: btnIcon, handler: {
                Bursts.hide()
            }),
            position: iposition,
            duration: .seconds(duration))
        Bursts.show(burst)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension UIApplication {
   func endEditing() {
       sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}
