import Foundation

typealias Basis  = String
typealias Size   = Int
typealias Digit  = Int
typealias Slice  = [ Digit ]
typealias Slices = [ Slice ]

struct Series {
    private let _basis: Slice
    
    init ( _ basis: Basis ) {
        _basis = Slice( basis.map { Digit( Basis( $0 ) )! } )
    }
    
    func slices( _ size: Size ) -> Slices {
        return _basis.enumerated().reduce( Slices() ) { acc, iv in
            let i = iv.offset
            return i + size > _basis.size ? acc : acc + [ Slice( _basis[ i..<( i + size ) ] ) ]
        }
    }
}

extension Array {
    var size: Int { return self.count }
}
