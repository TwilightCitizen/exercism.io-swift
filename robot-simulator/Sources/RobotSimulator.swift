//Solution goes in Sources

typealias Coord  = Int
typealias Coords = [ Int ]
typealias Delta  = [ Int ]

enum Bearing: String {
    case north = "N"
    case south = "S"
    case east  = "E"
    case west  = "W"
}

typealias Turn   = [ Bearing: Bearing ]

enum Instr: String {
    case advance   = "A"
    case turnRight = "R"
    case turnLeft  = "L"
}

typealias InstrString = String

typealias Proc   = ( SimulatedRobot ) -> () -> ()
typealias Action = [ Instr:   Proc  ]
typealias Adjust = [ Bearing: Delta ]

class SimulatedRobot {
    private let rightFrom: Turn =
        [ .north: .east
        , .east:  .south
        , .south: .west
        , .west:  .north ]
    
    private let leftFrom: Turn =
        [ .north: .west
        , .west:  .south
        , .south: .east
        , .east:  .north ]
    
    private let action: Action =
        [ .advance:   advance
        , .turnRight: turnRight
        , .turnLeft:  turnLeft ]
    
    private let adjust: Adjust =
        [ .north: [  0,  1 ]
        , .south: [  0, -1 ]
        , .east:  [  1,  0 ]
        , .west:  [ -1,  0 ] ]
    
    private var _bearing: Bearing
    
    var bearing: Bearing {
        return _bearing
    }
    
    private var _coords: Coords
    
    var coordinates: Coords {
        return _coords
    }
    
    init( _ bearing: Bearing = .north
        , _ coords:  Coords  = [ 7, 3 ] ) {
        _bearing = bearing
        _coords  = coords
    }
    
    func orient( _ bearing: Bearing ) {
        _bearing = bearing
    }
    
    func at( x: Coord, y: Coord ) {
        _coords = [ x, y ]
    }
    
    func place( x:         Coord
              , y:         Coord
              , direction: Bearing ) {
        at( x: x, y: y )
        orient( direction )
    }
    
    func turnRight() {
        orient( rightFrom[ _bearing ]! )
    }
    
    func turnLeft() {
        orient( leftFrom[  _bearing ]! )
    }
    
    func advance() {
        let adjusted: Coords = _coords.adjusted( by: adjust[ _bearing ]! )
        
        at( x: adjusted.x
          , y: adjusted.y )
    }
    
    func instructions( _ instr: InstrString ) -> [ Instr ] {
        return Array( instr ).map{
            Instr( rawValue: String( $0 ) )!
        }
    }
    
    func evaluate( _ instr: InstrString ) {
        instructions( instr ).forEach {
            action[ $0 ]!( self )()
        }
    }
    
}

extension Array where Iterator.Element == Int  {
    var x: Int {
        return self[ 0 ]
    }
    
    var y: Int {
        return self[ 1 ]
    }
    
    func adjusted( by delta: Delta ) -> Coords {
        return [ self.x + delta.x
               , self.y + delta.y ]
    }
}
