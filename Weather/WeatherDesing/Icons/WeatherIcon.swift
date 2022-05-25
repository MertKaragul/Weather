import Foundation
import SwiftUI


struct MainWeatherIcon : View{
    var getWeatherStatus : String
    let getScreenSize = UIScreen.main.bounds.size
    var body: some View{
        VStack(alignment : .center  ){
            switch(getWeatherStatus){
            case "Clear" :
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: getScreenSize.width * 0.120  , height: getScreenSize.height * 0.120, alignment: .center)
                    .foregroundColor(Color.yellow)
            case "Rain" :
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: getScreenSize.width * 0.120  , height: getScreenSize.height * 0.120, alignment: .center)
                    .foregroundColor(Color.white)
                
            case "Clouds" :
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: getScreenSize.width * 0.120 , height: getScreenSize.height * 0.120 , alignment: .center)
                    .foregroundColor(Color.white)
                
                
            default :
                Image(systemName: "clear")
                    .resizable()
                    .scaledToFill()
                    .frame(width: getScreenSize.width * 0.120, height: getScreenSize.height * 0.120, alignment: .center)
            }
        }
    }
}

