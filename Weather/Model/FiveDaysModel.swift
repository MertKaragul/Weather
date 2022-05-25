import Foundation
import Metal

struct FiveDaysModel : Codable{
    var cod : String?
    var message , cnt : Int?
    var list : [FiveList]
    var city : FiveCity
}


struct FiveList : Codable , Hashable , Identifiable{
    let id = UUID()
    var dt : Int?
    var main : FiveMain?
    var weather : [FiveWeather]?
    var clouds : FiveClouds?
    var visibility : Int?
    var pop : Double?
    var sys : FiveSys?
    var dt_txt : String?
}

struct FiveMain : Codable , Hashable{
    var temp , feels_like , temp_min , temp_max : Double?
    var pressure , sea_level , grnd_level , humidity : Int?
    var temp_kf : Double?
}

struct FiveWeather : Codable , Hashable , Identifiable{
    let uuid = UUID()
    var id : Int?
    var main , description , icon: String?
}

struct FiveClouds : Codable , Hashable{
    var all : Int?
}

struct FiveWind : Codable , Hashable{
    var speed : Double?
    var deg : Int?
    var gust : Double?
}
struct FiveSys : Codable , Hashable{
    var pod : String?
}

struct FiveCity : Codable {
    var id : Int?
    var name : String?
    var coord : FiveCoord?
    var country : String?
    var population , timezone , sunrise , sunset: Int32?
}

struct FiveCoord : Codable{
    var lat : Double?
    var lon : Double?
}
