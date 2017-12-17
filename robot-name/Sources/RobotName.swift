//Solution goes in Sources

import Foundation

struct Robot {
    var name : String = ""
    
    init() {
        resetName()
    }
    
    mutating func resetName() {
        let alphabet  : [ Character ] = Array(  "ABCDEFGHIJKLMNOPQRSTUVWXYZ" )
        let anyLetter : String        = String( alphabet[ Int( arc4random_uniform( 26 ) + 1 ) ] )
        let anyNumber : String        = String( format: "%03d", Int( arc4random_uniform( 1_000 ) ) )
        
        name                       = "\( anyLetter )\( anyLetter )\( anyNumber )"

    }
}
