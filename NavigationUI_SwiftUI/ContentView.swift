//
//  ContentView.swift
//  SwiftUITable
//
//  Created by Simon Ng on 6/9/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ZStack {
                    ArticleRow(article: article)
                    NavigationLink(
                        destination:
                        ArticleDetails(article: article),
                        label: {
                            EmptyView()
                    })
                }
                
            }
            .navigationTitle("Your Reading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
}

struct ArticleDetails: View {
    var article: Article
    @Environment(\.presentationMode) var PresentaionMode // reveal the current Presentation mode of the view.
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Group{ // Group Modifier Allow Apply certain Configuration on multiple views.
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.bottom,0)// Spacing Between Title and author
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(.max)
                    .multilineTextAlignment(.leading)
            }
            
        }
        //Customize Back Button.
        .edgesIgnoringSafeArea(.top) // Ignore Safe Area.
        .navigationBarBackButtonHidden(true) // Hide Back Button
        //Add Nav Bar Item. to Create Customize Back Button.
        .navigationBarItems(leading: Button(action: {
            PresentaionMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
        }))
    }
}
