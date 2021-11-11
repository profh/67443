// Created for 443App on 11/10/21 
// Using Swift 5.0 
// Running on macOS 11.6
// Qapla'
//

import Foundation
import SwiftUI

class UserPins: ObservableObject {
  
  var forUser: User
  @Published var allPins = [MemoryPin]()
  
  init(forUser: User, allPins: Array<MemoryPin> = []) {
    self.forUser = forUser
    self.allPins = allPins
  }
  
  func savePin(title: String , description: String, addressStreet: String, addressCity: String, addressState: String, addressZip: String, location: Location, tags: Array<Tag>, imagePath: String? = nil, date: Date) {
    
    let newPin = MemoryPin(title: title, description: description, addressStreet: addressStreet, addressCity: addressCity, addressState: addressState, addressZip: addressZip, location: location, tags: [], date: date)
    
    self.allPins.append(newPin)
    // print("Pin count now \(self.allPins.count)")
  }
  
  func getPins()-> [MemoryPin]{
    return allPins
  }
  
  // Just for demo purposes; has no use in production
  func setRandomPin() {
    let loc = Location()
    let vlat = Double(Int.random(in: 1..<100))/500.0
    let vlon = Double(Int.random(in: 1..<100))/500.0

    loc.latitude = 40.452609 + vlat
    loc.longitude = -79.946401 + vlon
    print(loc.latitude)
    print(loc.longitude)
    let tag = Tag(name: "Fred", color: "Yellow")
    let tagArr: [Tag] = [tag]
    self.savePin(title: "Fredness", description: "description", addressStreet: "street", addressCity: "city", addressState: "PA", addressZip: "15213", location: loc, tags: tagArr, date: Date())
  }
}
