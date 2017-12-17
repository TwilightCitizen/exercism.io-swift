//Solution goes in Sources

class GradeSchool {
    private var grades: [ Int: [ String ] ] = [ : ]
    
    func addStudent( _ name: String, grade: Int ){
        grades[ grade ] = ( grades[ grade ] ?? [] ) + [ name ]  // Thanks, Pryowin
    }
    
    var roster: [ Int: [ String ] ]{
        return grades
    }
    
    var sortedRoster: [ Int: [ String ] ]{
        return Dictionary( uniqueKeysWithValues: grades.map{ k, v in ( k, v.sorted(by: < ) ) } )
    }
    
    func studentsInGrade( _ grade: Int ) -> [ String ]{
        return grades[ grade ] ?? [ String ]()
    }
}
