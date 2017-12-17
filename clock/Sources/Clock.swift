//Solution goes in Sources

import Foundation

class Clock: Equatable, CustomStringConvertible {
    let asPosMins: Int
    
    init( hours: Int = 0, minutes: Int = 0 ) {
        let asMins: Int = ( 60 * hours + minutes ) % ( 24 * 60 )
        
        asPosMins = asMins > 0 ? asMins : asMins + ( 24 * 60 )
    }
    
    var description: String {
        return String(format: "%02d:%02d", asPosMins / 60 % 24, asPosMins % 60 )
    }
    
    func add( minutes: Int = 0) -> Clock {
        return Clock( minutes: asPosMins + minutes )
    }
    
    func subtract( minutes: Int = 0 ) -> Clock {
        return Clock( minutes: asPosMins - minutes )
    }

    static func ==( lhs: Clock, rhs: Clock ) -> Bool {
        return lhs.asPosMins == rhs.asPosMins
    }
}