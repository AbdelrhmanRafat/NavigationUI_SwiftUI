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
    init() {
        let navBarAppearance = UINavigationBarAppearance() // NavigationBarAppearance API Customize Navigation Bar View.
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor : UIColor.systemRed, .font : UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor : UIColor.systemBlue, .font : UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left")) // Change Back Button Image.
        UINavigationBar.appearance().tintColor = .black
        // Change Back Button Color.
        UINavigationBar.appearance().standardAppearance = navBarAppearance // Appearance of standard-Height Navigation Bar.
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance // Appearance when the edge of the scrolled content reaches the navigation Bar.
        UINavigationBar.appearance().compactAppearance = navBarAppearance //Appearance of compact height Navigation Bar.
    }
    
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
            .navigationBarTitle("Restaurants",displayMode: NavigationBarItem.TitleDisplayMode.automatic)
            // Display Mode change view of navigation Bar.
            
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
