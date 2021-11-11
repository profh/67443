// Created for 443App on 11/10/21 
// Using Swift 5.0 
// Running on macOS 11.6
// Qapla'
//

import Foundation

class Tags: ObservableObject {
  
  var user: User
  @Published var allTags = [Tag]()
  
  init(user: User , allTags: Array<Tag> = []) {
    self.user = user
    self.allTags = allTags
  }
}
