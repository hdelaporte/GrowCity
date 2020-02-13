//
//  Chat.swift
//  exercice03
//
//  Created by Mariama Fofana on 04/02/2020.
//  Copyright © 2020 Mariama Fofana. All rights reserved.
//

import SwiftUI

struct ChatMessage : Identifiable {
    var id = UUID()
    var message: String
    var avatar: String
    var color: Color
    var isMe: Bool = false
}

struct AlertMessage : View {
    
    let chatMessage: ChatMessage
    
    var body: some View {
        Group {
            if !chatMessage.isMe {
                HStack {
                    Group {
                        Text(chatMessage.avatar)
                        Text(chatMessage.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                    }
                }
            } else {
                HStack {
                    Group {
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                        Text(chatMessage.avatar)
                    }
                }
            }
        }
        
    }
}
struct ChatView : View {
    
    @State var composedMessage: String = ""
    @EnvironmentObject var ChatController: ChatController
    
    var body: some View {
        
        
        VStack {
            
            List {
                
                ForEach(ChatController.messages) { msg in
                    AlertMessage(chatMessage: msg)
                }
            }
            
            HStack {
                
                TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
                
                Button(action: sendMessage) {
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
            
        }
    }
    func sendMessage() {
        ChatController.sendMessage(ChatMessage(message: composedMessage, avatar: "Martine", color: .green, isMe: true))
        composedMessage = ""
    }
}


struct alertPreview : PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatController())
    }
    
}
