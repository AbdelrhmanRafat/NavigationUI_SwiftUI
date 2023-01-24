//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Simon Ng on 9/9/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                        Restaurant(name: "Homei", image: "homei"),
                        Restaurant(name: "Teakha", image: "teakha"),
                        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                        Restaurant(name: "Po's Atelier", image: "posatelier"),
                        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                        Restaurant(name: "Homei", image: "upstate"),
                        Restaurant(name: "Traif", image: "traif"),
                        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                        Restaurant(name: "Five Leaves", image: "fiveleaves"),
                        Restaurant(name: "Cafe Lore", image: "cafelore"),
                        Restaurant(name: "Confessional", image: "confessional"),
                        Restaurant(name: "Barrafina", image: "barrafina"),
                        Restaurant(name: "Donostia", image: "donostia"),
                        Restaurant(name: "Royal Oak", image: "royaloak"),
                        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        NavigationView
        {
            List {
                ForEach(restaurants) { restaurant in
                    //Navigation Link is a Special button detect User's touch and triggers the Navigation Presentation.
                    NavigationLink(
                        destination: RestautantDetailView(restaurant: restaurant), // Specify Destination view in Destination Paramater.
                        label: {
                            BasicImageRow(restaurant: restaurant) // Implement Cell view in the closure
                        })
                }
            }
            .navigationBarTitle("Restaurants")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct RestautantDetailView : View {
    var restaurant : Restaurant
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 300, alignment: .center)
                .clipped()
                .padding(.horizontal)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
    }
}
