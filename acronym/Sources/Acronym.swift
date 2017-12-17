import Foundation

func abbreviate( _ title: String ) -> String {
    return title.components( separatedBy: CharacterSet.punctuationCharacters )
        .map( { ( part: String ) -> Array< Substring > in
            return part.split( separator: " " ) } )
        .flatMap { $0 }
        .map( { ( part: Substring ) -> String in
            return String( part.first! ).uppercased() + String( part.dropFirst() ) } )
        .map( { ( part: String ) -> Array< String > in
            return part.components( separatedBy: CharacterSet.lowercaseLetters ) } )
        .map( { ( parts: Array< String > ) -> Array< ArraySlice< String > > in
            return parts.split( separator: "" ) } )
        .flatMap { $0 }
        .map( { ( part: ArraySlice< String > ) -> String in
            return String( part.first!.first! ) } )
        .joined()
}

