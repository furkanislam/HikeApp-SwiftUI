//
//  Cardview.swift
//  HikeApp
//
//  Created by Furkan İSLAM on 29.06.2024.
//

import SwiftUI

struct Cardview: View {
    
    // Mark : - Properties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet : Bool = false
    
    // Mark : Functions
    
    func randomImage() {
        print("---BUTTON WAS PRESSED---")
        print("Status: Old Image Number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("---THE END---")
        print("\n")
    }
    
    
    var body: some View {
        // Mark : Card
        
        ZStack {
            CustomBackground()
            
            VStack {
                // Mark: - Header
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button{
                            // Action : Show a Sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: Header
                .padding(.horizontal, 30)
                // Mark: - Main Content
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                          .resizable()
                      .scaledToFit()
                      .animation(.default, value: imageNumber)
                }
                
                // Mark: - Footer
                
                Button {
                    // Action
                    
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [.customGreenLight, .customGreenMedium],
                            startPoint: .top, 
                            endPoint: .bottom
                        )
                    )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1, y:2)
                }
                .buttonStyle(GradienButton())

            } //: ZStack
            // : Card
        } .frame(width: 320, height: 570)
    } 
        
}

#Preview {
    Cardview()
}
