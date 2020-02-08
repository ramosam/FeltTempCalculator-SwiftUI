//
//  FeltTempCalculator.swift
//  FeltTemp
//
//  Created by Arcaurel on 1/27/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import Foundation

class FeltTempCalculator {
    
    static let baseTemp = 70.0
    static let FAHRENHEIT = "Fahrenheit"
    static let CELSIUS = "Celsius"
    
    // Calculation for Fahrenheit to Celsius
    // (32°F − 32) × 5/9 = 0°C
    class func convertToCelsius(temp: Double) -> Double {
        let celsius = (temp - 32) * 5 / 9
        print("Celsius: \(celsius)")
        return celsius
    }
    // Calculation for Celsius to Fahrenheit
    // (32°C × 9/5) + 32 = 89.6°F
    class func convertToFahrenheit(temp: Double) -> Double {
        let fahrenheit = (temp * 9 / 5) + 32
        print("Fahrenheit: \(fahrenheit)")
        return (temp * 9 / 5) + 32
    }
    
    // Calculations for Heat and Chill expect Fahrenheit
    // Calculation for cold temperatures
    /**
     Wind Chill Temperature = 35.74 + 0.6215 T - 35.75 V^0.16 + 0.4275 T V^0.16
     where: T is the air temperature in degrees Fahrenheit, and V is the wind speed in mph. Reference: https://en.wikipedia.org/wiki/Wind_chill (January 20, 2016)
     */
    class func calculateWindChillTemp(temp: Double, windSpeed: Double) -> Double {
        return (35.74 + (0.6215 * temp) - (35.75 * pow(windSpeed, 0.16))
            + (0.4275 * temp * pow(windSpeed, 0.16)))
    }
    
    // Calculation for hot temperatures
    /**
     In warm weather, humidity is a greater factor. Apparent temperature in hot weather is called the “Heat Index” The formula for calculating the heat index is:
     Heat Index = -42.379 + 2.04901523 T + 10.14333127 R - 0.22475541T R - 6.83783 x 10-3 T2 - 5.481717x10-2R2 +1.22874x10-3T2R+8.5282x10-4TR2 -1.99x10-6T2R2
     where: T is air temperature Fahrenheit, and R is the relative humidity (percentage)
     Reference: http://www.weather.gov/ama/heatindex (February 1, 2017)
     */
    class func calculateHeatTemp(temp: Double, humidity: Double) -> Double {
        return (-42.379 + (2.04901523 * temp) + (10.14333127 * humidity)
            - (0.22475541 * temp * humidity) - (6.83783 * pow(10, -3) * pow(temp, 2))
            - (5.481717 * pow(10, -2) * pow(humidity, 2)))
    }
    
    // Calculate actual and felt temperatures.
    class func calculateFeltTemp(temp: Double, isFahrenheit: Bool, isWind: Bool, windSpeed: Double?, humidity: Double?) -> (actualTemp: Double, feltTemp: Double) {
        print("Temp: \(temp)")
        print("isFahrenheit: \(isFahrenheit)")
        print("windSpeed: \(String(describing: windSpeed))")
        print("humidity: \(String(describing: humidity))")
        
        // Check if Celsius, convert to Fahrenheit
        var convertedTemp = (!isFahrenheit) ? convertToFahrenheit(temp: temp) : temp
        print("Converted to Fahrenheit: \(convertedTemp)")
        
        var feltTemp = 0.0
        // Check if temp is over threshold
        if isWind {
            // if isWind and is over 70
            if convertedTemp >= self.baseTemp {
                // too hot
               feltTemp = convertedTemp
           } else {    // Use wind chill
               feltTemp = calculateWindChillTemp(temp: convertedTemp, windSpeed: windSpeed ?? 0.0)
           }
        } else {
            // if humid and over 70
             if convertedTemp >= self.baseTemp {
                feltTemp = calculateHeatTemp(temp: convertedTemp, humidity: humidity ?? 0.0)
            } else {    // too cold for humidity
                feltTemp = convertedTemp
            }
        }
        
        // Check if Celsius and convert back
        if (!isFahrenheit) {
            print("feltTemp before: \(feltTemp)")
            feltTemp = convertToCelsius(temp: feltTemp)
            print("feltTemp after: \(feltTemp)")
            print("convertedTemp before: \(convertedTemp)")
            convertedTemp = convertToCelsius(temp: convertedTemp)
            print("convertedTemp after: \(convertedTemp)")
        }

        
        
        

        
        return (convertedTemp, feltTemp)
        
    }
    
    
}
