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
    
    @State var colorRed: Double = 0.2
    @State var colorGreen: Double = 0.4
    @State var colorBlue: Double = 0.25
     
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
                
                ZStack {
                    // 背景矩形
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .shadow(color: Color(red: 1.0 - max(colorRed, max(colorGreen, colorBlue)), green: 1.0 - max(colorRed, max(colorGreen, colorBlue)), blue: 1.0 - max(colorRed, max(colorGreen, colorBlue)), opacity: 0.25), radius: 16, x: 0, y: 8)
                    VStack {
                        HStack {
                            Image(systemName: "r.circle")
                                .foregroundColor(Color.red.opacity(0.5))
                                .font(.system(size: 20))
                            Slider(value: $colorRed, in: 0.0 ... 1.0)
                                .accentColor(Color.red.opacity(colorRed))
                            Image(systemName: "r.circle.fill")
                                .foregroundColor(Color.red)
                                .font(.system(size: 24))
                        }
                        .padding(.top, 4)
                        .padding()
                        
                        HStack {
                            Image(systemName: "g.circle")
                                .foregroundColor(Color.green.opacity(0.5))
                                .font(.system(size: 20))
                            Slider(value: $colorGreen, in: 0.0 ... 1.0)
                                .accentColor(Color.green.opacity(colorGreen))
                            Image(systemName: "g.circle.fill")
                                .foregroundColor(Color.green)
                                .font(.system(size: 25))
                                .accentColor(Color.blue.opacity(colorBlue))
                        }
                        .padding(.top, 2)
                        .padding(.bottom, 2)
                        .padding()
                        
                        HStack {
                            Image(systemName: "b.circle")
                                .foregroundColor(Color.blue.opacity(0.5))
                                .font(.system(size: 20))
                            Slider(value: $colorBlue, in: 0.0 ... 1.0)
                            Image(systemName: "b.circle.fill")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 25))
                        }
                        .padding(.bottom, 4)
                        .padding()
                    }
                }
                .padding(.all, 8)
                .frame(height: 240)
                
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
                .padding(.bottom, 44)
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
        
        // setting
        var setting = BurstSetting()
        setting.isDefault = false
        setting.backgroundColor = UIColor(red: CGFloat(colorRed), green: CGFloat(colorGreen), blue: CGFloat(colorBlue), alpha: 1.0)
        setting.shadowColor = .black
        setting.titleColor = .white
        setting.subtitleColor = UIColor(hex: 0xEFEFEF)
        
        let burst = Burst(
            title: title,
            subtitle: subtitle,
            icon: icon,
            action: .init(icon: btnIcon, handler: {
                Bursts.hide()
            }),
            position: iposition,
            duration: .seconds(duration),
            setting: setting
            )
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
