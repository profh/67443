//
//  BottomBar.swift
//  443App
//
//  Created by Claudia Osorio on 10/28/21.
//

import Foundation
import SwiftUI


struct BottomBar: View {
  @State var isNavigationBarHidden: Bool = true
  var viewModel = ViewModel()
  @ObservedObject var viewController = ViewController()
  
  
  var body: some View
  {
   
    TabView {
      PinView(viewModel: viewModel)
      .tabItem {
        Image(systemName: "pin.fill")
        Text("Pins")
      }
      
      MapPinsView(viewModel: viewModel, viewController: viewController)
      .tabItem {
        Image(systemName: "map.fill")
        Text("Map")
      }
      
      Profile(viewModel: viewModel)
      .tabItem {
        Image(systemName: "person.fill")
        Text("Profile")
      }
    }
//    .environmentObject(viewModel)
    
  }
}

