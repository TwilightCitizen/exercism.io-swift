//Solution goes in Sources

class Element< T > {
    private let _value: T?, _next: Element?
    
    init( _ value: T? = nil, _ next: Element? = nil ) { _value = value; _next = next }
    
    var value: T?       { return _value }
    var next:  Element? { return _next }
    
    func toArray() -> [ T ] {
        return ( _value == nil ? [] : [ _value! ] ) + ( _next  == nil ? [] : _next!.toArray() )
    }
    
    func reverseElements() -> Element {
        return Element.fromArray( toArray().reversed() )
    }
    
    class func fromArray( _ ary: [ T ] ) -> Element< T > {
        return ( ary.first == nil ) ? Element() : Element( ary.first!, fromArray( Array( ary.dropFirst() ) ) )
    }
}
