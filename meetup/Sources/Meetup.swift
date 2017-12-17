import Foundation

typealias WeekDay   = Int
typealias MonthDay  = Int
typealias Year      = Int
typealias Month     = Int
typealias Day       = Int
typealias Ordinal   = String
typealias Cardinal  = Int
typealias MeetDay   = String
typealias DateFormat = String

struct Meetup {
    private let _year: Year, _month: Month
    private let cal = Calendar( identifier: .gregorian )
    
    private var daysOfWeekday: [ WeekDay: [ MonthDay ] ] =
        [ 1: [], 2: [], 3: [], 4: [], 5: [], 6: [], 7: [] ]
    
    private let ordinalToCardinal:  [ Ordinal: Cardinal ] =
        [ "1st": 0, "2nd": 1, "3rd": 2, "4th": 3 ]
    
    init( year: Year, month: Month, day: Day = 1 ) {
        _year = year; _month = month
        
        var comps = DateComponents( year: year, month: month, day: day )
        
        while cal.component( .month, from: cal.date( from: comps )! ) == month  {
            daysOfWeekday[ cal.component( .weekday, from: cal.date( from: comps )! ) ]!.append( comps.day! )
            comps.day! += 1
        }
    }
    
    func day( _ weekDay: WeekDay, which: Ordinal ) -> MeetDay {
        var comps = DateComponents( year: _year, month: _month )
        
        switch which {
            case "1st", "2nd", "3rd", "4th":
                comps.day = daysOfWeekday[ weekDay ]![ ordinalToCardinal[ which ]! ]
            case "last":
                comps.day = daysOfWeekday[ weekDay ]!.last
            case "teenth":
                comps.day = daysOfWeekday[ weekDay ]!.filter{ $0 >= 13 }.first
            default: break
        }
        
        return DateFormatter( of: "yyyy-MM-dd" ).string( from: cal.date( from: comps )! )
    }
}

extension DateComponents {
    init( year: Year, month: Month, day: Day = 1 ) {
        self.init(); self.year = year; self.month = month; self.day = day
    }
}

extension DateFormatter {
    convenience init( of: DateFormat ) {
        self.init(); self.dateFormat = of
    }
}

