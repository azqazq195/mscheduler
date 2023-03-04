//
//  TodoEmptyView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI

struct TodoEmptyView: View {
    @State var animate = false
    
    var body: some View {
        ScrollView {
            Spacer()
            
            Group {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you shoul click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: TodoAddView(), label: {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red :  Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 40 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, x: 0, y: animate ? 40 : 30)
            }
            .frame(maxWidth: 400)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                .easeOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct TodoEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TodoEmptyView()
                    .navigationTitle("Title")
            }
            .environment(\.locale, .init(identifier: "ko"))

            NavigationView {
                TodoEmptyView()
                    .navigationTitle("Title")
            }
            .environment(\.locale, .init(identifier: "en"))
        }
    }
}
