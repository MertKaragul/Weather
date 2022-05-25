import Foundation
import MapKit

class Post : ObservableObject {
    @Published var models : Model?
    let apiKey = "3c7c7fa5da2ec76d599bae0fca61d1af"
    @Published var oneTimeModel : OneTimeModel?
    @Published var fiveDaysModel : FiveDaysModel?
    
    func getCurrentWeather(coordinate : CLLocationCoordinate2D){
        guard let urls = URL(string : "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&lang=fr&units=metric&appid=\(apiKey)") else {
            fatalError("Invalid URL")
        }
        
        getWeatherJson(getUrl: urls, whichModel: Model.self)
    }
    
    func getWeatherStatus(coordinate : CLLocationCoordinate2D){
        guard let urls = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(apiKey)&units=metric&lang=tr") else{
            fatalError("Invalid URL")
        }
        getWeatherJson(getUrl: urls, whichModel: OneTimeModel.self)
    }
    
    func getFiveDaysWeatherStatus(coordinate : CLLocationCoordinate2D){
        guard let urls = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(apiKey)&lang='tr'") else{
            fatalError("Invalid URL")
        }
        
        getWeatherJson(getUrl: urls, whichModel: FiveDaysModel.self)
    }
    
    
    private func getWeatherJson<T>(getUrl : URL , whichModel : T.Type ) where T : Decodable{
        let request = URLRequest(url: getUrl)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            do{
             let decodeData = try JSONDecoder().decode( whichModel , from: data)
                DispatchQueue.main.async {
                    if whichModel.self == Model.self{
                        self.models = decodeData as? Model
                    }else if whichModel == OneTimeModel.self {
                        self.oneTimeModel = decodeData as? OneTimeModel
                    }else if whichModel.self == FiveDaysModel.self {
                        self.fiveDaysModel = decodeData as? FiveDaysModel
                    }else {
                        print("Not found model , please tell me which model")
                    }
                }
            }catch let error{
                print("Session Error : \(error)")
            }
        }.resume()
    }
}
