//
//  ContentView.swift
//  L1 Demo
//
//  Created by Youngmin Gwon on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                Image("about_me")
                    .resizable()
                    .cornerRadius(15.0)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                Text("About Me")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
