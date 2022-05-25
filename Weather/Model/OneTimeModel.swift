import Foundation

struct OneTimeModel : Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
}

// MARK: - Current
struct Current : Codable{
    let dt, sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let dewPoint: Double?
    let clouds, visibility, windSpeed, windDeg: Int?
    let weather: [OneWeather]?
}

// MARK: - Weather
struct OneWeather : Codable {
    let id: Int?
    let main, weatherDescription, icon: String?
}
