//
//  ContentView.swift
//  StarWars_Clock
//
//  Created by Alphonso Sensley II on 11/16/20.
//

import SwiftUI

struct MainClockView: View {
    @State private var isGradient = false
    @State private var sliderValue: Float = 0.021
    @State private var isJedi: Bool = true
    @State private var scaledSize: CGFloat = 0
    @State private var clockOpacity: Double = 0
    @State private var digitalClock = Date()
    @State private var currentTimeNow = Time(hour: 0, min: 0, sec: 0)
    
    var width = UIScreen.main.bounds.width
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss z"
        return formatter
    }()
    var buttonText: String?
    var body: some View {
        ZStack {
           
            LinearGradient(gradient:Gradient(colors: isJedi ? [Color.white,Color.blue] : [Color.black,Color.gray,Color.red]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(.black)
                        .opacity(clockOpacity)
                        .frame(width: width - 60, height: width - 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color:/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    ForEach(0..<60,id: \.self) {i in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 2, height: (i % 5) == 0 ? 15 : 5)
                            .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .offset(y: (width - 90) / 2)
                            .rotationEffect(.init(degrees:Double(i) * 6 ))
                    }
                    Text("12").offset(x: 0, y: -140)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text("3").offset(x: 140, y: 0)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text("6").offset(x: 0, y: 140)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text("9").offset(x: -140, y: 0)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    //Hours Hand
                    Capsule(style: .circular)
                        .fill(Color.white)
                        .scaleEffect(scaledSize)
                        .frame(width: 7, height: (width - 240) / 2)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .orange, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .black, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .offset(y: -(width - 240) / 4)
                        .rotationEffect(Angle(degrees: Double(currentTimeNow.hour) * 30))
                    //Minutes Hand
                    Capsule(style: .circular)
                        .fill(Color.white)
                        .scaleEffect(scaledSize)
                        .frame(width: 5, height: 182)
                        .shadow(color: isJedi ? .green : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .green : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .orange, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .offset(y: -(width - 200) / 4)
                        .rotationEffect(Angle(degrees: Double(currentTimeNow.min) * 6))
                    //Seconds Hand
                    Capsule(style: .circular)
                        .fill(Color.white)
                        .scaleEffect(scaledSize)
                        .frame(width: 2, height:(width - 180) / 2)
                        .shadow(color: isJedi ? .yellow : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .yellow : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .orange, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .offset(y: -(width - 180) / 4)
                        .rotationEffect(Angle(degrees: Double(currentTimeNow.sec) * 6))
                    Circle()
                        .fill(Color.black)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                       
                        .frame(width: 20, height: 20)
                   
                }
                .onAppear(perform: {
                    withAnimation(Animation.linear(duration: 1.5)) {
                        scaledSize = 1.0
                        clockOpacity = 0.7
                    }
                    
                    let calendar = Calendar.current
                    let hour = calendar.component(.hour, from: Date())
                    let min = calendar.component(.minute, from: Date())
                    let sec = calendar.component(.second, from: Date())
                    withAnimation(Animation.linear(duration: 0.01)) {
                        self.currentTimeNow = Time(hour: hour, min: min, sec: sec)
                    }
                })
                .onReceive(timer, perform: { (_) in
                    let calendar = Calendar.current
                    let hour = calendar.component(.hour, from: Date())
                    let min = calendar.component(.minute, from: Date())
                    let sec = calendar.component(.second, from: Date())
                    withAnimation(Animation.linear(duration: 0.01)) {
                        self.currentTimeNow = Time(hour: hour, min: min, sec: sec)
                    }
                })
              Spacer()
                Button() {
                   withAnimation(.easeIn(duration:1)){
                        isJedi.toggle()
                   }
                } label: {
                    Text(isJedi ? "JEDI" : "SITH")
                        .font(.title)
                        .fontWeight(.semibold)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(LinearGradient(gradient: Gradient(colors:isJedi ? [Color.blue, Color.black] : [Color.red, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                }
                .cornerRadius(20)
                .shadow(color:isJedi ? .blue : .red, radius: 15, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
Spacer()
            }
        }
    }
}

struct Time {
    var hour: Int
    var min: Int
    var sec: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainClockView()
    }
}
