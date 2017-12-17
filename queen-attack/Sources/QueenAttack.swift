class Queens {
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
    let white: Queen
    let black: Queen
    var board: Board
    
    var canAttack: Bool {
        let dist: Dist = white.dist( to: black )
        
        return dist.row == 0         // Horizontal,
            || dist.col == 0         // Vertical, and
            || dist.row == dist.col  // Diagonal
    }
    
    var description: String {
        return board.description
    }
    
    init( white: Queen = [ 0, 3 ]
        , black: Queen = [ 7, 3 ]
        , size:  Size  = [ 7, 7 ] ) throws {
        
        if !white.hasRightNumber
            || !black.hasRightNumber {
            throw InitError.incorrectNumberOfCoordinates
        }
        
        if !white.isWithin( size )
            || !black.isWithin( size ) {
            throw InitError.invalidCoordinates
        }
        
        if white == black {
            throw InitError.sameSpace
        }
        
        self.white = white
        self.black = black
        board = Board( size: size )
        
        // These,
        board[ white.row ][ white.col ] = "W"
        board[ black.row ][ black.col ] = "B"
        
        // these, and
        white.place( on: &board, asA: "W" )
        black.place( on: &board, asA: "B" )
        
        // these all work equivalently.
        board.place( white, asA: "W")
        board.place( black, asA: "B" )
    }
}

typealias Queen  = [ Int ]
typealias Dist   = [ Int ]
typealias Size   = [ Int ]
typealias Board  = [ [ String ] ]

extension Array where Iterator.Element == [ String ] {
    init(   size: Size
        , _ cellMark: String = "_" ) {
        self = ( 0...size.width ).map { row in
            ( 0...size.height ).map { col in
                cellMark
            }
        }
    }
    
    var size: Size {
        return [ self.count - 1, self[ 0 ].count - 1 ]
    }
    
    var description: String {
        return self.map {
            $0.joined( separator: " ")
        }.joined( separator: "\n" )
    }
    
    mutating func place( _ piece: Queen, asA: String ) {
        self[ piece.row ][ piece.col ] = asA
    }
}

extension Array where Iterator.Element == Int  {
    var hasRightNumber: Bool {
        return self.count == 2
    }
    
    var height: Int {
        return self[ 0 ]
    }
    
    var width: Int {
        return self[ 1 ]
    }
    
    var row: Int {
        return self[ 0 ]
    }
    
    var col: Int {
        return self[ 1 ]
    }
    
    func dist( to: Queen ) -> Queen {
        return [ abs( self.row - to.row )
            , abs( self.col - to.col ) ]
    }
    
    func isWithin( _ size: Size ) -> Bool {
        
        switch true {
        case self.row < 0,
             self.row > size.height,
             self.col < 0,
             self.col > size.width:
            return false
        default:
            return true
        }
    }
    
    func place( on: inout Board, asA: String ) {
        on[ self.row ][ self.col ] = asA
    }
}

