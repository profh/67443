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
  @EnvironmentObject var viewModel: ViewModel
  
//  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
//    print("UPDATING UI VIEW")
//    print("SAMPLE USER PIN COUNT: \(viewModel.sampleUser.allPins.count)")
//    let user = viewController.currLocation
//    user.loadLocation()
//
    //uiView.showsUserLocation = true
    
    
//    let coordinate = CLLocationCoordinate2D(latitude: viewController.currLocation.latitude, longitude: viewController.currLocation.longitude)
//
//
//    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//    let region = MKCoordinateRegion(center: coordinate, span: span)
//    uiView.setRegion(region, animated: true)
//
//    //need to flush all annotations at start of update UI view
//    for memory in viewModel.sampleUser.allPins{
//      print("MAKING PINS NOW")
//      let droppedPin = MKPointAnnotation()
//      droppedPin.coordinate = CLLocationCoordinate2D(
//        latitude: memory.location.latitude ,
//        longitude: memory.location.longitude
//      )
//      droppedPin.title = memory.title
//      uiView.addAnnotation(droppedPin)
//
//    }
    
//  }

//  func makeUIView(context: Context) -> MKMapView {
//    print("MAKING VIEW")
//
//
//    let mapView = MKMapView(frame: .zero)
//    let user = viewController.currLocation
//    user.loadLocation()
//
//
//    for memory in viewModel.sampleUser.allPins{
//      let droppedPin = MKPointAnnotation()
//      droppedPin.coordinate = CLLocationCoordinate2D(
//        latitude: memory.location.latitude ,
//        longitude: memory.location.longitude
//      )
//      droppedPin.title = memory.title
//      mapView.addAnnotation(droppedPin)
//
//    }
//
//    return mapView
//  }
   
  @State var coordinateRegion = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 40.442609, longitude: -79.946401),
    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
  
  var body: some View {
    Map(coordinateRegion: $coordinateRegion, annotationItems: viewModel.sampleUser.allPins) { place in
      MapMarker(coordinate: place.location.coordinates, tint: .green)
    }.edgesIgnoringSafeArea(.all)
  }
  
}
  


