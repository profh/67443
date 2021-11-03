//
//  ContentView.swift
//  app
//
//  Created by Neha Joshi on 9/28/21.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel = ViewModel()
  @ObservedObject var viewController = ViewController()
  
  @State private var showingAlert = false
    var body: some View {
  
      BottomBar(viewModel: viewModel, viewController: viewController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


