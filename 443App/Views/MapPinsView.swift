// Created for 443App on 11/4/21 
// Using Swift 5.0 
// Running on macOS 11.6
// Qapla'
//

import SwiftUI

struct MapPinsView: View {
  
  @EnvironmentObject var viewModel: ViewModel
  @ObservedObject var viewController: ViewController
  
  var body: some View {
    NavigationView {
      ZStack {
        MapView(viewController: viewController)
        VStack {
          Text("VM Pin Count: \(viewModel.sampleUser.allPins.count)")
          Text("last pin lat: \(Double(viewModel.sampleUser.allPins.last?.location.latitude ?? 0.0))")
          Text("last pin lon: \(Double(viewModel.sampleUser.allPins.last?.location.longitude ?? 0.0))")
        }
        .offset(y: 100)
        NavigationLink(destination: AddPin()) {
          Text("Create")
        }
        .offset(y: 275)

      }
      .navigationBarTitle("")
      .navigationBarHidden(true)
    }
  }
}

//struct MapPinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapPinsView()
//    }
//}
