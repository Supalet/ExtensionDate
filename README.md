# ExtensionDate

## Convert Date Function

### Convert String To Date 
* dateFormat เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String
* calendar เป็นตัวกำหนดว่าเป็น พศ หรือ คศ
* timeZone ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current
* locale ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ
```
let resultDate = "17/5/1998".convertToDate(dateFormat: "dd/MM/yyyy")
```

### Convert Date To String
* dateFormat เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String
* calendar เป็นตัวกำหนดว่าเป็น พศ หรือ คศ
* timeZone ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current
* locale ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ
```
let resultDate = Date().convertDateToString(dateFormat: "dd/MM/yyyy")
```

### Convert String To String Change DateFormat
* dateFormatStarter เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String (DateFormat ของตัวที่ต้องการแปลง)
* dateFormatResult เป็นตัว format วันที่ที่ต้องการจะเปลี่ยนเป็น String (DateFormat ที่ต้องการแปลงไป)
* calendar เป็นตัวกำหนดว่าเป็น พศ หรือ คศ (calendar ของตัวที่ต้องการแปลง)
* timeZone ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current (timeZone ของตัวที่ต้องการแปลง)
* locale ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ (locale ของตัวที่ต้องการแปลง)
* calendarEditer เป็นตัวกำหนดว่าเป็น พศ หรือ คศ (calendar ที่ต้องการแปลงไป)
* timeZoneEditer ระบุ Timezone ของเวลาที่ต้องการแปลง Default เป็น .current (timeZone ที่ต้องการแปลงไป)
* localeEditer ระบุ Locale ที่ใช้แสดงวันที่จะมีผลตอนต้องการชื่อเดือนหรือชื่อวันเป็นภาษาต่างๆ (locale ที่ต้องการแปลงไป)
```
let resultDate = "17/5/1998".convertDateFormatByString(dateFormatStarter: "dd/MM/yyyy", dateFormatResult: "dd MM yyyy")
```

### CompareDate
* toGranularity หน่วยของระยะวันที่ต้องการ (** hour day month year **)
```
let starterDate = "14/10/1998".convertToDate(dateFormat: "dd/MM/yyyy")
```
```
let resultCompare = starter.compareDate(toDate: Date(),toGranularity: .day)
```
```
Result
orderedAscending => startDate < toDate
orderedSame => startDate == toDate
orderedDescending => startDate > toDate
```

### Get Date From User Config period
* component หน่วยของระยะวันที่ต้องการ (** hour day month year **)
* value จำนวนที่ต้องการเช่น 30 วันข้างหน้า
* toDate จุดเริ่มต้นในการนับ
```
let resultDate = dateFromUserConfig(component: .day, value: 20, toDate: Date())
```

### Get Date In Calendar  ** startOfWeek endOfWeek startOfMonth endOfMonth ** 
  get วันแรกของสัปดาป์
```
let resultDate = Date().startOfWeek
```

  get วันสุดท้ายของสัปดาป์
```
let resultDate = Date().endOfWeek
```

  get วันแรกของเดือน
```
let resultDate = Date().startOfMonth
```

  get วันสุดท้ายของเดือน
```
let resultDate = Date().endOfMonth
```


