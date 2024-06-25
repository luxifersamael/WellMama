//
//  allexcersicesview.swift
//  B&B
//
//  Created by Mario Esposito on 15/03/24.
//

import Foundation
import SwiftUI

struct allex: View {
    @State private var showSheet = false
    @ObservedObject var datiUtente: userData
    
    //ESERCIZI TOTAL BODY
    var body: some View{
        NavigationView{
            ScrollView(showsIndicators:false){
                Spacer(minLength: 50)
                
                //ESERCIZI TOTAL BODY
                HStack{
                    Text("Total Body")
                        .font(.title2)
                        .position(CGPoint(x: 65, y: 10))
                }
                
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        NavigationLink (destination: TB1()){
                            VideoPlayerView(videoName: "TB1", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: TB2()){
                            VideoPlayerView(videoName: "TB2", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: TB3()){
                            VideoPlayerView(videoName: "TB3", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: TB4()){
                            VideoPlayerView(videoName: "TB4", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                    }
                    .padding([.horizontal], 30)
                }
                
                //ESERCIZI STRETCHING
                HStack{
                    Text("Stretching")
                        .font(.title2)
                        .position(CGPoint(x: 65, y: 10))
                }
                
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        NavigationLink (destination: stretching1()){
                            VideoPlayerView(videoName: "strc1", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: stretching2()){
                            VideoPlayerView(videoName: "strc2", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: stretching3()){
                            VideoPlayerView(videoName: "strc3", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: stretching4()){
                            VideoPlayerView(videoName: "strc4", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: stretching5()){
                            VideoPlayerView(videoName: "strc5", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: stretching6()){
                            VideoPlayerView(videoName: "strc6", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                    }
                    .padding([.horizontal], 30)
                }
                
                //ESERCIZI YOGA
                HStack{
                    Text("Yoga")
                        .font(.title2)
                        .position(CGPoint(x: 40, y: 10))
                }
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        NavigationLink (destination: yoga1()){
                            VideoPlayerView(videoName: "yoga1", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: yoga2()){
                            VideoPlayerView(videoName: "yoga2", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: yoga3()){
                            VideoPlayerView(videoName: "yoga3", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: yoga4()){
                            VideoPlayerView(videoName: "yoga4", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: yoga5()){
                            VideoPlayerView(videoName: "yoga5", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: yoga6()){
                            VideoPlayerView(videoName: "yoga6", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                    }
                    .padding([.horizontal], 30)
                }
                
                //ESERCIZI PILATES
                HStack{
                    Text("Pilates")
                        .font(.title2)
                        .position(CGPoint(x: 50, y: 10))
                }
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        NavigationLink (destination: pilates1()){
                            VideoPlayerView(videoName: "pilates1", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pilates2()){
                            VideoPlayerView(videoName: "pilates2", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pilates3()){
                            VideoPlayerView(videoName: "pilates3", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pilates4()){
                            VideoPlayerView(videoName: "pilates4", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pilates5()){
                            VideoPlayerView(videoName: "pilates5", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pilates6()){
                            VideoPlayerView(videoName: "pilates6", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                    }
                    .padding([.horizontal], 30)
                }
                
                //ESERCIZI PELVICI
                HStack{
                    Text("Pelvic")
                        .font(.title2)
                        .position(CGPoint(x: 50, y: 10))
                }
                
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        NavigationLink (destination: pelvico1()){
                            VideoPlayerView(videoName: "pelvico1", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pelvico2()){
                            VideoPlayerView(videoName: "pelvico2", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pelvico3()){
                            VideoPlayerView(videoName: "pelvico3", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pelvico4()){
                            VideoPlayerView(videoName: "pelvico4", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pelvico5()){
                            VideoPlayerView(videoName: "pelvico5", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                        NavigationLink (destination: pelvico6()){
                            VideoPlayerView(videoName: "pelvico6", videoType: "mov")
                                .frame(width: 150, height: 84)
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 15)
                    }
                    .padding([.horizontal], 30)
                }
                
                Spacer(minLength: 90)
                
            }//Fine scroll view veritcale
//            .navigationBarTitle("Exercises week \(datiUtente.currentWeek)", displayMode: .automatic)
        }
    }
}

