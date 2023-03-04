//
//  RoundedRectangleIcon.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/04.
//

import SwiftUI

struct RoundedRectangleIcon: View {
    let systemName: String
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5, style: .circular)
                .fill(background)
                .frame(width: 26, height: 26, alignment: .center)
            Image(systemName: systemName)
                .foregroundColor(.white)
        }
    }
}

struct RoundedRectangleIcon_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleIcon(systemName: "calendar", background: .red)
            .previewLayout(.sizeThatFits)
    }
}
