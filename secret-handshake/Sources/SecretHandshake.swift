//Solution goes in Sources

struct SecretHandshake {
    let commands: [ String ]
    
    let codes: [ Int: String ] =
        [ 0b1:    "wink"
        , 0b10:   "double blink"
        , 0b100:  "close your eyes"
        , 0b1000: "jump" ]
    
    init( _ n: Int ) {
        commands = codes.sorted( by: < ).reduce( [ String ]() ) { a, v in
            
            return iif( n & v.key != 0
                      , iif( n & 0b10000 != 0
                           , [ v.value ] + a
                           , a + [ v.value ] )
                      , a )
        }
    }
}

func iif< T >( _ cond: Bool, _ whenTrue: T, _ whenFalse: T ) -> T {
    return cond ? whenTrue : whenFalse
}