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
    @State private var isJedi: Bool = false
    @State private var currentTime = Date()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss z"
        return formatter
    }()
    var buttonText: String?
    var body: some View {
        ZStack {
           
            LinearGradient(gradient:Gradient(colors: isJedi ? [Color.white,Color.blue] : [Color.gray,Color.red]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("\(currentTime, formatter: formatter)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .onReceive(timer, perform: { input in
                        currentTime = input
                    })
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(.black)
                        .opacity(0.85)
                        .frame(width: 375, height: 375, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color:/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Capsule(style: .circular)
                        .fill(Color.white)
                        .frame(width: 5, height: 182)
                        .shadow(color: isJedi ? .green : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .green : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .offset(x: 0, y: -60)
                        ///Connect Time to rotation effect
                        .rotationEffect(Angle(degrees: Double(sliderValue * 4320)))
                    Capsule(style: .circular)
                        .fill(Color.white)
                        .frame(width: 8, height: 87.5)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .orange, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .offset(x: 0, y: 53)
                        ///Connect Time to rotation effect
                        .rotationEffect(Angle(degrees: Double(sliderValue * 360)))
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 20, height: 20)
                    Text("12").offset(x: 0, y: -170)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text("3").offset(x: 170, y: 0)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text("6").offset(x: 0, y: 170)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text("9").offset(x: -170, y: 0)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .shadow(color: isJedi ? .blue : .red, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                }
                
                Slider(value: $sliderValue)
                    //.aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .accentColor(isJedi ? .blue : .red)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainClockView()
    }
}
