//
//  Colors.swift
//  GP Color Mixer
//
//  Created by Steven R. Loomis on 1/6/17.
//  Copyright © 2017 IBM. All rights reserved.
//

enum Color : Int {
    case red = 0, orange, yellow, green, blue, purple, muddy;
    // r+y = o, y+b = g, b+r = p
    func simpleDescription() -> String {
        switch self {
        case .red:      return "red"
        case .orange:   return "orange"
        case .yellow:   return "yellow"
        case .green:    return "green"
        case .blue:     return "blue"
        case .purple:   return "purple"
        case .muddy:    return "muddy brown" // use this if we don't know how to mix a color
        // should be exhaustive
        }
    }
    
    /**
     * Mix the colors, return the result
     */
    func mix( with: Color ) -> Color {
        if( self == .muddy || with == .muddy ) {
            return .muddy // anything + mud = mud
        }
        if( with == self ) {
            return self  // identity!
        }
        switch self {
        case .red:
            switch with {
            case .yellow:   return .orange
            case .blue:     return .purple
            default:        return .muddy
            }
        case .yellow:
            switch with {
            case .red:      return .orange
            case .blue:     return .green
            default:        return .muddy
            }
        case .blue:
            switch with {
            case .red:      return .purple
            case .yellow:   return .green
            default: return .muddy
            }
        default: return .muddy
        }
    }
}
/*
 For the playground:
 
 Color.blue.mix(with: Color.red)
 Color.blue.mix(with: Color.blue)
 Color.blue.mix(with: Color.yellow)
 Color.blue.mix(with: Color.purple) // muddy
 
 Color.red.mix(with: Color.red)
 Color.red.mix(with: Color.blue)
 Color.red.mix(with: Color.yellow)
 Color.red.mix(with: Color.purple) // muddy
 
 Color.yellow.mix(with: Color.red)
 Color.yellow.mix(with: Color.blue)
 Color.yellow.mix(with: Color.yellow)
 Color.yellow.mix(with: Color.purple) // muddy
*/
