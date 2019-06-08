//
//  ContentView.swift
//  TouchSwiftUI
//
//  Created by Artem Karmaz on 08.06.2019.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import SwiftUI

struct LiveView: View {
    
    @State var position: CGPoint = .zero
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(Color.black.opacity(0.1))
                .frame(width: 320, height: 320)
            
            Image(systemName: "asterisk.circle.fill")
                .scaleEffect(CGSize(width: 3, height: 3))
                .foregroundColor(Color.blue.opacity(0.5))
                .offset(by: self.position)
                .animation(.spring())
                .gesture(DragGesture()
                    .onChanged{
                        self.position = $0.location
                    }
                    .onEnded{ _ in
                        if sqrt(self.position.x * self.position.x + self.position.y * self.position.y) > 160 {
                            self.position = CGPoint.zero
                        }
                    }
            )
        }
    }
}



extension View {
    public func offset(by offset: CGPoint) -> Self.Modified<_OffsetEffect> {
        self.offset(x: offset.x, y: offset.y)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}
#endif
