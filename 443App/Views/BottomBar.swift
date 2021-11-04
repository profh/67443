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
  @ObservedObject var viewController: ViewController
  
  var body: some View
  {
   
    TabView {
      NavigationView {
//        List {
//          ForEach(viewModel.sampleUser.allPins)
//          { pin in
//            NavigationLink(destination: PinDetail(pin: pin))
//            {
//              PinRow(pin: pin)
//            }
//          }
//        }
//        .navigationBarTitle("Pins")
//        .navigationBarItems(trailing:
//          NavigationLink(destination: AddPin()) {
//              Image(systemName: "plus")
//          }
//        )
      }
      .tabItem {
        Image(systemName: "pin.fill")
        Text("Pins")
      }
      
      
      NavigationView {
        ZStack {
          MapView(viewController: viewController)
          NavigationLink(destination: AddPin()) {
              Text("Create")
          }
          .offset(y: 275)

          }
        .navigationBarTitle("Back")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
        }
      
      
           .tabItem {
              Image(systemName: "map.fill")
              Text("Map")
            }
      
      Profile()
           .tabItem {
              Image(systemName: "person.fill")
              Text("Profile")
            }
      
      
      
    }
    .environmentObject(viewModel)
    
    
    
  }
}

