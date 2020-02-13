//
//  ChatController.swift
//  Grow City
//
//  Created by Hélène Delaporte on 12/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import Combine
import SwiftUI


class ChatController : ObservableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    @Published var messages = [
        ChatMessage(message: "Hello Martine!", avatar: "Gilles", color: .gray),
//                        ChatMessage(message: "Bonjour Gilles", avatar: "Martine", color: .gray)
                            
    ]
    
    
    func sendMessage(_ chatMessage: ChatMessage) {
        
        messages.append(chatMessage)
        
        didChange.send(())
    }
    
}

struct chatControleur_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
