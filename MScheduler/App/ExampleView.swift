//
//  ExampleView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/02.
//

import SwiftUI

struct ExampleView: View {
    @State private var searchText = ""
    let reminderGroupes = ReminderGroup.sampleData
    
    var body: some View {
        List {
            Section(header: Text("나의 목록")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor.label))
            ) {
                ForEach(0..<10) { num in
                    NavigationLink(destination: Text("\(num)")) {
                        Text("Num: \(num)")
                    }
                }
            }
            
            Section(header: Text("태그")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor.label))
            ) {
                Text("#태그")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.systemGray))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(6)
            }
        }
        .listStyle(.insetGrouped)
        .searchable(text: $searchText)
    }
    
    //        ScrollView {
    //            Section {
    //                CardView(reminderGroup: reminderGroupes[0])
    //                CardView(reminderGroup: reminderGroupes[0])
    //                CardView(reminderGroup: reminderGroupes[0])
    //                CardView(reminderGroup: reminderGroupes[0])
    //            }
    //
    //            List {
    //                ForEach(0..<20) { num in
    //                    NavigationLink(destination: Text("\(num)")) {
    //                        Text("Num: \(num)")
    //                    }
    //
    //                }
    //            }
    //            .scrollDisabled(false)
    //
    //
    //        }
    //        .searchable(text: $searchText)
}


struct CardView: View {
    let reminderGroup: ReminderGroup
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Image(systemName: reminderGroup.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(reminderGroup.theme.mainColor)
                Spacer()
                Text(reminderGroup.name)
                    .font(.headline)
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            Text("3")
                .font(.title)
                .fontDesign(.rounded)
                .fontWeight(.bold)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .frame(height: 80)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("CardScheme"))
        )
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
        
        NavigationView {
            ExampleView()
        }
        .preferredColorScheme(.dark)
    }
}
