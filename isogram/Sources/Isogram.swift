import Foundation

struct Isogram {
  static func isIsogram( _ word: String ) -> Bool {
      let parsed = word.components(separatedBy: CharacterSet.letters.inverted ).joined().lowercased()
      let unique = String( Set( parsed.characters ) )
    
      return parsed.count == unique.count
  }
}
