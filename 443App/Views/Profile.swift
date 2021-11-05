//
//  ProfileHeader.swift
//  443App
//
//  Created by Claudia Osorio on 10/31/21.
//
 
import Foundation
import SwiftUI
 
struct Profile: View {
  
  @StateObject var viewModel: ViewModel
  
  var body: some View {
    
    NavigationView {
      VStack {
        Text("VM Pin Count: \(viewModel.sampleUser.allPins.count)")
        Text("last pin lat: \(Double(viewModel.sampleUser.allPins.last?.location.latitude ?? 0.0))")
        Text("last pin lon: \(Double(viewModel.sampleUser.allPins.last?.location.longitude ?? 0.0))")
      }
      .navigationBarItems(trailing: Button(action: {
        let loc = Location()
        let vlat = Double(Int.random(in: 1..<100))/100.0
        let vlon = Double(Int.random(in: 1..<100))/100.0

        loc.latitude = 40.452609 + vlat
        loc.longitude = -79.946401 + vlon
        print(loc.latitude)
        print(loc.longitude)
        let tag = Tag(name: "Fred", color: "Yellow")
        let tagArr: [Tag] = [tag]
        if #available(iOS 15, *) {
          self.viewModel.savePin(title: "Fredness", description: "description", addressStreet: "street", addressCity: "city", addressState: "PA", addressZip: "15213", location: loc, tag: tagArr, date: Date.now)
          print(viewModel.sampleUser.allPins.count)
        } else {
          // Fallback on earlier versions
        }
      }) {
          Image(systemName: "plus")
          Text("Add")
      })
    }
  }
}
