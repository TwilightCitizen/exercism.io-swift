//Solution goes in Sources

import Foundation

struct Scrabble {
    var word:  String
    var score: Int { return word.score }
    
    init( _ word: String? ) { self.word = word ?? "" }
    
    static func score( _ word: String? ) -> Int { return Scrabble( word ).score }
}

extension String {
    var score: Int {
        let scores: [ String: Int ] = [ "aeioulnrst": 1 , "dg": 2, "bcmp": 3
            , "fhvwy": 4, "k": 5, "jx": 8, "qz": 10 ]
        
        return self.lowercased().characters.reduce( 0 ) { ( a1, l ) in
            return a1 + scores.keys.reduce( 0 ) { ( a2, k ) in
                return a2 + ( k.contains( String( l ) ) ? scores[ k ]! : 0 )
            }
        }
    }
}
