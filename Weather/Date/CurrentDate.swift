import Foundation


struct CurrentDate{
    let date = Date()
    private let dateFormatter = DateFormatter()
    
    // Sending Data of view
    var sendingWeekDayString : String
    var sendingMonthString : String
    var calendarComponents : DateComponents
    var sendingCustomDateFormatter : Date?
    var sendingToday : String?
    var tomorrowDay : String?
    
    init(){
        let calendarCurrent = Calendar.current
        let currentDate = calendarCurrent.dateComponents([.year , .day , .month , .weekday], from: date)
        let getStringWeekDay = dateFormatter.weekdaySymbols[currentDate.weekday! - 1]
        let getMonthString = dateFormatter.monthSymbols[currentDate.month! - 1]
        self.sendingWeekDayString = getStringWeekDay
        self.sendingMonthString = getMonthString
        self.calendarComponents = currentDate
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.sendingToday = dateFormatter.string(from: self.date)
        self.tomorrowDay = dateFormatter.string(from: self.date.dayAfter)
    }
}
extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
