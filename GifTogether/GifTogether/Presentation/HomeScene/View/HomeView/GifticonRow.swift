//
//  GifticonRow.swift
//  GifTogether
//
//  Created by 이은찬 on 2023/03/09.
//

import SwiftUI

struct GifticonRow: View {
    var categoryName: String
    @Binding var items: [Gifticon]

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
               
                NavigationLink {
                    GridView(gifticons: $items, title: categoryName)
                } label: {
                    Text(categoryName)
                        .font(.title)
                        .foregroundColor(Color("writeColor"))
                        .bold()
                        .padding()
                }
                .padding(.trailing)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    
                    ForEach(items, id: \.uuid) { gifticon in
                        NavigationLink {
                            DetailView(gifticon: gifticon)
                        } label: {
                            GifticonItem(gifticon: gifticon)
                        }
                        .padding()
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct GifticonRow_Previews: PreviewProvider {
    static var gifticons = [
        Gifticon.stub(),
        Gifticon.stub(),
        Gifticon.stub()
    ]
    
    static var previews: some View {
        GifticonRow(
            categoryName: "추천상품",
            items: .constant(gifticons)
        )
    }
}
