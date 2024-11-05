//
//  MealImageView.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import SwiftUI

struct MealImageView: View {
    let imageURL: String
    
    init(urlString: String?) {
        self.imageURL = urlString ?? ""
     }
        
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(Dimensions.fifteen)
                    .clipped()
            case .failure:
                Image(uiImage: MealImageView.defaultImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            @unknown default:
                Image(uiImage: MealImageView.defaultImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: Dimensions.oneHundred, height: Dimensions.oneHundredForty)
        .clipped()
    }
    
    static var defaultImage = UIImage(named: "img_Placeholder") ?? UIImage()
}
