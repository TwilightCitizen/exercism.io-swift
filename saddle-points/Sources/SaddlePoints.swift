typealias SaddlePointsMatrix = [ [ Int ] ]

extension Array where Iterator.Element == [ Int ] {
    init( _ text: String ) { self = SaddlePointsMatrix.deserialize( from: text ) }
    
    var rows:       SaddlePointsMatrix { return self }
    var columns:    SaddlePointsMatrix { return self.transposed }
    var transposed: SaddlePointsMatrix { return self.first!.enumerated().map { ( i, v ) in self.map { $0[ i ] } } }
    
    var saddlePoints: [ [Int ] ] {
        return self.enumerated().reduce( [] ) { z, iv in let ( r, rs ) = iv
            return z + rs.enumerated().reduce( [] ) { z, iv in let ( c, v ) = iv
                return v == rows[ r ].max()! && v == columns[ c ].min()! ? z + [ [ r, c ] ] : z } }
    }
    
    static func deserialize( from text: String ) -> SaddlePointsMatrix {
        return text.split(separator: "\n").map { $0.split( separator: " " ) }.map { $0.map { Int( $0 )! } }
    }
}
