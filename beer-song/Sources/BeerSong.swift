//Solution goes in Sources

typealias Count = Int
typealias Song  = String

struct BeerSong {
    private var _bottles: Count
    
    init( numberOfBeerBottles: Count ) {
        _bottles = numberOfBeerBottles
    }
    
    func generateVersesOfBeerSong() -> Song {
        return Array( 0..._bottles ).reversed().map {
            let num: Count = $0

            return "\( noMore( num ).capFirst() ) bottle\( isPlural( num ) ) of beer on the wall, "
                 + "\( noMore( num ) ) bottle\( isPlural( num ) ) of beer.\n"
                 + ( num != 0 ?
                     "Take one down and pass it around, "
                   + "\( noMore( num - 1 ) ) bottle\( isPlural( num - 1 ) ) of beer on the wall.\n\n"
                   : "" )
        }.joined( separator: "" )
        + "Go to the store and buy some more, 99 bottles of beer on the wall."
    }
    
    private func noMore( _ count: Count ) -> Song {
        return count == 0 ? "no more" : Song( count )
    }
    
    private func isPlural( _ count: Count ) -> Song {
        return count == 1 ? "" : "s"
    }
}

extension String {
    func capFirst() -> String {
        return String( self[ self.startIndex ] ).uppercased()
             + String( self[ index( after: self.startIndex )..<self.endIndex ] )
    }
}
