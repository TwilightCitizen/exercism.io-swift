//Solution goes in Sources

import Cocoa

/* Didn't understand failable initializers is what was expected until submitting
   an "I give up?" solution.  Still a little iffy on optionals */

class Gigasecond {
    let dateFormat:  String      = "yyyy-MM-dd'T'HH:mm:ss"
    let dateLocale:  String      = "en_US_POSIX"
    let description: String
    
    init?( from: String ) {
        let dateFormatter        = DateFormatter()
        
        dateFormatter.locale     = Locale( identifier: dateLocale )
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone   = TimeZone( secondsFromGMT: 0 )

        guard let dateFrom       = dateFormatter.date( from: from ) else { return nil }
        
        let dateAdjusted         = dateFrom.addingTimeInterval( pow( 10, 9 ) )

        description              = dateFormatter.string( from: dateAdjusted )
    }
}
