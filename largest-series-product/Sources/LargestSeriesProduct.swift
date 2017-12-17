typealias NumberSeries = String

extension NumberSeries {
    enum NumberSeriesError: Error {
        case negativeSpan, spanLongerThanStringLength, invalidCharacter
    }
    
    func largestProduct( _ digits: Int ) throws -> Int {
        if self == "" && digits == 0 { return 1 }
        if digits < 0                { throw NumberSeriesError.negativeSpan }
        if digits > self.count       { throw NumberSeriesError.spanLongerThanStringLength }
        if self.badChars != 0        { throw NumberSeriesError.invalidCharacter }
        
        return self.products( ofDigits: digits ).largest
    }
    
    func products( ofDigits digits: Int ) -> [ Int ] {
        return self.slices( ofDigits: digits ).map { $0.product }
    }
    
    var product: Int { return self.reduce( 1 ) { $0 * Int( String( $1 ) )! } }
    
    func slices( ofDigits digits: Int ) -> [ String ] {
        let at = { self.index( self.startIndex, offsetBy: $0 ) }
        
        return self.enumerated().reduce( [ String ]() ) {
            $1.offset + digits > self.count ? $0 :
                $0 + [ String( self[ at( $1.offset ) ..< at( $1.offset + digits ) ] ) ]
        }
    }
    
    var badChars: Int { return self.map { Int( String( $0 ) ) }.filter { $0 == nil }.count }
}

extension Array where Iterator.Element == Int {
    var largest: Int { return self.reduce( 0 ) { $1 > $0 ? $1 : $0 } }
}

