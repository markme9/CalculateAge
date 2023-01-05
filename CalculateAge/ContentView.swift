//
//  ContentView.swift
//  CalculateAge
//
//  Created by mark me on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var birthDate: String = ""
    @State private var today: Date = Date()
    @State private var years: Int = 0
    @State private var months: Int = 0
    @State private var days: Int = 0
    private let calendar: Calendar = Calendar.current

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(Color.pink)
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .cornerRadius(3)
                    .offset(y: -37)
                    .overlay {
                        Text("Age Calculator")
                            .font(.largeTitle.bold())
                            .foregroundColor(Color.white)
                            .offset(y: -37)
                    }
                TextField("Birth Date (DD/MM/YYYY)", text: $birthDate)
                    .padding()
                    .font(.headline)
                    .keyboardType(.numberPad)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(UIColor.magenta).opacity(0.3))
                    .cornerRadius(5)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 25)
                
                Text("Today's Date: \(today, formatter: dateFormatter)")
                    .font(.headline)
                
                
                Button("Calculate Age") {
                    self.calculateAge()
                }
                .font(.title2.bold())
                .frame(width: 170, height: 45)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                
                
                
                Spacer()
                Text("Age: \(years) years, \(months) months, \(days) days")
                    .font(.title2.bold())
                    .foregroundColor(Color.red)
                    .padding(.bottom, 30)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 370)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding([.leading, .trailing], 22)
        }
        
        
    }

    private func calculateAge() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let birthDate = dateFormatter.date(from: self.birthDate) else { return }
        self.today = Date()
        let ageComponents = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        self.years = ageComponents.year!
        self.months = ageComponents.month!
        self.days = ageComponents.day!
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
