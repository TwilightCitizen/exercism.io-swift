//Solution goes in Sources

import Foundation

typealias Word  = String
typealias Words = String
typealias Count = Int
typealias Occur = [ Word: Count ]

struct WordCount {
    private let _wc: Occur
    
    init( words: Words ) {
        _wc = words.lowercased()
                   .components(separatedBy:
                        CharacterSet.alphanumerics
                                    .inverted )
                   .reduce( Occur() ) { $0.accret( $1 ) }
                   .filter { $0.key != "" }
    }
    
    func count() -> Occur {
        return _wc
    }
}

extension Dictionary where Key == Word, Value == Count {
    func accret( _ word: Word ) -> Occur {
        var occur = self
        
        occur[ word ] = 1 + ( occur[ word ] ?? 0 )
        return occur
    }
}
