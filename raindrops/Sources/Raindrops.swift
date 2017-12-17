//Solution goes in Sources

class Raindrops {
    let number:   Int
    let notes:  [ Int: String ] =  [ 3: "Pling"
                                   , 5: "Plang"
                                   , 7: "Plong" ]
    
    init( _ number: Int ) {
        self.number = number
    }
    
    var sounds: String {
        let song: String = notes.filter{ number % $0.key == 0 }
                               .keys.sorted().map{ notes[ $0 ]! }
                                   .joined( separator: "" )
        
        return song.isEmpty ? "\( number )" : song
    }
}
