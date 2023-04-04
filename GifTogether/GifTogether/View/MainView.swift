//
//  MainView.swift
//  GifTogether
//
//  Created by 이원빈, 이은찬 on 2023/03/17.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .home
    @StateObject private var homeViewModel = DIContainer().makeHomeViewModel()
    @StateObject private var myPageViewModel = DIContainer().makeMyPageViewModel()
    
    @Binding var logout: Bool
    enum Tab {
        case home
        case search
        case favorite
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .environmentObject(homeViewModel)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tab.home)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Tab.search)

            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(Tab.favorite)

            ProfileView(isMainViewPresented: $logout)
                .environmentObject(myPageViewModel)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
                .tag(Tab.profile)
        }
        .onAppear {
            myPageViewModel.fetchUserInfo()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(logout: .constant(true))
    }
}