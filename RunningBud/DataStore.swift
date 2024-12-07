//
//  DataStore.swift
//  RunningBud
//
//  Created by chesterzhou on 9/26/24.
//

import Foundation


class logUser{
    var loginName:String
    var loginPassWord:String
    var LoginLevel:Int
    var loginJoinedGroup:[String]
    var loginFriendList:[Int]
    var loginHeadImage:String
    var loginPaied:Bool
    var totalMile:Double
    var totalHour:Int
    var totalKcal:Int
    init(loginName: String, loginPassWord: String, LoginLevel: Int, loginJoinedGroup: [String], loginFriendList: [Int], loginHeadImage: String, loginPaied: Bool, totalMile: Double, totalHour: Int, totalKcal: Int) {
        self.loginName = loginName
        self.loginPassWord = loginPassWord
        self.LoginLevel = LoginLevel
        self.loginJoinedGroup = loginJoinedGroup
        self.loginFriendList = loginFriendList
        self.loginHeadImage = loginHeadImage
        self.loginPaied = loginPaied
        self.totalMile = totalMile
        self.totalHour = totalHour
        self.totalKcal = totalKcal
    }
    
}
class logUsers{
    var loginUsers:[logUser]=[]
    init(){
        let log1 = logUser(loginName: "1", loginPassWord: "1", LoginLevel: 1, loginJoinedGroup:["3","7","9"] , loginFriendList: [12,15,17,30,46,60,64,67,80,91,96,110], loginHeadImage: "loginHeadAdmin", loginPaied: true,totalMile: 0.0,totalHour: 0,totalKcal: 0)
        let log4 = logUser(loginName: "2", loginPassWord: "2", LoginLevel: 1, loginJoinedGroup:["3","7","9"] , loginFriendList: [12,15,17,30,46,60,64,67,80,91,96,110], loginHeadImage: "loginHeadAdmin", loginPaied: false,totalMile: 0.1,totalHour: 1,totalKcal: 1)
        let log2 = logUser(loginName: "Ray", loginPassWord: "Ray!1234", LoginLevel: 3, loginJoinedGroup: ["8","9","14"], loginFriendList: [5,6,9,15,17], loginHeadImage: "loginHeadRey", loginPaied: true,totalMile: 100,totalHour: 40,totalKcal: 7234)
        let log3 = logUser(loginName: "Andrew", loginPassWord: "And!1234", LoginLevel: 1, loginJoinedGroup: ["1","2","4"], loginFriendList: [3,6,7,30,45,67,89], loginHeadImage: "loginHeadAndrew", loginPaied: false,totalMile: 20,totalHour: 22,totalKcal: 1670)
        loginUsers.append(log1)
        loginUsers.append(log2)
        loginUsers.append(log3)
        loginUsers.append(log4)
    }
}

class runHistory{
    var runID:Int
    var runDate:Date
    var runImage:String
    var runCal:Double
    var runType:String
    var runDis:Double
    var runSpace:Double
    var runGPS:[[Double]]
    var runTime:String
    init(runID: Int, runDate: Date, runImage: String, runCal: Double, runType: String, runDis: Double, runSpace: Double, runGPS: [[Double]],runTime:String) {
        self.runID = runID
        self.runDate = runDate
        self.runImage = runImage
        self.runCal = runCal
        self.runType = runType
        self.runDis = runDis
        self.runSpace = runSpace
        self.runGPS = runGPS
        self.runTime = runTime
    }
    
}
class runHistories{
    var runHis:[runHistory]=[]
    init(){
        
        let calendar = Calendar.current
        let date1 = calendar.date(from: DateComponents(year: 2024, month: 11, day: 1, hour: 15, minute: 30, second: 0))!
        let date2 = calendar.date(from: DateComponents(year: 2024, month: 11, day: 2, hour: 16, minute: 30, second: 0))!
        let date3 = calendar.date(from: DateComponents(year: 2024, month: 11, day: 3, hour: 17, minute: 30, second: 0))!
        let rH1 = runHistory(runID: 1, runDate:date1, runImage: "runImage1", runCal: 10.1, runType: "typ1", runDis: 2.12, runSpace: 18.87, runGPS:
        [[38.897363, -77.048862],
         [38.897363, -77.046646],
         [38.897351, -77.043470],
         [38.897351, -77.041678],
         [38.897351, -77.039462],
        [38.896400, -77.039462],
        [38.895411, -77.039462],
        [38.895398, -77.037677],
         [38.895247, -77.036537],
         [38.895459, -77.035008],[38.898777, -77.033634],[38.900212, -77.033618],[38.900201, -77.039464],[38.898326, -77.039464],[38.898303, -77.043433],[38.898350, -77.046659],[38.897355, -77.046636]
        ],runTime: "00:40:00")
        let rH2 = runHistory(runID: 2, runDate:date2, runImage: "runImage2", runCal: 10.1, runType: "typ1", runDis: 1.28, runSpace: 23.44, runGPS: [[38.900201, -77.039441],[38.898326, -77.039457],[38.895420, -77.039473],[38.895383, -77.037702],[38.895259, -77.036840],[38.895259, -77.036123],[38.895457, -77.035022],[38.895582, -77.033650],[38.898338, -77.033602],[38.900201, -77.033650],[38.900201, -77.039441]],runTime: "00:30:00")
        let rH3 = runHistory(runID: 3, runDate:date3, runImage: "runImage3", runCal: 10.1, runType: "typ1", runDis: 1.90, runSpace: 18.42, runGPS: [[38.902422, -77.043465],[38.899572, -77.043465],[38.896033, -77.043431],[38.895981, -77.041709],[38.896683, -77.039469],[38.898843, -77.039469],[38.900197, -77.039452],[38.900184, -77.038867],[38.900223, -77.033634],[38.901329, -77.033634],[38.902448, -77.033634],[38.902435, -77.039368],[38.902395, -77.043465]],runTime: "00:35:00")
        runHis.append(rH1)
        runHis.append(rH2)
        runHis.append(rH3)
    }
    
}

class myGroup{
    var myGroupID:Int
    var myGroupName:String
    var memberID:[Int]
    var chatMess:[String]
    var chatMember:[Int]
    var description:String
    var cType:String
    var allowToJoin:Bool
    init(myGroupID: Int, myGroupName: String, memberID: [Int], chatMess: [String], chatMember: [Int], description: String, cType: String, allowToJoin: Bool) {
        self.myGroupID = myGroupID
        self.myGroupName = myGroupName
        self.memberID = memberID
        self.chatMess = chatMess
        self.chatMember = chatMember
        self.description = description
        self.cType = cType
        self.allowToJoin = allowToJoin
    }
    
}
class myGroups{
    var groups:[myGroup]=[]
    init(){
        let group1 = myGroup(myGroupID: 1, myGroupName: "DMV group", memberID: [12,15,17,30,46,60,64,67,80], chatMess: ["$Barbara$: Hi everyone! Let’s plan our group run for the weekend. What time works for everyone?","$Melissa$: I have something in the morning on Saturday, but I’m free after 3 PM. Any thoughts on the location?","$Jessica$: Saturday afternoon works for me too. Starting around 3 PM would be good since it shouldn’t be too hot by then. I suggest Riverside Park; the trail and views are nice there.","$Thomas$: Riverside Park sounds good to me too! It’s close to where I live. I can be flexible with the time.","$Eric$: I agree! 3 PM is fine, but I’m a bit worried about it being crowded. Could we maybe start a bit earlier?","$Barbara$: How about we meet at 2:30 instead? That way, we can avoid the peak crowd and still have cooler weather.","$Melissa$: Alright, 2:30 PM at Riverside Park then! Do we need to bring anything?","$Jessica$: Just bring water and a towel, and we can find a café nearby afterward to rest.","$Thomas$: Sounds good! I’ll bring some energy bars so we can recharge a bit after the run.","$Eric$: Perfect! So it’s set—2:30 PM on Saturday at Riverside Park. See you all there!"], chatMember: [], description:"Description1", cType: "cType", allowToJoin: true)
        let group2 = myGroup(myGroupID: 2, myGroupName:"Running group", memberID: [60,64,67,80,91,96,110], chatMess: ["$Kathleen$: Hey everyone! Are we still up for a group run this weekend? Let’s figure out the details!","$Katherine$: Yes! I’m excited. I’m free Saturday morning or Sunday afternoon. What works for everyone else?","$Martha$: Sunday afternoon works best for me. How about we try a new location this time, like Central Park?","$Raymond$: Central Park sounds good! I’m also available Sunday afternoon, so that works.","$Heather$: Same here! Sunday afternoon is perfect. Should we meet around 4 PM to avoid the midday heat?","$Kathleen$: 4 PM sounds ideal. Let’s meet by the main entrance of Central Park. It’s easy to find.","$Katherine$: Great! Do we want to plan a specific route or just go with the flow?","$Martha$: Maybe we can plan a 5K loop to keep it organized, but we can adjust depending on how everyone feels.","$Raymond$: Agreed! I’ll bring a small first-aid kit, just in case, and some extra water.","$Heather$: Awesome! I’ll bring a speaker for some background music while we run. See you all Sunday at 4 PM!"], chatMember: [], description: "description2", cType: "", allowToJoin: false)
        let group3 = myGroup(myGroupID: 3, myGroupName: "GOGO group", memberID: [30,46,60,64,67,80], chatMess: [], chatMember: [], description: "Des3", cType: "", allowToJoin: true)
        
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        
    }
}




var dChallenges:[desginchallenge]=[]
class  desginchallenge{
    var cID:Int
    var cName:String
    var location:String
    var date:String
    var time:String
    var joinedFriend:[Int]
    var distance:Double
    var cType:String
    var cAcquire:String //coupon amount Or Money amount
    var cDescrible:String //the discription of this Challenge
    
    init(cID: Int, cName: String, location: String, date: String, time: String, joinedFriend: [Int], distance: Double, cType: String, cAcquire: String, cDescrible: String) {
        self.cID = cID
        self.cName = cName
        self.location = location
        self.date = date
        self.time = time
        self.joinedFriend = joinedFriend
        self.distance = distance
        self.cType = cType
        self.cAcquire = cAcquire
        self.cDescrible = cDescrible
    }
}




var userName:String=""//record login userName
var userLevel:Int = 3
var joinedGroup: [String] = ["3","7","9"]
var friendList:[Int] = [12,15,17,30,46,60,64,67,80,91,96,110]
var headLogin:String = ""
var paiedUser:Bool = false
var tMile = 0.0
var tHour = 0
var tKcal = 0

class challenge{
    var cID:Int
    var cName:String
    var cDistance:Int //distance of goal
    var cFrequence:String //how any day? how many thime.....
    var cMember:Int //number of people in this group
    var cTotalDistance:Double //total amout of dictance
    var cNo1ID:Int //No1 in this group
    var cType:String //coupon or money
    var cAcquire:String //coupon amount Or Money amount
    var cDescrible:String //the discription of this Challenge
    var cHardLevel:Int
        
    init(cID: Int, cName: String, cDistance: Int, cFrequence: String, cMember: Int, cTotalDistance: Double, cNo1ID: Int, cType: String, cAcquire: String, cDescrible:String,cHardLevel:Int) {
        self.cID = cID
        self.cName = cName
        self.cDistance = cDistance
        self.cFrequence = cFrequence
        self.cMember = cMember
        self.cTotalDistance = cTotalDistance
        self.cNo1ID = cNo1ID
        self.cType = cType
        self.cAcquire = cAcquire
        self.cDescrible = cDescrible
        self.cHardLevel = cHardLevel
    }
    
}
class cChallenges{
    var couChals:[challenge]=[]
    init()
    {
        
        
        let couC1 = challenge(cID: 1, cName:"Name1", cDistance: 1, cFrequence: "1 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC2 = challenge(cID: 2, cName:"Name1", cDistance: 1, cFrequence: "2 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC3 = challenge(cID: 3, cName:"Name1", cDistance: 1, cFrequence: "3 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC4 = challenge(cID: 4, cName:"Name1", cDistance: 1, cFrequence: "4 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC5 = challenge(cID: 5, cName:"Name1", cDistance: 1, cFrequence: "5 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC6 = challenge(cID: 6, cName:"Name1", cDistance: 1, cFrequence: "6 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC7 = challenge(cID: 7, cName:"Name1", cDistance: 1, cFrequence: "7 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC8 = challenge(cID: 8, cName:"Name1", cDistance: 5, cFrequence: "1 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:2)
        let couC9 = challenge(cID: 9, cName:"Name1", cDistance: 5, cFrequence: "2 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:2)
        let couC10 = challenge(cID: 10, cName:"Name1", cDistance: 5, cFrequence: "3 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:2)
        let couC11 = challenge(cID: 11, cName:"Name1", cDistance: 5, cFrequence: "4 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:2)
        let couC12 = challenge(cID: 12, cName:"Name1", cDistance: 5, cFrequence: "5 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:2)
        let couC13 = challenge(cID: 13, cName:"Name1", cDistance: 5, cFrequence: "6 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:2)
        let couC14 = challenge(cID: 14, cName:"Name1", cDistance: 5, cFrequence: "7 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:3)
        let couC15 = challenge(cID: 15, cName:"Name1", cDistance: 10, cFrequence: "1 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:3)
        let couC16 = challenge(cID: 16, cName:"Name1", cDistance: 10, cFrequence: "2 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:3)
        let couC17 = challenge(cID: 17, cName:"Name1", cDistance: 10, cFrequence: "3 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:3)
        let couC18 = challenge(cID: 18, cName:"Name1", cDistance: 10, cFrequence: "4 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:4)
        let couC19 = challenge(cID: 19, cName:"Name1", cDistance: 10, cFrequence: "5 Times a Week", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:4)
        let couC20 = challenge(cID: 20, cName:"Name7", cDistance: 10, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC21 = challenge(cID: 21, cName:"Name8", cDistance: 20, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "15% off", cDescrible: "Description1",cHardLevel:1)
        let couC22 = challenge(cID: 22, cName:"Name9", cDistance: 30, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "18% off", cDescrible: "Description1",cHardLevel:1)
        let couC23 = challenge(cID: 23, cName:"Name10", cDistance: 40, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:1)
        let couC24 = challenge(cID: 24, cName:"Name10", cDistance: 50, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:2)
        let couC25 = challenge(cID: 25, cName:"Name10", cDistance: 60, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:2)
        let couC26 = challenge(cID: 26, cName:"Name10", cDistance: 70, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:2)
        let couC27 = challenge(cID: 27, cName:"Name10", cDistance: 80, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:2)
        let couC28 = challenge(cID: 28, cName:"Name10", cDistance: 90, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:3)
        let couC29 = challenge(cID: 29, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Coupon", cAcquire: "20% off", cDescrible: "Description1",cHardLevel:3)
        let couC30 = challenge(cID: 30, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 40.00, cNo1ID: 1, cType: "Money", cAcquire: "$5 join fee", cDescrible: "Description1",cHardLevel:4)
        let couC31 = challenge(cID: 31, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 50.00, cNo1ID: 1, cType: "Money", cAcquire: "10 join fee", cDescrible: "Description1",cHardLevel:1)
        let couC32 = challenge(cID: 32, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 60.00, cNo1ID: 1, cType: "Money", cAcquire: "$5 join fee", cDescrible: "Description1",cHardLevel:2)
        let couC33 = challenge(cID: 33, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 70.00, cNo1ID: 1, cType: "Money", cAcquire: "$10 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC34 = challenge(cID: 34, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 80.00, cNo1ID: 1, cType: "Money", cAcquire: "$15 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC35 = challenge(cID: 35, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 90.00, cNo1ID: 1, cType: "Money", cAcquire: "$25 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC36 = challenge(cID: 36, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 100.00, cNo1ID: 1, cType: "Money", cAcquire: "$15 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC37 = challenge(cID: 37, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 110.00, cNo1ID: 1, cType: "Money", cAcquire: "$10 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC38 = challenge(cID: 38, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 120.00, cNo1ID: 1, cType: "Money", cAcquire: "$15 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC39 = challenge(cID: 39, cName:"Name10", cDistance: 100, cFrequence: "In 1 month", cMember: 20, cTotalDistance: 130.00, cNo1ID: 1, cType: "Money", cAcquire: "$20 join fee", cDescrible: "Description1",cHardLevel:3)
        let couC40 = challenge(cID: 40, cName:"Name10", cDistance: 1, cFrequence: "1 Times a Week", cMember: 20, cTotalDistance: 130.00, cNo1ID: 1, cType: "Money", cAcquire: "$5 join fee", cDescrible: "Description1",cHardLevel:1)
        couChals.append(couC1)
        couChals.append(couC2)
        couChals.append(couC3)
        couChals.append(couC4)
        couChals.append(couC5)
        couChals.append(couC6)
        couChals.append(couC7)
        couChals.append(couC8)
        couChals.append(couC9)
        couChals.append(couC10)
        couChals.append(couC11)
        couChals.append(couC12)
        couChals.append(couC13)
        couChals.append(couC14)
        couChals.append(couC15)
        couChals.append(couC16)
        couChals.append(couC17)
        couChals.append(couC18)
        couChals.append(couC19)
        couChals.append(couC20)
        couChals.append(couC21)
        couChals.append(couC22)
        couChals.append(couC23)
        couChals.append(couC24)
        couChals.append(couC25)
        couChals.append(couC26)
        couChals.append(couC27)
        couChals.append(couC28)
        couChals.append(couC29)
        couChals.append(couC30)
        couChals.append(couC31)
        couChals.append(couC32)
        couChals.append(couC33)
        couChals.append(couC34)
        couChals.append(couC35)
        couChals.append(couC36)
        couChals.append(couC37)
        couChals.append(couC38)
        couChals.append(couC39)
        couChals.append(couC40)
    }

    
    
}

class user{
    var uID:Int
    var uName:String
    var uGroups:[Int]
    var uPhone:Int
    var uWeekMiles:Double
    var uEmail:String
    var uPassword:String
    var uLevel:Int
    var sex:String
    var headImage:String
    
    init(uID: Int, uName: String, uGroups: [Int], uPhone: Int, uWeekMiles: Double, uEmail: String, uPassword: String, uLevel: Int, sex: String, headImage: String) {
        self.uID = uID
        self.uName = uName
        self.uGroups = uGroups
        self.uPhone = uPhone
        self.uWeekMiles = uWeekMiles
        self.uEmail = uEmail
        self.uPassword = uPassword
        self.uLevel = uLevel
        self.sex = sex
        self.headImage = headImage
    }
}
class users{
    var uUsers:[user]=[]
    
    init(){
        let u1=user(uID:1, uName: "James", uGroups:[3,15], uPhone:00112345678, uWeekMiles:28.3103163457786, uEmail: "name1@abc.com", uPassword: "1234", uLevel:3,sex:"M",headImage:"M16")
        let u2=user(uID:2, uName: "Mary", uGroups:[12,10], uPhone:00212345678, uWeekMiles:5.65840526347066, uEmail: "name2@abc.com", uPassword: "1235", uLevel:3,sex:"F",headImage:"F12")
        let u3=user(uID:3, uName: "John", uGroups:[4,20], uPhone:00312345678, uWeekMiles:6.34492539226555, uEmail: "name3@abc.com", uPassword: "1236", uLevel:3,sex:"M",headImage:"M7")
        let u4=user(uID:4, uName: "Patricia", uGroups:[15,7], uPhone:00412345678, uWeekMiles:45.8337910437456, uEmail: "name4@abc.com", uPassword: "1237", uLevel:3,sex:"F",headImage:"F14")
        let u5=user(uID:5, uName: "Robert", uGroups:[4,8], uPhone:00512345678, uWeekMiles:4.30346963797668, uEmail: "name5@abc.com", uPassword: "1238", uLevel:3,sex:"M",headImage:"M18")
        let u6=user(uID:6, uName: "Jennifer", uGroups:[4,11], uPhone:00612345678, uWeekMiles:22.5444669149016, uEmail: "name6@abc.com", uPassword: "1239", uLevel:1,sex:"F",headImage:"F8")
        let u7=user(uID:7, uName: "Michael", uGroups:[11,23], uPhone:00712345678, uWeekMiles:33.9385879802821, uEmail: "name7@abc.com", uPassword: "1240", uLevel:3,sex:"M",headImage:"M14")
        let u8=user(uID:8, uName: "Linda", uGroups:[19,20], uPhone:00812345678, uWeekMiles:36.5709886817415, uEmail: "name8@abc.com", uPassword: "1241", uLevel:2,sex:"F",headImage:"F1")
        let u9=user(uID:9, uName: "William", uGroups:[4,17], uPhone:00912345678, uWeekMiles:36.8441517345822, uEmail: "name9@abc.com", uPassword: "1242", uLevel:1,sex:"M",headImage:"M8")
        let u10=user(uID:10, uName: "Elizabeth", uGroups:[3,7], uPhone:01012345678, uWeekMiles:36.130195677985, uEmail: "name10@abc.com", uPassword: "1243", uLevel:2,sex:"F",headImage:"F2")
        let u11=user(uID:11, uName: "David", uGroups:[19,12], uPhone:01112345678, uWeekMiles:34.1798833571452, uEmail: "name11@abc.com", uPassword: "1244", uLevel:1,sex:"M",headImage:"M16")
        let u12=user(uID:12, uName: "Barbara", uGroups:[2,8], uPhone:01212345678, uWeekMiles:10.1343906318604, uEmail: "name12@abc.com", uPassword: "1245", uLevel:1,sex:"F",headImage:"F3")
        let u13=user(uID:13, uName: "Richard", uGroups:[26,15], uPhone:01312345678, uWeekMiles:48.1365494689341, uEmail: "name13@abc.com", uPassword: "1246", uLevel:3,sex:"M",headImage:"M1")
        let u14=user(uID:14, uName: "Susan", uGroups:[10,3], uPhone:01412345678, uWeekMiles:0.692765209239839, uEmail: "name14@abc.com", uPassword: "1247", uLevel:2,sex:"F",headImage:"F14")
        let u15=user(uID:15, uName: "Joseph", uGroups:[17,5], uPhone:01512345678, uWeekMiles:27.0460904361936, uEmail: "name15@abc.com", uPassword: "1248", uLevel:3,sex:"M",headImage:"M8")
        let u16=user(uID:16, uName: "Jessica", uGroups:[23,12], uPhone:01612345678, uWeekMiles:0.696179097367728, uEmail: "name16@abc.com", uPassword: "1249", uLevel:2,sex:"F",headImage:"F10")
        let u17=user(uID:17, uName: "Thomas", uGroups:[26,8], uPhone:01712345678, uWeekMiles:17.7597962272417, uEmail: "name17@abc.com", uPassword: "1250", uLevel:1,sex:"M",headImage:"M4")
        let u18=user(uID:18, uName: "Sarah", uGroups:[12,4], uPhone:01812345678, uWeekMiles:36.0181153681454, uEmail: "name18@abc.com", uPassword: "1251", uLevel:1,sex:"F",headImage:"F12")
        let u19=user(uID:19, uName: "Charles", uGroups:[23,3], uPhone:01912345678, uWeekMiles:22.2081811256059, uEmail: "name19@abc.com", uPassword: "1252", uLevel:2,sex:"M",headImage:"M16")
        let u20=user(uID:20, uName: "Karen", uGroups:[14,3], uPhone:02012345678, uWeekMiles:45.175995405834, uEmail: "name20@abc.com", uPassword: "1253", uLevel:2,sex:"F",headImage:"F13")
        let u21=user(uID:21, uName: "Christopher", uGroups:[2,3], uPhone:02112345678, uWeekMiles:11.2071785371114, uEmail: "name21@abc.com", uPassword: "1254", uLevel:2,sex:"M",headImage:"M2")
        let u22=user(uID:22, uName: "Nancy", uGroups:[24,25], uPhone:02212345678, uWeekMiles:30.8964736010874, uEmail: "name22@abc.com", uPassword: "1255", uLevel:3,sex:"F",headImage:"F5")
        let u23=user(uID:23, uName: "Daniel", uGroups:[9,3], uPhone:02312345678, uWeekMiles:42.5847313481396, uEmail: "name23@abc.com", uPassword: "1256", uLevel:2,sex:"M",headImage:"M9")
        let u24=user(uID:24, uName: "Lisa", uGroups:[18,8], uPhone:02412345678, uWeekMiles:9.98922805378943, uEmail: "name24@abc.com", uPassword: "1257", uLevel:3,sex:"F",headImage:"F8")
        let u25=user(uID:25, uName: "Matthew", uGroups:[11,3], uPhone:02512345678, uWeekMiles:42.0555838708604, uEmail: "name25@abc.com", uPassword: "1258", uLevel:3,sex:"M",headImage:"M4")
        let u26=user(uID:26, uName: "Betty", uGroups:[6,8], uPhone:02612345678, uWeekMiles:35.3647034203058, uEmail: "name26@abc.com", uPassword: "1259", uLevel:3,sex:"F",headImage:"F9")
        let u27=user(uID:27, uName: "Anthony", uGroups:[14,9], uPhone:02712345678, uWeekMiles:35.8090919350661, uEmail: "name27@abc.com", uPassword: "1260", uLevel:3,sex:"M",headImage:"M18")
        let u28=user(uID:28, uName: "Margaret", uGroups:[1,14], uPhone:02812345678, uWeekMiles:18.117980615318, uEmail: "name28@abc.com", uPassword: "1261", uLevel:3,sex:"F",headImage:"F6")
        let u29=user(uID:29, uName: "Mark", uGroups:[26,15], uPhone:02912345678, uWeekMiles:48.9089536630507, uEmail: "name29@abc.com", uPassword: "1262", uLevel:1,sex:"M",headImage:"M3")
        let u30=user(uID:30, uName: "Sandra", uGroups:[21,7], uPhone:03012345678, uWeekMiles:46.680621868168, uEmail: "name30@abc.com", uPassword: "1263", uLevel:2,sex:"F",headImage:"F14")
        let u31=user(uID:31, uName: "Donald", uGroups:[8,16], uPhone:03112345678, uWeekMiles:39.8337701235424, uEmail: "name31@abc.com", uPassword: "1264", uLevel:1,sex:"M",headImage:"M9")
        let u32=user(uID:32, uName: "Ashley", uGroups:[6,4], uPhone:03212345678, uWeekMiles:43.104154663287, uEmail: "name32@abc.com", uPassword: "1265", uLevel:2,sex:"F",headImage:"F15")
        let u33=user(uID:33, uName: "Steven", uGroups:[25,3], uPhone:03312345678, uWeekMiles:22.9191630845088, uEmail: "name33@abc.com", uPassword: "1266", uLevel:3,sex:"M",headImage:"M1")
        let u34=user(uID:34, uName: "Kimberly", uGroups:[2,6], uPhone:03412345678, uWeekMiles:2.95500153232544, uEmail: "name34@abc.com", uPassword: "1267", uLevel:1,sex:"F",headImage:"F11")
        let u35=user(uID:35, uName: "Paul", uGroups:[12,2], uPhone:03512345678, uWeekMiles:44.5282513912527, uEmail: "name35@abc.com", uPassword: "1268", uLevel:2,sex:"M",headImage:"M6")
        let u36=user(uID:36, uName: "Emily", uGroups:[21,5], uPhone:03612345678, uWeekMiles:16.6281592251734, uEmail: "name36@abc.com", uPassword: "1269", uLevel:3,sex:"F",headImage:"F13")
        let u37=user(uID:37, uName: "Andrew", uGroups:[8,26], uPhone:03712345678, uWeekMiles:14.5538620635813, uEmail: "name37@abc.com", uPassword: "1270", uLevel:3,sex:"M",headImage:"M6")
        let u38=user(uID:38, uName: "Donna", uGroups:[23,19], uPhone:03812345678, uWeekMiles:43.7441937487944, uEmail: "name38@abc.com", uPassword: "1271", uLevel:3,sex:"F",headImage:"F9")
        let u39=user(uID:39, uName: "Joshua", uGroups:[16,17], uPhone:03912345678, uWeekMiles:43.0148669886498, uEmail: "name39@abc.com", uPassword: "1272", uLevel:3,sex:"M",headImage:"M18")
        let u40=user(uID:40, uName: "Michelle", uGroups:[16,21], uPhone:04012345678, uWeekMiles:4.710423119739, uEmail: "name40@abc.com", uPassword: "1273", uLevel:1,sex:"F",headImage:"F14")
        let u41=user(uID:41, uName: "Kenneth", uGroups:[25,19], uPhone:04112345678, uWeekMiles:0.491676175254785, uEmail: "name41@abc.com", uPassword: "1274", uLevel:3,sex:"M",headImage:"M13")
        let u42=user(uID:42, uName: "Carol", uGroups:[24,4], uPhone:04212345678, uWeekMiles:27.4385853076126, uEmail: "name42@abc.com", uPassword: "1275", uLevel:2,sex:"F",headImage:"F10")
        let u43=user(uID:43, uName: "Kevin", uGroups:[17,3], uPhone:04312345678, uWeekMiles:35.6770416439713, uEmail: "name43@abc.com", uPassword: "1276", uLevel:3,sex:"M",headImage:"M10")
        let u44=user(uID:44, uName: "Amanda", uGroups:[4,13], uPhone:04412345678, uWeekMiles:48.4522595893274, uEmail: "name44@abc.com", uPassword: "1277", uLevel:2,sex:"F",headImage:"F9")
        let u45=user(uID:45, uName: "Brian", uGroups:[18,3], uPhone:04512345678, uWeekMiles:15.4694833195827, uEmail: "name45@abc.com", uPassword: "1278", uLevel:2,sex:"M",headImage:"M1")
        let u46=user(uID:46, uName: "Melissa", uGroups:[6,19], uPhone:04612345678, uWeekMiles:16.0874951116972, uEmail: "name46@abc.com", uPassword: "1279", uLevel:1,sex:"F",headImage:"F9")
        let u47=user(uID:47, uName: "George", uGroups:[25,2], uPhone:04712345678, uWeekMiles:11.8146188553079, uEmail: "name47@abc.com", uPassword: "1280", uLevel:2,sex:"M",headImage:"M11")
        let u48=user(uID:48, uName: "Deborah", uGroups:[3,23], uPhone:04812345678, uWeekMiles:37.2338987354722, uEmail: "name48@abc.com", uPassword: "1281", uLevel:2,sex:"F",headImage:"F1")
        let u49=user(uID:49, uName: "Edward", uGroups:[12,18], uPhone:04912345678, uWeekMiles:39.0826930322211, uEmail: "name49@abc.com", uPassword: "1282", uLevel:3,sex:"M",headImage:"M7")
        let u50=user(uID:50, uName: "Stephanie", uGroups:[2,6], uPhone:05012345678, uWeekMiles:33.3248023165489, uEmail: "name50@abc.com", uPassword: "1283", uLevel:3,sex:"F",headImage:"F9")
        let u51=user(uID:51, uName: "Ronald", uGroups:[10,7], uPhone:05112345678, uWeekMiles:1.84727659957106, uEmail: "name51@abc.com", uPassword: "1284", uLevel:3,sex:"M",headImage:"M7")
        let u52=user(uID:52, uName: "Rebecca", uGroups:[7,20], uPhone:05212345678, uWeekMiles:22.461482671415, uEmail: "name52@abc.com", uPassword: "1285", uLevel:1,sex:"F",headImage:"F11")
        let u53=user(uID:53, uName: "Timothy", uGroups:[1,24], uPhone:05312345678, uWeekMiles:38.2537225260611, uEmail: "name53@abc.com", uPassword: "1286", uLevel:3,sex:"M",headImage:"M16")
        let u54=user(uID:54, uName: "Laura", uGroups:[13,4], uPhone:05412345678, uWeekMiles:46.6314685500847, uEmail: "name54@abc.com", uPassword: "1287", uLevel:2,sex:"F",headImage:"F15")
        let u55=user(uID:55, uName: "Jason", uGroups:[11,22], uPhone:05512345678, uWeekMiles:26.018158181539, uEmail: "name55@abc.com", uPassword: "1288", uLevel:3,sex:"M",headImage:"M16")
        let u56=user(uID:56, uName: "Sharon", uGroups:[23,4], uPhone:05612345678, uWeekMiles:33.540755655688, uEmail: "name56@abc.com", uPassword: "1289", uLevel:3,sex:"F",headImage:"F9")
        let u57=user(uID:57, uName: "Jeffrey", uGroups:[3,21], uPhone:05712345678, uWeekMiles:12.5688225140609, uEmail: "name57@abc.com", uPassword: "1290", uLevel:2,sex:"M",headImage:"M6")
        let u58=user(uID:58, uName: "Cynthia", uGroups:[21,1], uPhone:05812345678, uWeekMiles:33.4498207583888, uEmail: "name58@abc.com", uPassword: "1291", uLevel:3,sex:"F",headImage:"F1")
        let u59=user(uID:59, uName: "Ryan", uGroups:[13,23], uPhone:05912345678, uWeekMiles:46.2633690853963, uEmail: "name59@abc.com", uPassword: "1292", uLevel:2,sex:"M",headImage:"M3")
        let u60=user(uID:60, uName: "Kathleen", uGroups:[24,11], uPhone:06012345678, uWeekMiles:7.05234766356501, uEmail: "name60@abc.com", uPassword: "1293", uLevel:1,sex:"F",headImage:"F8")
        let u61=user(uID:61, uName: "Jacob", uGroups:[2,10], uPhone:06112345678, uWeekMiles:27.0252695295753, uEmail: "name61@abc.com", uPassword: "1294", uLevel:3,sex:"M",headImage:"M8")
        let u62=user(uID:62, uName: "Amy", uGroups:[11,16], uPhone:06212345678, uWeekMiles:23.4907796471772, uEmail: "name62@abc.com", uPassword: "1295", uLevel:2,sex:"F",headImage:"F1")
        let u63=user(uID:63, uName: "Gary", uGroups:[10,6], uPhone:06312345678, uWeekMiles:7.85883433605138, uEmail: "name63@abc.com", uPassword: "1296", uLevel:1,sex:"M",headImage:"M14")
        let u64=user(uID:64, uName: "Shirley", uGroups:[9,24], uPhone:06412345678, uWeekMiles:8.57424129858273, uEmail: "name64@abc.com", uPassword: "1297", uLevel:2,sex:"F",headImage:"F4")
        let u65=user(uID:65, uName: "Nicholas", uGroups:[20,19], uPhone:06512345678, uWeekMiles:42.8889756498619, uEmail: "name65@abc.com", uPassword: "1298", uLevel:3,sex:"M",headImage:"M5")
        let u66=user(uID:66, uName: "Angela", uGroups:[10,4], uPhone:06612345678, uWeekMiles:23.9442221286934, uEmail: "name66@abc.com", uPassword: "1299", uLevel:1,sex:"F",headImage:"F10")
        let u67=user(uID:67, uName: "Eric", uGroups:[23,6], uPhone:06712345678, uWeekMiles:16.8085879169123, uEmail: "name67@abc.com", uPassword: "1300", uLevel:2,sex:"M",headImage:"M14")
        let u68=user(uID:68, uName: "Helen", uGroups:[25,1], uPhone:06812345678, uWeekMiles:25.7591649977954, uEmail: "name68@abc.com", uPassword: "1301", uLevel:2,sex:"F",headImage:"F3")
        let u69=user(uID:69, uName: "Jonathan", uGroups:[2,10], uPhone:06912345678, uWeekMiles:49.7829248431595, uEmail: "name69@abc.com", uPassword: "1302", uLevel:1,sex:"M",headImage:"M18")
        let u70=user(uID:70, uName: "Anna", uGroups:[11,24], uPhone:07012345678, uWeekMiles:10.8930602887224, uEmail: "name70@abc.com", uPassword: "1303", uLevel:3,sex:"F",headImage:"F12")
        let u71=user(uID:71, uName: "Stephen", uGroups:[24,18], uPhone:07112345678, uWeekMiles:19.1536496982698, uEmail: "name71@abc.com", uPassword: "1304", uLevel:2,sex:"M",headImage:"M9")
        let u72=user(uID:72, uName: "Brenda", uGroups:[12,16], uPhone:07212345678, uWeekMiles:46.0178559351573, uEmail: "name72@abc.com", uPassword: "1305", uLevel:1,sex:"F",headImage:"F11")
        let u73=user(uID:73, uName: "Larry", uGroups:[2,14], uPhone:07312345678, uWeekMiles:4.21906401070769, uEmail: "name73@abc.com", uPassword: "1306", uLevel:1,sex:"M",headImage:"M15")
        let u74=user(uID:74, uName: "Pamela", uGroups:[3,25], uPhone:07412345678, uWeekMiles:4.99756851580741, uEmail: "name74@abc.com", uPassword: "1307", uLevel:1,sex:"F",headImage:"F9")
        let u75=user(uID:75, uName: "Justin", uGroups:[12,16], uPhone:07512345678, uWeekMiles:34.3531858605936, uEmail: "name75@abc.com", uPassword: "1308", uLevel:3,sex:"M",headImage:"M18")
        let u76=user(uID:76, uName: "Nicole", uGroups:[23,2], uPhone:07612345678, uWeekMiles:10.9175049234321, uEmail: "name76@abc.com", uPassword: "1309", uLevel:1,sex:"F",headImage:"F10")
        let u77=user(uID:77, uName: "Scott", uGroups:[25,5], uPhone:07712345678, uWeekMiles:46.0953477280462, uEmail: "name77@abc.com", uPassword: "1310", uLevel:3,sex:"M",headImage:"M14")
        let u78=user(uID:78, uName: "Samantha", uGroups:[7,17], uPhone:07812345678, uWeekMiles:17.5512407491465, uEmail: "name78@abc.com", uPassword: "1311", uLevel:2,sex:"F",headImage:"F15")
        let u79=user(uID:79, uName: "Brandon", uGroups:[26,20], uPhone:07912345678, uWeekMiles:20.8459718106559, uEmail: "name79@abc.com", uPassword: "1312", uLevel:3,sex:"M",headImage:"M1")
        let u80=user(uID:80, uName: "Katherine", uGroups:[4,15], uPhone:08012345678, uWeekMiles:13.6873294857779, uEmail: "name80@abc.com", uPassword: "1313", uLevel:3,sex:"F",headImage:"F13")
        let u81=user(uID:81, uName: "Benjamin", uGroups:[13,20], uPhone:08112345678, uWeekMiles:5.05108450838304, uEmail: "name81@abc.com", uPassword: "1314", uLevel:1,sex:"M",headImage:"M5")
        let u82=user(uID:82, uName: "Christine", uGroups:[4,14], uPhone:08212345678, uWeekMiles:21.3120459562094, uEmail: "name82@abc.com", uPassword: "1315", uLevel:1,sex:"F",headImage:"F12")
        let u83=user(uID:83, uName: "Samuel", uGroups:[11,6], uPhone:08312345678, uWeekMiles:47.7639485019293, uEmail: "name83@abc.com", uPassword: "1316", uLevel:3,sex:"M",headImage:"M16")
        let u84=user(uID:84, uName: "Debra", uGroups:[14,4], uPhone:08412345678, uWeekMiles:23.3128521043258, uEmail: "name84@abc.com", uPassword: "1317", uLevel:1,sex:"F",headImage:"F7")
        let u85=user(uID:85, uName: "Frank", uGroups:[19,26], uPhone:08512345678, uWeekMiles:31.9468908601831, uEmail: "name85@abc.com", uPassword: "1318", uLevel:2,sex:"M",headImage:"M1")
        let u86=user(uID:86, uName: "Rachel", uGroups:[11,19], uPhone:08612345678, uWeekMiles:39.0944883426746, uEmail: "name86@abc.com", uPassword: "1319", uLevel:2,sex:"F",headImage:"F4")
        let u87=user(uID:87, uName: "Greg", uGroups:[19,4], uPhone:08712345678, uWeekMiles:9.38932400743836, uEmail: "name87@abc.com", uPassword: "1320", uLevel:1,sex:"M",headImage:"M15")
        let u88=user(uID:88, uName: "Carolyn", uGroups:[6,24], uPhone:08812345678, uWeekMiles:15.7729947454855, uEmail: "name88@abc.com", uPassword: "1321", uLevel:2,sex:"F",headImage:"F1")
        let u89=user(uID:89, uName: "Alexander", uGroups:[26,23], uPhone:08912345678, uWeekMiles:29.5989855120869, uEmail: "name89@abc.com", uPassword: "1322", uLevel:2,sex:"M",headImage:"M4")
        let u90=user(uID:90, uName: "Janet", uGroups:[12,19], uPhone:09012345678, uWeekMiles:38.5983431952184, uEmail: "name90@abc.com", uPassword: "1323", uLevel:1,sex:"F",headImage:"F11")
        let u91=user(uID:91, uName: "Raymond", uGroups:[19,2], uPhone:09112345678, uWeekMiles:34.5313388803177, uEmail: "name91@abc.com", uPassword: "1324", uLevel:3,sex:"M",headImage:"M5")
        let u92=user(uID:92, uName: "Catherine", uGroups:[19,14], uPhone:09212345678, uWeekMiles:39.794830315308, uEmail: "name92@abc.com", uPassword: "1325", uLevel:2,sex:"F",headImage:"F15")
        let u93=user(uID:93, uName: "Patrick", uGroups:[2,13], uPhone:09312345678, uWeekMiles:33.0349233446717, uEmail: "name93@abc.com", uPassword: "1326", uLevel:1,sex:"M",headImage:"M10")
        let u94=user(uID:94, uName: "Maria", uGroups:[21,17], uPhone:09412345678, uWeekMiles:1.38860648475735, uEmail: "name94@abc.com", uPassword: "1327", uLevel:3,sex:"F",headImage:"F12")
        let u95=user(uID:95, uName: "Jack", uGroups:[17,1], uPhone:09512345678, uWeekMiles:19.1756706502344, uEmail: "name95@abc.com", uPassword: "1328", uLevel:3,sex:"M",headImage:"M6")
        let u96=user(uID:96, uName: "Heather", uGroups:[11,3], uPhone:09612345678, uWeekMiles:6.91141521016512, uEmail: "name96@abc.com", uPassword: "1329", uLevel:3,sex:"F",headImage:"F11")
        let u97=user(uID:97, uName: "Dennis", uGroups:[7,4], uPhone:09712345678, uWeekMiles:6.35420678381433, uEmail: "name97@abc.com", uPassword: "1330", uLevel:2,sex:"M",headImage:"M13")
        let u98=user(uID:98, uName: "Diane", uGroups:[25,13], uPhone:09812345678, uWeekMiles:26.9004580548689, uEmail: "name98@abc.com", uPassword: "1331", uLevel:1,sex:"F",headImage:"F9")
        let u99=user(uID:99, uName: "Jerry", uGroups:[16,2], uPhone:09912345678, uWeekMiles:3.98822357969037, uEmail: "name99@abc.com", uPassword: "1332", uLevel:3,sex:"M",headImage:"M8")
        let u100=user(uID:100, uName: "Julie", uGroups:[9,25], uPhone:10012345678, uWeekMiles:17.3361407220324, uEmail: "name100@abc.com", uPassword: "1333", uLevel:2,sex:"F",headImage:"F13")
        let u101=user(uID:101, uName: "Tyler", uGroups:[17,16], uPhone:10112345678, uWeekMiles:6.92866708717749, uEmail: "name101@abc.com", uPassword: "1334", uLevel:2,sex:"M",headImage:"M5")
        let u102=user(uID:102, uName: "Joyce", uGroups:[3,17], uPhone:10212345678, uWeekMiles:12.9846396698539, uEmail: "name102@abc.com", uPassword: "1335", uLevel:3,sex:"F",headImage:"F15")
        let u103=user(uID:103, uName: "Aaron", uGroups:[7,16], uPhone:10312345678, uWeekMiles:48.1638139344613, uEmail: "name103@abc.com", uPassword: "1336", uLevel:1,sex:"M",headImage:"M18")
        let u104=user(uID:104, uName: "Victoria", uGroups:[11,23], uPhone:10412345678, uWeekMiles:28.3180964249948, uEmail: "name104@abc.com", uPassword: "1337", uLevel:2,sex:"F",headImage:"F13")
        let u105=user(uID:105, uName: "Henry", uGroups:[11,10], uPhone:10512345678, uWeekMiles:0.41336037275107, uEmail: "name105@abc.com", uPassword: "1338", uLevel:1,sex:"M",headImage:"M18")
        let u106=user(uID:106, uName: "Kelly", uGroups:[13,8], uPhone:10612345678, uWeekMiles:33.0349420769902, uEmail: "name106@abc.com", uPassword: "1339", uLevel:1,sex:"F",headImage:"F6")
        let u107=user(uID:107, uName: "Adam", uGroups:[25,14], uPhone:10712345678, uWeekMiles:28.64817069361, uEmail: "name107@abc.com", uPassword: "1340", uLevel:1,sex:"M",headImage:"M1")
        let u108=user(uID:108, uName: "Lauren", uGroups:[10,6], uPhone:10812345678, uWeekMiles:47.9554204711423, uEmail: "name108@abc.com", uPassword: "1341", uLevel:1,sex:"F",headImage:"F1")
        let u109=user(uID:109, uName: "Douglas", uGroups:[17,4], uPhone:10912345678, uWeekMiles:44.5134047907014, uEmail: "name109@abc.com", uPassword: "1342", uLevel:3,sex:"M",headImage:"M8")
        let u110=user(uID:110, uName: "Martha", uGroups:[24,10], uPhone:11012345678, uWeekMiles:26.206329463856, uEmail: "name110@abc.com", uPassword: "1343", uLevel:3,sex:"F",headImage:"F2")
        let u111=user(uID:111, uName: "Nathan", uGroups:[20,7], uPhone:11112345678, uWeekMiles:22.1315124046448, uEmail: "name111@abc.com", uPassword: "1344", uLevel:2,sex:"M",headImage:"M14")
        let u112=user(uID:112, uName: "Christina", uGroups:[24,26], uPhone:11212345678, uWeekMiles:3.13840737160045, uEmail: "name112@abc.com", uPassword: "1345", uLevel:2,sex:"F",headImage:"F12")
        let u113=user(uID:113, uName: "Zachary", uGroups:[11,2], uPhone:11312345678, uWeekMiles:5.79349301622348, uEmail: "name113@abc.com", uPassword: "1346", uLevel:2,sex:"M",headImage:"M1")
        let u114=user(uID:114, uName: "Frances", uGroups:[14,2], uPhone:11412345678, uWeekMiles:28.8444352187952, uEmail: "name114@abc.com", uPassword: "1347", uLevel:1,sex:"F",headImage:"F3")
        let u115=user(uID:115, uName: "Peter", uGroups:[22,15], uPhone:11512345678, uWeekMiles:18.6927007102444, uEmail: "name115@abc.com", uPassword: "1348", uLevel:3,sex:"M",headImage:"M13")
        let u116=user(uID:116, uName: "Gloria", uGroups:[19,15], uPhone:11612345678, uWeekMiles:25.9265224223565, uEmail: "name116@abc.com", uPassword: "1349", uLevel:2,sex:"F",headImage:"F6")
        let u117=user(uID:117, uName: "Kyle", uGroups:[13,17], uPhone:11712345678, uWeekMiles:31.2905590924998, uEmail: "name117@abc.com", uPassword: "1350", uLevel:3,sex:"M",headImage:"M6")
        let u118=user(uID:118, uName: "Ann", uGroups:[2,21], uPhone:11812345678, uWeekMiles:36.2098471529909, uEmail: "name118@abc.com", uPassword: "1351", uLevel:1,sex:"F",headImage:"F15")
        let u119=user(uID:119, uName: "Walter", uGroups:[11,18], uPhone:11912345678, uWeekMiles:16.9795671293559, uEmail: "name119@abc.com", uPassword: "1352", uLevel:3,sex:"M",headImage:"M3")
        let u120=user(uID:120, uName: "Teresa", uGroups:[24,19], uPhone:12012345678, uWeekMiles:28.9996988006389, uEmail: "name120@abc.com", uPassword: "1353", uLevel:3,sex:"F",headImage:"F11")
        let u121=user(uID:121, uName: "Ethan", uGroups:[4,2], uPhone:12112345678, uWeekMiles:42.3770580561209, uEmail: "name121@abc.com", uPassword: "1354", uLevel:1,sex:"M",headImage:"M13")
        let u122=user(uID:122, uName: "Sara", uGroups:[20,5], uPhone:12212345678, uWeekMiles:39.49248328068, uEmail: "name122@abc.com", uPassword: "1355", uLevel:3,sex:"F",headImage:"F3")
        let u123=user(uID:123, uName: "Jeremy", uGroups:[17,5], uPhone:12312345678, uWeekMiles:30.8374017856027, uEmail: "name123@abc.com", uPassword: "1356", uLevel:2,sex:"M",headImage:"M14")
        let u124=user(uID:124, uName: "Janice", uGroups:[23,13], uPhone:12412345678, uWeekMiles:32.9227585090863, uEmail: "name124@abc.com", uPassword: "1357", uLevel:1,sex:"F",headImage:"F4")
        let u125=user(uID:125, uName: "Harold", uGroups:[15,22], uPhone:12512345678, uWeekMiles:49.2677615947761, uEmail: "name125@abc.com", uPassword: "1358", uLevel:3,sex:"M",headImage:"M17")
        let u126=user(uID:126, uName: "Judith", uGroups:[9,26], uPhone:12612345678, uWeekMiles:45.4832132792857, uEmail: "name126@abc.com", uPassword: "1359", uLevel:2,sex:"F",headImage:"F11")
        let u127=user(uID:127, uName: "Christian", uGroups:[22,25], uPhone:12712345678, uWeekMiles:3.80434861822825, uEmail: "name127@abc.com", uPassword: "1360", uLevel:2,sex:"M",headImage:"M2")
        let u128=user(uID:128, uName: "Megan", uGroups:[25,4], uPhone:12812345678, uWeekMiles:32.5395871455567, uEmail: "name128@abc.com", uPassword: "1361", uLevel:1,sex:"F",headImage:"F1")
        let u129=user(uID:129, uName: "Austin", uGroups:[10,19], uPhone:12912345678, uWeekMiles:8.60219635488565, uEmail: "name129@abc.com", uPassword: "1362", uLevel:3,sex:"M",headImage:"M12")
        let u130=user(uID:130, uName: "Alice", uGroups:[6,14], uPhone:13012345678, uWeekMiles:20.6308155584379, uEmail: "name130@abc.com", uPassword: "1363", uLevel:2,sex:"F",headImage:"F5")
        let u131=user(uID:131, uName: "Joe", uGroups:[15,24], uPhone:13112345678, uWeekMiles:26.5662880775051, uEmail: "name131@abc.com", uPassword: "1364", uLevel:2,sex:"M",headImage:"M11")
        let u132=user(uID:132, uName: "Doris", uGroups:[4,22], uPhone:13212345678, uWeekMiles:46.8502184951462, uEmail: "name132@abc.com", uPassword: "1365", uLevel:2,sex:"F",headImage:"F1")
        let u133=user(uID:133, uName: "Sean", uGroups:[21,9], uPhone:13312345678, uWeekMiles:46.0008518038686, uEmail: "name133@abc.com", uPassword: "1366", uLevel:2,sex:"M",headImage:"M1")
        let u134=user(uID:134, uName: "Jean", uGroups:[14,1], uPhone:13412345678, uWeekMiles:39.9356000951527, uEmail: "name134@abc.com", uPassword: "1367", uLevel:1,sex:"F",headImage:"F14")
        let u135=user(uID:135, uName: "Billy", uGroups:[21,23], uPhone:13512345678, uWeekMiles:18.3867887790692, uEmail: "name135@abc.com", uPassword: "1368", uLevel:1,sex:"M",headImage:"M7")
        let u136=user(uID:136, uName: "Jacqueline", uGroups:[23,15], uPhone:13612345678, uWeekMiles:6.34493190824575, uEmail: "name136@abc.com", uPassword: "1369", uLevel:3,sex:"F",headImage:"F2")
        let u137=user(uID:137, uName: "Bruce", uGroups:[18,5], uPhone:13712345678, uWeekMiles:15.5168357202264, uEmail: "name137@abc.com", uPassword: "1370", uLevel:2,sex:"M",headImage:"M8")
        let u138=user(uID:138, uName: "Kathy", uGroups:[15,4], uPhone:13812345678, uWeekMiles:1.33823246803928, uEmail: "name138@abc.com", uPassword: "1371", uLevel:2,sex:"F",headImage:"F9")
        let u139=user(uID:139, uName: "Ralph", uGroups:[17,19], uPhone:13912345678, uWeekMiles:47.1892164074613, uEmail: "name139@abc.com", uPassword: "1372", uLevel:1,sex:"M",headImage:"M18")
        let u140=user(uID:140, uName: "Rose", uGroups:[26,9], uPhone:14012345678, uWeekMiles:10.1692622295994, uEmail: "name140@abc.com", uPassword: "1373", uLevel:3,sex:"F",headImage:"F13")
        let u141=user(uID:141, uName: "Roy", uGroups:[1,10], uPhone:14112345678, uWeekMiles:7.27847340527416, uEmail: "name141@abc.com", uPassword: "1374", uLevel:3,sex:"M",headImage:"M13")
        let u142=user(uID:142, uName: "Theresa", uGroups:[21,11], uPhone:14212345678, uWeekMiles:32.8960108726508, uEmail: "name142@abc.com", uPassword: "1375", uLevel:3,sex:"F",headImage:"F2")
        let u143=user(uID:143, uName: "Jordan", uGroups:[6,23], uPhone:14312345678, uWeekMiles:32.9819020842492, uEmail: "name143@abc.com", uPassword: "1376", uLevel:3,sex:"M",headImage:"M6")
        let u144=user(uID:144, uName: "Marilyn", uGroups:[10,3], uPhone:14412345678, uWeekMiles:13.8157197151514, uEmail: "name144@abc.com", uPassword: "1377", uLevel:1,sex:"F",headImage:"F11")
        let u145=user(uID:145, uName: "Wayne", uGroups:[25,1], uPhone:14512345678, uWeekMiles:45.7594254297605, uEmail: "name145@abc.com", uPassword: "1378", uLevel:2,sex:"M",headImage:"M11")
        let u146=user(uID:146, uName: "Beverly", uGroups:[11,14], uPhone:14612345678, uWeekMiles:11.6213760142264, uEmail: "name146@abc.com", uPassword: "1379", uLevel:3,sex:"F",headImage:"F8")
        let u147=user(uID:147, uName: "Albert", uGroups:[9,4], uPhone:14712345678, uWeekMiles:33.8851661769418, uEmail: "name147@abc.com", uPassword: "1380", uLevel:3,sex:"M",headImage:"M6")
        let u148=user(uID:148, uName: "Denise", uGroups:[25,7], uPhone:14812345678, uWeekMiles:39.5700748679139, uEmail: "name148@abc.com", uPassword: "1381", uLevel:3,sex:"F",headImage:"F5")
        let u149=user(uID:149, uName: "Jesse", uGroups:[3,24], uPhone:14912345678, uWeekMiles:38.7781894973532, uEmail: "name149@abc.com", uPassword: "1382", uLevel:2,sex:"M",headImage:"M10")
        let u150=user(uID:150, uName: "Mildred", uGroups:[26,7], uPhone:15012345678, uWeekMiles:45.5289710939781, uEmail: "name150@abc.com", uPassword: "1383", uLevel:1,sex:"F",headImage:"F4")
      
      
        uUsers.append(u1)
        uUsers.append(u2)
        uUsers.append(u3)
        uUsers.append(u4)
        uUsers.append(u5)
        uUsers.append(u6)
        uUsers.append(u7)
        uUsers.append(u8)
        uUsers.append(u9)
        uUsers.append(u10)
        uUsers.append(u11)
        uUsers.append(u12)
        uUsers.append(u13)
        uUsers.append(u14)
        uUsers.append(u15)
        uUsers.append(u16)
        uUsers.append(u17)
        uUsers.append(u18)
        uUsers.append(u19)
        uUsers.append(u20)
        uUsers.append(u21)
        uUsers.append(u22)
        uUsers.append(u23)
        uUsers.append(u24)
        uUsers.append(u25)
        uUsers.append(u26)
        uUsers.append(u27)
        uUsers.append(u28)
        uUsers.append(u29)
        uUsers.append(u30)
        uUsers.append(u31)
        uUsers.append(u32)
        uUsers.append(u33)
        uUsers.append(u34)
        uUsers.append(u35)
        uUsers.append(u36)
        uUsers.append(u37)
        uUsers.append(u38)
        uUsers.append(u39)
        uUsers.append(u40)
        uUsers.append(u41)
        uUsers.append(u42)
        uUsers.append(u43)
        uUsers.append(u44)
        uUsers.append(u45)
        uUsers.append(u46)
        uUsers.append(u47)
        uUsers.append(u48)
        uUsers.append(u49)
        uUsers.append(u50)
        uUsers.append(u51)
        uUsers.append(u52)
        uUsers.append(u53)
        uUsers.append(u54)
        uUsers.append(u55)
        uUsers.append(u56)
        uUsers.append(u57)
        uUsers.append(u58)
        uUsers.append(u59)
        uUsers.append(u60)
        uUsers.append(u61)
        uUsers.append(u62)
        uUsers.append(u63)
        uUsers.append(u64)
        uUsers.append(u65)
        uUsers.append(u66)
        uUsers.append(u67)
        uUsers.append(u68)
        uUsers.append(u69)
        uUsers.append(u70)
        uUsers.append(u71)
        uUsers.append(u72)
        uUsers.append(u73)
        uUsers.append(u74)
        uUsers.append(u75)
        uUsers.append(u76)
        uUsers.append(u77)
        uUsers.append(u78)
        uUsers.append(u79)
        uUsers.append(u80)
        uUsers.append(u81)
        uUsers.append(u82)
        uUsers.append(u83)
        uUsers.append(u84)
        uUsers.append(u85)
        uUsers.append(u86)
        uUsers.append(u87)
        uUsers.append(u88)
        uUsers.append(u89)
        uUsers.append(u90)
        uUsers.append(u91)
        uUsers.append(u92)
        uUsers.append(u93)
        uUsers.append(u94)
        uUsers.append(u95)
        uUsers.append(u96)
        uUsers.append(u97)
        uUsers.append(u98)
        uUsers.append(u99)
        uUsers.append(u100)
        uUsers.append(u101)
        uUsers.append(u102)
        uUsers.append(u103)
        uUsers.append(u104)
        uUsers.append(u105)
        uUsers.append(u106)
        uUsers.append(u107)
        uUsers.append(u108)
        uUsers.append(u109)
        uUsers.append(u110)
        uUsers.append(u111)
        uUsers.append(u112)
        uUsers.append(u113)
        uUsers.append(u114)
        uUsers.append(u115)
        uUsers.append(u116)
        uUsers.append(u117)
        uUsers.append(u118)
        uUsers.append(u119)
        uUsers.append(u120)
        uUsers.append(u121)
        uUsers.append(u122)
        uUsers.append(u123)
        uUsers.append(u124)
        uUsers.append(u125)
        uUsers.append(u126)
        uUsers.append(u127)
        uUsers.append(u128)
        uUsers.append(u129)
        uUsers.append(u130)
        uUsers.append(u131)
        uUsers.append(u132)
        uUsers.append(u133)
        uUsers.append(u134)
        uUsers.append(u135)
        uUsers.append(u136)
        uUsers.append(u137)
        uUsers.append(u138)
        uUsers.append(u139)
        uUsers.append(u140)
        uUsers.append(u141)
        uUsers.append(u142)
        uUsers.append(u143)
        uUsers.append(u144)
        uUsers.append(u145)
        uUsers.append(u146)
        uUsers.append(u147)
        uUsers.append(u148)
        uUsers.append(u149)
        uUsers.append(u150)
    }
}
