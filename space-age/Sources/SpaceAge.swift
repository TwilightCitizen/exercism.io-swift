//Solution goes in Sources

class SpaceAge {
    private let ageSeconds:       Float

    init( _ seconds: Float ) { ageSeconds = seconds }
    
    var seconds:     Float   { return ageSeconds }

    var onMercury:   Float   { return secondsConverted( inEarthYears:   0.2408467  ) }
    var onVenus:     Float   { return secondsConverted( inEarthYears:   0.61519726 ) }
    var onEarth:     Float   { return secondsConverted( inEarthYears:   1.0        ) }
    var onMars:      Float   { return secondsConverted( inEarthYears:   1.8808158  ) }
    var onJupiter:   Float   { return secondsConverted( inEarthYears:  11.862615   ) }
    var onSaturn:    Float   { return secondsConverted( inEarthYears:  29.447498   ) }
    var onUranus:    Float   { return secondsConverted( inEarthYears:  84.016846   ) }
    var onNeptune:   Float   { return secondsConverted( inEarthYears: 164.79132    ) }
    
    private func secondsConverted( inEarthYears ageRatio: Float ) -> Float {
        return ( 100 * ageSeconds / 31557600 / ageRatio ).rounded() / 100
    }
}
