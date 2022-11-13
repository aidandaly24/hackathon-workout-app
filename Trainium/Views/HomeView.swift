//
//  Home.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI



struct HomeView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var currentUser: CurrentUser
    @StateObject var groups: Groups
    
    @AppStorage("firstName") var firstName: String = ""
    
    @State var creatingGroup: Bool = false
    @State var groupName: String = ""
    @State var showingSchedule = false
    @State var invites: [String] = []
    let tips = ["Working out every day can improve mental health.", "Working out 3 - 5 times a week can improve mental health.", "Exercising increases neuroplasticity!"]
    
    let days = [true, false, false, true, true, false, true]
    let daysOfTheWeek = ["S", "M", "T", "W", "T", "F", "S"]
    
    var body: some View {
            if showingSchedule {
                ScheduleWorkoutView(viewRouter: viewRouter, groups: groups)
            }
            else {
                Home
            }
            
        }
    
    var Home: some View {
        ZStack {
            ScrollView(showsIndicators:false) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Hi, \(firstName)!")
                            .font(.system(size: 45))
                        Spacer()
                        Image("coin")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                        Text(" 1500")
                        
                            .font(.system(size: 20))
                        
                    }
                    .fontWeight(.bold)
                    .foregroundColor(Color(0x424B54))
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    
                    Text("Great job you're on a 1 day streak!")
                        .foregroundColor(Color(0x424B54))
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                        .font(.system(size: 20))
                    VStack{
                        VStack{
                            HStack(spacing: 20) {
                                ForEach(days,id: \.self) {day in
                                    Image(systemName: day ? "circle.fill" : "circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:20)
                                        .foregroundColor(Color(0xFCF7EE))
                                }
                            }
                            HStack(spacing: 28) {
                                ForEach(daysOfTheWeek,id: \.self) {day in
                                    Text(day)
                                        .foregroundColor(Color(0xFCF7EE))
                                }
                            }
                        }
                        .frame(width: 310)
                        .padding()
                        .background(Color("red"))
                        .cornerRadius(12)
                        .padding(.bottom, 15)
                        
                        
                        Button {
                            self.showingSchedule = true
                            
                        } label : {
                            Text("Schedule A Workout")
                                .lineLimit(nil)
                                .padding(.horizontal, 75)
                                .padding(.vertical, 15)
                                .background(Color("red"))
                                .cornerRadius(12)
                        }
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color(0xFCF7EE))
                        .padding(.bottom, 25)
                        .buttonStyle(StaticButtonStyle())
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
                        
                        
                        Text("Upcoming Workouts")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(0x424B54))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                            .padding(.bottom, 10)
                        
                        ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 350, height: 150)
                                    .foregroundColor(Color(0xFE2036))
                            
                                VStack(alignment: .leading){
                                Text("November 14th at 1:00 PM with Lebron James")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(0xffffff))
                                    .fontWeight(.bold)
                                
                                    Spacer()
                                        .frame(height: 20)
                                    
                                Text("November 16th at 3:00 PM with Jack Winslow")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(0xffffff))
                                    .fontWeight(.bold)
                                    
                                    Spacer()
                                        .frame(height: 20)
                                    
                                Text("November 17th at 11:30 AM with Tom Brady")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(0xffffff))
                                    .fontWeight(.bold)
                                
                            }
                        }

                        HStack(alignment: .lastTextBaseline) {
                            Text("Friends")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(Color(0x424B54))
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                            
                            Spacer()
                            
                            Button {
                                viewRouter.currentPage = .community
                            } label: {
                                Text("Add New")
                                    .underline()
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(0x424B54))
                                    .font(.system(size: 18))
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 10)
                            }
                            
                            
                        }
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(currentUser.friendsArray, id: \.username) {friend in
                                    VStack {
                                        Button {
                                            
                                        } label : {
                                            Image(systemName: "person.circle.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height:75)
                                                .foregroundColor(Color(0x424B54))
                                        }
                                        .buttonStyle(StaticButtonStyle())
                                        
                                        Text("\(friend.firstName) \(friend.lastName)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color(0x424B54))
                                    }
                                    .frame(width: 100)
                                }
                            }
                            .padding(.leading, 15)
                            
                            
                            
                        }
                        .padding(.bottom, 25)
                        
                        
                        HStack(alignment: .lastTextBaseline) {
                            Text("Groups")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(Color(0x424B54))
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                            
                            Spacer()
                            
                            Button {
                                creatingGroup = true
                            } label: {
                                Text("Add New")
                                    .underline()
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(0x424B54))
                                    .font(.system(size: 18))
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 10)
                            }
                            .animation(.easeInOut, value: creatingGroup)
                            
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(currentUser.groupsArray, id: \.documentID) { group in
                                    VStack {
                                        Button {
                                            
                                        } label : {
                                            Image(systemName: "person.circle.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height:75)
                                                .foregroundColor(Color(0x424B54))
                                                .fontWeight(.medium)
                                        }
                                        .buttonStyle(StaticButtonStyle())
                                        
                                        Text(group.name)
                                            .font(.system(size: 15))
                                            .foregroundColor(Color(0x424B54))
                                            .fontWeight(.medium)
                                    }
                                    .frame(width: 100)
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.bottom, 15)
                    }
                    /*Text("Motivation!")
                     .font(.system(size: 30))
                     .fontWeight(.bold)
                     .foregroundColor(Color(0x424B54))
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .padding(.horizontal, 10)
                     .padding(.bottom, 10)*/
                    
                                        
                    Text(tips.randomElement()!)
                        .frame(width: 350, height: 100)
                        .lineLimit(nil)
                        .background(Color("white").opacity(1.0))
                        .cornerRadius(12)
                        .font(.system(size: 20))
                        .foregroundColor(Color("black"))
                        .fontWeight(.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(0xFE2036), lineWidth: 2)
                        )
                    
                    
                }
                .padding(.bottom, 60)
            }
            
            if creatingGroup {
                
                Color.black.opacity(0.2).ignoresSafeArea()
                
                // Pop up designed in VStack
                VStack {
                    Button {
                        creatingGroup = false
                    } label: {
                        HStack {
                            Text("Back")
                        }
                    }
                    .animation(.easeInOut, value: creatingGroup)
                    .fontWeight(.bold)
                    .foregroundColor(Color("red"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding([.top, .trailing])
                    
                    TextField("Enter Group Name", text: $groupName)
                        .frame(height: 35)
                        .disableAutocorrection(true)
                        .foregroundColor(Color(0xFE2036))
                        .accentColor(Color(0xFE2036))
                        .padding(.leading,12)
                        .overlay(
                             RoundedRectangle(cornerRadius: 12)
                                 .stroke(Color(0x424B54), lineWidth: 1)
                        )
                        .padding([.horizontal, .bottom])
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                            
                        VStack {
                            ForEach(currentUser.friendsArray, id: \.username) { friend in
                                HStack {
                                    Text("\(friend.firstName) \(friend.lastName)")
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                    Spacer()
                                    
                                    Button {
                                        if (!invites.contains(friend.username)) {
                                            self.invites.append(friend.username)
                                        }
                                        else {
                                            let idx = invites.firstIndex(where: {$0 == friend.username})
                                            self.invites.remove(at: idx!)
                                        }
                                    } label: {
                                        Text("Invite")
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                    }
                                    
                                    
                                }
                                .foregroundColor(Color("white"))
                                .padding([.top, .bottom], 10)
                                .padding([.leading, .trailing], 20)
                                .frame(maxWidth: .infinity)
                                .background(invites.contains(friend.username) ? Color("red").opacity(0.8) : Color("red"))
                                .cornerRadius(12)
                            }
                            
                        }
                        .padding(.horizontal)
                            
                        
                    }
                    Button {
                        groups.createNewGroup(name: groupName, discoverable: true, members: invites)
                        creatingGroup = false
                    } label : {
                        Text("Create Group")
                            .foregroundColor(Color("white"))
                            .padding([.top, .bottom], 15)
                            .padding(.horizontal, 50)
                            .background(Color("red"))
                            .cornerRadius(12)
                    }
                    .padding(.bottom)
                        
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("white"))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
                .padding(.horizontal, 16)
                .padding(.vertical, 100)
            }
        }

    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//        
//    }
//}
