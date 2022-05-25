import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    @StateObject var coordinate = Coordinate()
    let uiScreen = UIScreen.main.bounds.size
    @ObservedObject var post = Post()
    @State var gettingCountry : String = ""
    
    var size = UIScreen.main.bounds
    
    var body: some View {
        VStack{
            WeatherTopArea(coordinate: $coordinate.region, postModel: self.post , getCountry: $gettingCountry)
            WeatherBottomArea(post : self.post, coordinate: coordinate.region)
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .background(Color.orange.ignoresSafeArea())
        .onAppear(perform: {
            self.post.getCurrentWeather(coordinate: coordinate.region.center)
            self.post.getFiveDaysWeatherStatus(coordinate: coordinate.region.center)
            self.coordinate.getAdress(cllocation: coordinate.region.center){getC in
                self.gettingCountry = getC
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewDevice("iPod touch (7th generation)")
    }
}
