//Solution goes in Sources

struct ETL{
    static func transform( _ old: [ Int: [ String ] ] ) -> [ String: Int ] {
        return Dictionary( uniqueKeysWithValues: old.map{ ps, ls in ls.map{ l in ( l.lowercased(), ps ) } }.flatMap{ $0 } )
    }
}
