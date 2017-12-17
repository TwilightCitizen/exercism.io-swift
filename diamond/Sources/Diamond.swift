func makeDiamond( letter: String ) -> [ String ] {
    if letter == "A" { return [ "A" ] }
    
    let letters: [ String ] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".reversed().map { String( $0 ) }.filter { $0 <= letter }
    let spaces:  [ String ] = Array( repeatElement( " ", count: letters.count * 2 - 1 ) )
    let faceted: [ String ] = letters.enumerated().map { var aspect = spaces
                                                         aspect[ $0.offset ] = $0.element
                                                         aspect[ aspect.endIndex - $0.offset - 1 ] = $0.element
                                                         return aspect.joined() }
    
    return faceted.reversed() + faceted.dropFirst()
}
