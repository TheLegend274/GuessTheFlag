//
//  ContentView.swift
//  Project2
//
//  Created by Mathew Sabu on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = " "
    @State private var totalScore = 0
    @State private var AmountOfTries = 10
    
    // array of all the countries
   @State private var countries = ["Estonia", "France", "Germany", "Ireland","Italy","Nigeria","Poland","Russia","Spain","UK", "US"].shuffled()
    
   // picks the first 3 of the array
   @State private var correctCountry = Int.random(in: 0...2) // picks the country
    var body: some View {
        ZStack{
            // changes the background color
            RadialGradient(stops:[
                .init(color: Color(red:0.1, green:0.2, blue:0.45), location: 0.30),
                .init(color: Color(red:0.76, green:0.15, blue:0.26), location:0.30)
            ], center: .top, startRadius:200, endRadius: 700)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess The Flag Game")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    
                VStack(spacing: 15){ // spaces 15 from each flag
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary) // makes it gray ish
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctCountry]).font(.largeTitle.weight(.semibold))
                        
                    }
                    ForEach(0..<3){number in
                        Button{
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                // shape of the flags
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("Score:\(totalScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message:{
                Text("Your score is \(totalScore)")
        }
        
        
        
    }
    
    
    func flagTapped(_ number:Int){
        if number == correctCountry{
            scoreTitle = "Correct"
            totalScore += 1
        }
        else{
            scoreTitle = "Wrong"
             
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctCountry = Int.random(in: 0...2)
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
