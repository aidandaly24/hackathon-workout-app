//
//  GroupView.swift
//  Trainium
//
//  Created by Aidan Daly on 11/13/22.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        ZStack {
            ScrollView(showsIndicators:false) {
                VStack(spacing: 0) {
                    Text("Group Name")
                        .foregroundColor(Color("black"))
                        .font(.system(size: 45))
                        .padding()
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label : {
                        Text("Invite more friends")
                            
                            .font(.system(size: 35))
                            .padding()
                            .foregroundColor(Color("white"))
                            .fontWeight(.bold)
                            .background(Color("red"))
                            .cornerRadius(12)
                            .buttonStyle(StaticButtonStyle())
                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                            
                        VStack {
                            ForEach(0..<10) {_ in
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:75)
                                        .foregroundColor(Color(0x424B54))
                                        .padding(.trailing, 10)

                                    Text("Friend Name")
                                        .font(.system(size: 25))
                                        .fontWeight(.medium)
                                    Spacer()
                                    
                                }
                                .foregroundColor(Color("black"))
                                .padding([.top, .bottom], 10)
                                .padding([.leading, .trailing], 20)
                                .frame(maxWidth: .infinity)
                                .background()
                                .cornerRadius(12)
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding()
                            
                        
                    }
                    
                }
            }
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
