//
//  WeatherBottomArea.swift
//  Weather
//
//  Created by Mert Karagül on 2.03.2022.
//

import SwiftUI
import MapKit

struct WeatherBottomArea: View {
    @ObservedObject var post : Post
    var coordinate : MKCoordinateRegion
    var currentDate = CurrentDate()
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        let dateSplit = currentDate.sendingToday!.components(separatedBy: " ")
        let tomorrowSplit = currentDate.tomorrowDay!.components(separatedBy: " ")
        VStack{
            Text("Weather Status")
                .foregroundColor(Color.white)
                .font(.system(size : 25))
                .scaledToFit()
            Text("Today")
                .foregroundColor(Color.white)
                .font(.system(size :screenSize.height * 0.020))
            FiveDayStatusView(date: dateSplit[0], item: $post.fiveDaysModel)
            Spacer(minLength: CGFloat(0))
            Text("Tomorrow")
                .foregroundColor(Color.white)
                .font(.system(size :screenSize.height * 0.020))
            FiveDayStatusView(date: tomorrowSplit[0], item: $post.fiveDaysModel)
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .center )
        .edgesIgnoringSafeArea(.bottom)
    }
    
    
    struct FiveDayStatusView : View{
        var date : String?
        @Binding var item : FiveDaysModel?
        var body: some View{
            HStack{
                ForEach(item?.list ?? [] , id: \.self){item in
                    let composableText = item.dt_txt?.components(separatedBy: " ")
                    if composableText![0] == date{
                        FiveDayStatusImageAndText(getWeather: item.weather, getText: composableText?[1] ?? "")
                    }
                }
            }
            .padding([.leading , .trailing])
        }
    }
    
    struct FiveDayStatusImageAndText : View {
        var getWeather : [FiveWeather]?
        var getText : String?
        let screenSize = UIScreen.main.bounds.size
        var body: some View{
            VStack(spacing : 0){
                Text("\(getText?.components(separatedBy: ":00")[0] ?? ""):00")
                        .foregroundColor(Color.white)
                        .font(.system(size : screenSize.height * 0.015))
                ForEach(getWeather ?? [] , id: \.self){item in
                    MiniWeatherIcons(weatherName: item.main ?? "")
                }
            }
        }
    }
    
}
