//Solution goes in Sources

class Year {
///    private var leapTemp: Bool = false
    let isLeapYear:       Bool
    
    init( calendarYear: Int ) {
    
/*        if calendarYear % 4 == 0 {
            leapTemp = true
            
            if calendarYear % 100 == 0 {
                leapTemp = false
                
                if calendarYear % 400 == 0 {
                    leapTemp = true
                }
            }
        }
        
        isLeapYear = leapTemp */
        
        /// The above works, but ugh...
        
        /// This is much cleaner and faster, too! :)
        isLeapYear =     ( calendarYear % 4 == 0 )
                     && !( calendarYear % 100 == 0)
                     ||  ( calendarYear % 400 == 0 )
    }
}
