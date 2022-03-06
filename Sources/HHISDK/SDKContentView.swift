//
//  SwiftUIView.swift
//  
//
//  Created by Poonkathirvelan boopalan on 04/03/22.
//

import SwiftUI

@available(iOS 13.0, *)
struct SDKContentView: View {
    var body: some View {
        VStack{
        Text("TEST")
        }.background(Color.red)
    }
}

@available(iOS 13.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SDKContentView()
    }
}
