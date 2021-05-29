//
//  ContentView.swift
//  SlidersBuilder
//
//  Created by Samuel Brehm on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var width: CGFloat = 0
    @State var width1: CGFloat = 15
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        
        
        VStack {
            Text("Value")
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(self.getValue(value: self.width / self.totalWidth)) - \(self.getValue(value: self.width1 / self.totalWidth))")
                .fontWeight(.bold)
                .padding(.top)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.black.opacity(0.20))
                    .frame(height: 6)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: self.width1 - self.width, height: 6)
                    .offset(x: self.width + 18)
                
                HStack(spacing: 0) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 18, height: 18)
                        .offset(x: self.width)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.location.x >= 0 && value.location.x <= self.width1 {
                                        self.width = value.location.x
                                    }
                                    
                                })
                        )
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 18, height: 18)
                        .offset(x: self.width1)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.location.x <= self.totalWidth && value.location.x >= self.width {
                                        self.width1 = value.location.x
                                    }
                                    
                                })
                        )
                }
            }
            .padding(.top, 25)
        }
        .padding()
    }
    
    private func getValue(value: CGFloat) -> String {
        return String(format: "%.2f", value)
    }
}
