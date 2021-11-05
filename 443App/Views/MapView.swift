//
//  MapView.swift
//  443App
//
//  Created by Simran Virdi on 10/20/21.
//

//
//  MapView.swift
//  app
//
//  Created by Neha Joshi on 9/28/21.
//
import MapKit
import SwiftUI
import Combine

struct MapView: View {
  @ObservedObject var viewController: ViewController
  @StateObject var viewModel: ViewModel
  
   
  @State var coordinateRegion = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 40.442609, longitude: -79.946401),
    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
  
  var body: some View {
    NavigationView {
      Map(coordinateRegion: $coordinateRegion, annotationItems: viewModel.sampleUser.allPins) { place in
        // If you want larger ballons:
        MapMarker(coordinate: place.location.coordinates, tint: .green)
        
        // If you want the traditional pin:
        // MapPin(coordinate: place.location.coordinates)
        
        // If you want a circle to focus on the location:
        // MapAnnotation(coordinate: place.location.coordinates) {
        //   Circle()
        //     .strokeBorder(Color.red, lineWidth: 4)
        //     .frame(width: 40, height: 40)
        // }

      }
      .edgesIgnoringSafeArea(.all)
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
  


