//
//  ReminderView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import SwiftUI

struct ReminderView: View {
    @State private var searchText = ""
    private var reminderGroups = reminderGroupList

    var body: some View {
        NavigationView {
            VStack {
                if searchText.isEmpty {
                    contentView
                }
                else {
                    searchView
                }
                FooterView()
            }
                .toolbar { toolbar }
                .padding()
                .background(Color("BackgroundScheme"))

        }
        .searchable(text: $searchText)
    }

    var toolbar: some View {
        Menu {
            Button {

            } label: {
                Label("목록", systemImage: "pencil")
            }
            Button {

            } label: {
                Label("템플릿", systemImage: "square.on.square")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }

    let colums = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                LazyVGrid(columns: colums, spacing: 20) {
                    ForEach(reminderGroups) { reminderGroup in
                        ReminderGroupItemView(reminderGroup: reminderGroup)
                    }
                }
//                VStack(alignment: .leading) {
//                    Text("나의 목록")
//                        .font(.title3)
//                        .fontWeight(.bold)
//                        .padding(6)
//                    Text("나의 목록")
//                }
            }
        }
        
    }

    var searchView: some View {
        Text("Search View")
    }
}

struct FooterView: View {
    var body: some View {
        HStack {
            Button {

            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .fontWeight(.bold)
                        .overlay(
                            Circle().stroke(Color("BackgroundScheme"), lineWidth: 10)
                        )
                    Text("새로운 미리 알림")
                }
            }

            Spacer()

            Button {

            } label: {
                Text("목록 추가")
            }
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
