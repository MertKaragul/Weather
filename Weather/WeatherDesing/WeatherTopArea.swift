import SwiftUI
import MapKit

struct WeatherTopArea: View {
    @Binding var coordinate : MKCoordinateRegion
    @ObservedObject var postModel : Post
    var currentDate = CurrentDate()
    @Binding var getCountry : String
    var getScreenSize = UIScreen.main.bounds.size
    var body: some View {
        let cityModel = postModel.fiveDaysModel?.city
        let weatherStatus = postModel.models?.weather[0]
        VStack{
            VStack{
                HStack{
                    Text(cityModel?.name ?? "New York")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.system(size : getScreenSize.height * 0.030))
                    Spacer()
                    Text("\(currentDate.calendarComponents.day ?? 0) \(currentDate.sendingMonthString) \(currentDate.sendingWeekDayString)")
                        .foregroundColor(Color.white)
                        .font(.system(size :20))
                }
                HStack {
                    Text(getCountry)
                        .foregroundColor(Color.white)
                        .font(.system(size :getScreenSize.height  * 0.020))
                    Spacer()
                    Text(weatherStatus?.main ?? "Mosty , cloudy")
                        .font(.system(size :15))
                        .foregroundColor(Color.white)
                }
            }.padding([.trailing , .leading])
            
            VStack{
                MainWeatherIcon(getWeatherStatus: weatherStatus?.main ?? "")
                
                
                Text("\(String(postModel.models?.main.temp ?? 0.0))°C")
                    .font(.system(size : getScreenSize.height * 0.080))
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding([.leading , .trailing] , 3)
                
                Text("\(String(postModel.models?.wind.speed ?? 0.0))km/h")
                    .foregroundColor(Color.white)
                    .font(.system(size : getScreenSize.height * 0.040))
                
                Text("\(coordinate.center.latitude) , \(coordinate.center.longitude)")
                    .foregroundColor(Color.white)
                    .font(.system(size : getScreenSize.height * 0.020))
            }
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .background(Color.orange)
    }
}
