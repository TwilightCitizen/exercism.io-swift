import Foundation

enum Plant: String {
    case clover   = "C"
    case grass    = "G"
    case radishes = "R"
    case violets  = "V"
    case noPlant  = "N"
}

let childNames: [ String ] =
    [ "Alice",   "Bob"
    , "Charlie", "David"
    , "Eve",     "Fred"
    , "Ginny",   "Harriet"
    , "Ileana",  "Joseph"
    , "Kincaid", "Larry" ]

class Garden {
    let childPlants: [ String: [ Plant ] ]
    
    init( _ layout: String,  children: [ String ] = childNames ) {
        let plant = Array( layout ).split( separator: "\n" ).map {
            Array( $0 ).map { Plant( rawValue: String( $0 ) )! }
        }
        
        childPlants = Dictionary( uniqueKeysWithValues:
            children.sorted().enumerated().map { ( i, v ) in
                if i > plant[ 0 ].count / 2 - 1 {
                    return ( v, [ .noPlant ] )
                } else {
                    return ( v, Array( plant[ 0 ][ i*2...i*2 + 1 ]
                                     + plant[ 1 ][ i*2...i*2 + 1 ] ) )
                }
            }
        )
    }

    func plantsForChild( _ child: String ) -> [ Plant ] {
        return childPlants[ child ] ?? [ .noPlant ]
    }
}