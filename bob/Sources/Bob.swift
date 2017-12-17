//Solution goes in Sources

func hey( _ dialog: String ) -> String {
    switch dialog {
        case "":
            return "Fine. Be that way!"
        
        case dialog.uppercased():
            return "Whoa, chill out!"
        
        case dialog where dialog.hasSuffix( "?" ):
            return "Sure."
        
        default:
            return "Whatever."
    }
}
