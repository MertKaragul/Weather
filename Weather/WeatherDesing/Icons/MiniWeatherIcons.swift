//
//  MiniWeatherIcons.swift
//  Weather
//
//  Created by Mert Karagül on 29.03.2022.
//

import SwiftUI

struct MiniWeatherIcons: View {
    
    var weatherName : String 
    let deviceSize = UIScreen.main.bounds.size
    var body: some View {
        switch (weatherName){
        case "Clear":
            Image(systemName: "sun.max.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color.yellow)
                .frame(width: deviceSize.width * 0.040, height: deviceSize.height * 0.040, alignment: .center)
            
        case "Rain":
            Image(systemName: "cloud.rain.fill" )
                .resizable()
                .scaledToFill()
                .foregroundColor(Color.white)
                .frame(width: deviceSize.width * 0.040, height: deviceSize.height * 0.040, alignment: .center)
        case "Clouds" :
            Image(systemName: "cloud.fill")
                .resizable()
                .padding(4)
                .scaledToFill()
                .foregroundColor(Color.white)
                .frame(width: deviceSize.width * 0.040, height: deviceSize.height * 0.040, alignment: .top)
        default :
            Image(systemName: "clear")
                .scaledToFill()
                .frame(width: deviceSize.width * 0.040, height: deviceSize.height * 0.040, alignment: .center)
        }
    }
}
