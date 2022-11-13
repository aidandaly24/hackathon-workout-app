//
//  Profile.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct PersonalView: View {
    @State var goSettings = false
    @StateObject var authViewModel: AuthViewModel
    @StateObject var currentUser: CurrentUser
    @StateObject var users: Users
    @StateObject var groups: Groups
    
    let impactSoft = UIImpactFeedbackGenerator(style: .soft)

    
    var body: some View {
//            if goSettings {
//                SettingsView(authViewModel: authViewModel, currentUser: currentUser, users: users)
//            }
//            else {
//                profile
//            }
        
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        
                        Spacer()
                        
//                        NavigationLink(destination: SettingsView(authViewModel: authViewModel, currentUser: currentUser, users: users)) {
//                            Image(systemName: "gearshape")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 30)
//                                .foregroundColor(Color("black"))
//                                .padding(.trailing)
//                                .padding(.top)
//                        }
                        
                        Button {
                            authViewModel.signOut()
                        } label: {
                            Text("Sign Out")
                                .foregroundColor(Color("black"))
                                .padding(.trailing)
                                .padding(.top)
                        }


                    }
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width:100, height: 100)
                        .foregroundColor(Color("black"))
                    
                    Text("\(currentUser.firstName) \(currentUser.lastName)")
                        .font(.system(size: 32))
                        .fontWeight(.medium)
                        .foregroundColor(Color("black"))
                        .padding(.bottom,5)
                    
                    Text("Fitness Level: \(currentUser.experienceLevel)")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(Color("black"))
                        .padding(.bottom,32)
                    
                    Text("Friend Requests")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                        .foregroundColor(Color("black"))
                        .padding(.leading)
                    
                    VStack {
                        
                        if currentUser.friendRequests.count == 0 {
                            Text("No Current Requests")
                                .font(.system(size: 24))
                                .fontWeight(.regular)
                                .foregroundColor(Color("red"))
                                .padding(.top)
                        } else {
                            ForEach(currentUser.friendRequests, id: \.self) { request in
                                HStack {
                                    Text(request)
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                    Spacer()
                                    
                                    Button {
                                        impactSoft.impactOccurred()
                                        users.acceptFriendRequest(requestUser: request)
                                    } label: {
                                        Text("Accept")
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                    }
                                    
                                    Button {
                                        users.declineFriendRequest(requestUser: request)
                                    } label: {
                                        Text("Decline")
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                    }
                                }
                                .foregroundColor(Color("white"))
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color("red"))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
                    Text("Group Invites")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                        .foregroundColor(Color("black"))
                        .padding(.leading)
                    
                    VStack {
                        
                        if currentUser.groupInvites.count == 0 {
                            Text("No Current Invites")
                                .font(.system(size: 24))
                                .fontWeight(.regular)
                                .foregroundColor(Color("red"))
                                .padding(.top)
                        } else {
                            ForEach(currentUser.groupInvites, id: \.self) { invite in
                                HStack {
                                    Text("New Group Invite")
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                    Spacer()
                                    
                                    Button {
                                        impactSoft.impactOccurred()
                                        groups.acceptGroupInvite(groupID: invite)
                                    } label: {
                                        Text("Accept")
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                    }
                                    
                                    Button {
                                        groups.declineGroupInvite(groupID: invite)
                                    } label: {
                                        Text("Decline")
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                    }
                                }
                                .foregroundColor(Color("white"))
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color("red"))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
                    Text("Workout Invites")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                        .foregroundColor(Color("black"))
                        .padding(.leading)
                    HStack {
                        Text("Jack Winslow\nThe Boys\n11/15/22 6:30PM")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        Spacer()
                        
                        Button {
                            impactSoft.impactOccurred()
                            
                        } label: {
                            Text("Accept")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Decline")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                        }
                    }
                    .foregroundColor(Color("white"))
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("red"))
                    .cornerRadius(12)
                    .padding([.horizontal, .bottom])

                    
//                    Text("Friends")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.system(size: 24))
//                        .fontWeight(.regular)
//                        .foregroundColor(Color("black"))
//                        .padding(.leading)
                    
//                    VStack {
//
//                        if currentUser.friendsArray.count == 0 {
//                            Text("Search the Community to find Friends!")
//                                .font(.system(size: 24))
//                                .fontWeight(.regular)
//                                .foregroundColor(Color("red"))
//                                .padding(.top)
//                        } else {
//                            ForEach(currentUser.friendsArray, id: \.username) { friend in
//                                HStack {
//                                    Text("\(friend.firstName) \(friend.lastName)")
//                                        .font(.system(size: 18))
//                                        .fontWeight(.medium)
//                                }
//                                .foregroundColor(Color("white"))
//                                .padding(10)
//                                .frame(maxWidth: .infinity)
//                                .background(Color("red"))
//                                .cornerRadius(12)
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
                }
                .padding(.bottom, 60)
            }
            
        }
    
    var profile: some View {
        ZStack {
            VStack {

            
                Button {
                    self.goSettings = true
                } label : {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width:40, height: 40)
                        .opacity(0.5)
                        .frame(maxWidth: .infinity, alignment:
                                .trailing)
                        .padding(.trailing, 30)
//                        .padding(.top, 40)
                }
                    

                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width:100, height: 100)
                    .opacity(0.5)
                
                Text("Joe Schmo")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment:
                            .center)
                
                Text("You are on a 15 day streak🔥")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .center)

                Spacer()
                    .frame(height: 50)
                
                Text("Your Recent Workouts")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .center)
                
//                ZStack {
//                    Rectangle()
//                        .fill(Color("red").opacity(0.8))
//                        .frame(width: 270, height: 250)
//                        .cornerRadius(30)
//                        .padding(.bottom, 275)
//                    
//                        VStack(spacing: 5) {
//                            ForEach(0..<3) {_ in
//                                HStack {
//                                    Image(systemName: "figure.strengthtraining.traditional")
//                                        .resizable()
//                                        .frame(width: 50, height: 50)
//                                        .frame(height:75)
//                                        .foregroundColor(Color(0xffffff))
//                                    
//                                    Text("Date")
//                                        .font(.system(size: 15))
//                                        .padding(.leading, 15)
//                                        .foregroundColor(Color(0xffffff))
//                                    
//                                    
//                                    Text("Group Name")
//                                        .font(.system(size: 15))
//                                        .padding(.leading, 15)
//                                        .foregroundColor(Color(0xffffff))
//                                }
//                                
//                            }
//                            .frame(maxWidth: .infinity, alignment: .center)
//                        }
//                        .padding(.bottom, 270)
//                }
                
//                Spacer()
            }
            
            .font(.system(size: 20))
            .fontWeight(.bold)
            .fontWeight(.medium)
    

        }
            }
}

//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalView( authViewModel: AuthViewModel())
//    }
//}
