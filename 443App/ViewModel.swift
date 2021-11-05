//
//  ViewModel.swift
//  443App
//
//  Created by Claudia Osorio on 10/26/21.
//


import Foundation
import Photos
import SwiftUI
import UIKit
import CoreData
import Combine

//WORKING ON MAKING FUNCTIONS TO SAVE PINS AND SH!T

class ViewModel: ObservableObject {
  
  @Published var sampleUser: User = User(name: "Larry Heimann", email: "lheimann@gmail.com", allPins: [], allTags:[]) {
    willSet(allPins) {
        objectWillChange.send()
    }
  }
  
  
  let appDelegate: AppDelegate = AppDelegate()
  
  func savePin(title: String , description: String, addressStreet: String, addressCity: String, addressState: String, addressZip: String, location: Location, tag: Array<Tag>, imagePath: String? = nil, date: Date) {
    
    let newPin = MemoryPin(title: title, description: description, addressStreet: addressStreet, addressCity: addressCity, addressState: addressState, addressZip: addressZip, location: location, tag: tag, date: date)
      
    self.sampleUser.allPins.append(newPin)
  }
  
  func getPins()-> [MemoryPin]{
    return sampleUser.allPins
  }
    
}
  
  

