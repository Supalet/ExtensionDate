//
//  ExtensionDate.swift
//
//
//  Created by Supalert Kamolsin on 16/10/2566 BE.
//

import Foundation

extension String {
	/*
		แปลงค่าจาก String เป็น Date
		=> dateFormat เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String
		=> calendar เป็นตัวกำหนดว่าเป็น พศ หรือ คศ
		=> timeZone ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current
		=> locale ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ
	*/
	func convertToDate(dateFormat: String = "dd/MM/YYYY'T'hh:mm:ss",
					   calendar: Calendar = Calendar(identifier: .gregorian),
					   timeZone: TimeZone = .current,
					   locale: Locale = Locale(identifier: "th")) -> Date {
		let dateFormate = DateFormatter()
		dateFormate.timeZone = timeZone
		dateFormate.locale = locale
		dateFormate.calendar = calendar
		dateFormate.dateFormat = dateFormat
		return dateFormate.date(from: self) ?? Date()
	}
	
	/*
		แปลงค่าจาก String เป็น String โดยเปลี่ยน dateFormat ของวันที่ที่แสดง
		=> dateFormatStarter เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String (DateFormat ของตัวที่ต้องการแปลง)
		=> dateFormatResult เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String (DateFormat ที่ต้องการแปลงไป)
		=> calendar เป็นตัวกำหนดว่าเป็น พศ หรือ คศ (calendar ของตัวที่ต้องการแปลง)
		=> timeZone ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current (timeZone ของตัวที่ต้องการแปลง)
		=> locale ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ (locale ของตัวที่ต้องการแปลง)
		=> calendarEditer เป็นตัวกำหนดว่าเป็น พศ หรือ คศ (calendar ที่ต้องการแปลงไป)
		=> timeZoneEditer ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current (timeZone ที่ต้องการแปลงไป)
		=> localeEditer ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ (locale ที่ต้องการแปลงไป)
	*/
	func convertDateFormatByString(dateFormatStarter: String = "dd/MM/YYYY'T'hh:mm:ss",
								   calendar: Calendar = Calendar(identifier: .gregorian),
								   timeZone: TimeZone = .current,
								   locale: Locale = Locale(identifier: "th"),
								   dateFormatResult: String = "dd/MM/YYYY'T'hh:mm:ss",
								   calendarEditer: Calendar = Calendar(identifier: .gregorian),
								   timeZoneEditer: TimeZone = .current,
								   localeEditer: Locale = Locale(identifier: "th")) -> String {
		let dateFormate = DateFormatter()
		dateFormate.timeZone = timeZone
		dateFormate.locale = locale
		dateFormate.calendar = calendar
		dateFormate.dateFormat = dateFormatStarter
		if let starterDate = dateFormate.date(from: self) {
			dateFormate.timeZone = timeZoneEditer
			dateFormate.locale = localeEditer
			dateFormate.calendar = calendarEditer
			dateFormate.dateFormat = dateFormatResult
			let resultDate = dateFormate.string(from: starterDate)
			return resultDate
		} else {
			return "--/--/----"
		}
	}
}

extension Date {
	/*
		แปลงค่าจาก Date เป็น String
		=> dateFormat เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String
		=> calendar เป็นตัวกำหนดว่าเป็น พศ หรือ คศ
		=> timeZone ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current
		=> locale ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ
	*/
	func convertDateToString(dateFormat: String = "dd/MM/YYYY'T'hh:mm:ss",
							 calendar: Calendar = Calendar(identifier: .gregorian),
							 timeZone: TimeZone = .current,
							 locale: Locale = Locale(identifier: "th")) -> String {
		let dateFormate = DateFormatter()
		dateFormate.timeZone = timeZone
		dateFormate.locale = locale
		dateFormate.calendar = calendar
		dateFormate.dateFormat = dateFormat
		return dateFormate.string(from: self)
	}
	
	/*
		ใช้หาวันที่ต้องการตามระยะเวลาที่ต้องการ
		=> component หน่วยของระยะวันที่ต้องการ (** hour day month year **)
		=> value จำนวนที่ต้องการเช่น 30 วันข้างหน้า
		=> toDate จุดเริ่มต้นในการนับ
	*/
	func dateFromUserConfig(component: Calendar.Component = .day, value: Int, toDate: Date) -> Date {
		return Calendar.current.date(byAdding: component, value: value, to: toDate) ?? Date()
	}
	
	/*
		ใช้เปรียบเทียบวัน
		=> toGranularity หน่วยของระยะวันที่ต้องการ (** hour day month year **)
	 
		orderedAscending => startDate < toDate
		orderedSame => startDate == toDate
		orderedDescending => startDate > toDate
	*/
	func compareDate(toDate: Date, toGranularity: Calendar.Component = .day) -> ComparisonResult {
		return Calendar.current.compare(self,
										to: toDate,
										toGranularity: toGranularity)
	}
	
	/*
	get วันแรกของสัปดา
	*/
	var startOfWeek: Date? {
		let gregorian = Calendar(identifier: .gregorian)
		guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
		return gregorian.date(byAdding: .day, value: 0, to: startDay)
	}
	
	/*
		get วันสุดท้ายของสัปดา
	*/
	var endOfWeek: Date? {
		let gregorian = Calendar(identifier: .gregorian)
		guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
		return gregorian.date(byAdding: .day, value: 6, to: startDay)
	}
	
	/*
		get วันแรกของเดือน
	*/
	var startOfMonth: Date {
		let calendar = Calendar(identifier: .gregorian)
		let components = calendar.dateComponents([.year, .month], from: self)
		return  calendar.date(from: components)!
	}
	
	/*
		get วันสุดท้ายของเดือน
	*/
	var endOfMonth: Date {
		var components = DateComponents()
		components.month = 1
		components.second = -1
		return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
	}
}
