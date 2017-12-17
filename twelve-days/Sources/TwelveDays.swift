//Solution goes in Sources

typealias Day       = Int
typealias Ordinal   = String
typealias Cardinal  = String
typealias Gift      = String
typealias Verse     = String
typealias Verses    = String
typealias Song      = String
typealias Separator = String

struct TwelveDaysSong {
    static func verse( _ today: Day ) -> Verse {
        return "On the \( today.ordinal ) day of Christmas "
             + "my true love gave to me"
             + ( 1...today ).reversed().map {
                   let aDay: Day = $0
                
                   return seriesSeparator( today, aDay )
                        + aDay.cardinal
                        + " "
                        + aDay.gift
               }.joined( separator: "" )
             + ".\n"
    }
    
    static func seriesSeparator( _ today: Day
                               , _ aDay:  Day ) -> Separator {
        return today > 1 && aDay == 1 ? ", and " : ", "
    }
    
    static func verses( _ from: Day
                      , _ to:   Day ) -> Verses {
        return ( from...to ).map {
            verse( $0 )
        }.joined( separator: "\n" ) + "\n"
    }
    
    static func sing() -> Song {
        return verses( 1, 12 )
    }
}

extension Int {
    var ordinal: Ordinal {
        let ordinalOf:  [ Day: Ordinal ] =
            [  1: "first",    2: "second",    3: "third"
            ,  4: "fourth",   5: "fifth",     6: "sixth"
            ,  7: "seventh",  8: "eighth",    9: "ninth"
            , 10: "tenth",   11: "eleventh", 12: "twelfth" ]
        
        return ordinalOf[ self ] ?? "said"
    }
    
    var cardinal: Cardinal {
        let cardinalOf: [ Day: Cardinal ] =
            [  1: "a",        2: "two",       3: "three"
            ,  4: "four",     5: "five",      6: "six"
            ,  7: "seven",    8: "eight",     9: "nine"
            , 10: "ten",     11: "eleven",   12: "twelve" ]
        
        return cardinalOf[ self ] ?? "some"
    }
    
    var gift: Gift {
        let giftOf:     [ Day: Gift ] =
            [  1: "Partridge in a Pear Tree", 2: "Turtle Doves"
            ,  3: "French Hens",              4: "Calling Birds"
            ,  5: "Gold Rings",               6: "Geese-a-Laying"
            ,  7: "Swans-a-Swimming",         8: "Maids-a-Milking"
            ,  9: "Ladies Dancing",          10: "Lords-a-Leaping"
            , 11: "Pipers Piping",           12: "Drummers Drumming" ]
        
        return giftOf[ self ] ?? "Kind of Gift"
    }
}
