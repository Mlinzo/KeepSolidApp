import Foundation

// MARK: - Response
struct Response: Decodable {
    let current: Current
    let daily: [Daily]
}

// MARK: - Current
struct Current: Decodable {
    let temp, feels_like: Double
    let pressure, humidity: Int
    let uvi: Double
    let wind_speed: Int
    let weather: [Weather]
}

// MARK: - Weather
struct Weather: Decodable {
    let description, icon: String
}

// MARK: - Daily
struct Daily: Decodable {
    let temp: Temp
    let feels_like: FeelsLike
    let pressure, humidity: Int
    let wind_speed: Double
    let weather: [Weather]
    let uvi: Double
}

// MARK: - FeelsLike
struct FeelsLike: Decodable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Decodable {
    let day, min, max, night, morn, eve: Double
}
