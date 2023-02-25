//
//  HomeView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ReminderView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
