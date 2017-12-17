//Solution goes in Sources

import Foundation

struct PhoneNumber: CustomStringConvertible {
    var parsed: [ Character ]
    let badNum: [ Character ] = Array( "0000000000" )
    
    var number: String {
        return String( parsed )
    }
    
    var areaCode: String {
        return String( parsed[ 0...2 ] )
    }
    
    var exchange: String {
        return String( parsed[ 3...5 ] )
    }
    
    var subscriber: String {
        return String( parsed[ 6...9 ] )
    }
    
    var description: String {
        return "(\( areaCode )) \( exchange )-\( subscriber )"
    }
    
    init( _ startingNumber: String ) {
        parsed = Array( startingNumber.components( separatedBy:
            CharacterSet.decimalDigits.inverted ).joined() )
        
        if parsed.count == 11 && parsed[ 0 ] == "1" {
            parsed = Array( parsed[ 1...10 ] )
        } else if parsed.count != 10 {
            parsed = badNum
        }
    }
}

