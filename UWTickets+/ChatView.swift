//
//  ChatView.swift
//  UWTickets+
//
//  Created by Paresh on 11/5/21.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        messages()
    }
}

struct messages: View {
    var body: some View {
        VStack(spacing: 0) {
            TopView().zIndex(25)
            CenterView().offset(y: -25)
            Spacer()
        }.background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .padding(.bottom, 10)
    }
}

struct TopView: View {
    
    @State var search = ""
    
    var body: some View {
        VStack(spacing: 18) {
            HStack{
               Text("Messsages")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color.black)
                Spacer()
                

            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 18) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black)
                            .padding(25)
                    }.background(Color.red.opacity(0.7))
                        .clipShape(Circle())
                    
                    ForEach(1...5, id: \.self){i in
                        Button(action: {
                            
                        }) {
                            Image("p\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 70, height: 70)
                        }.clipShape(Circle())
                    }
                    
                }
            }
            
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width:18, height:18)
                    .foregroundColor(Color.black.opacity(0.8))
                
                TextField("Search", text: $search)
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.bottom, 10)
            
        }.padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.red.opacity(0.5))
            .clipShape(shape())
    }
}

struct CenterView : View {
    var body: some View{
        List(data){i in
            cellView(data: i)
        }
        .padding(.top, 20)
        .background(Color.red.opacity(0.1))
        .clipShape(shape())
        
    }
}
struct cellView : View {
    var data : msg
    var body : some View {
        HStack(spacing: 12) {
            Image(data.img)
                .resizable()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 12) {
                Text(data.name)
                Text(data.msg).font(.caption)
            }
            Spacer(minLength: 0)
            
            VStack {
                Text(data.date)
                Spacer()
                
            }
        }.padding(.vertical)
        

    }
}
struct shape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners:
                                    [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 33, height: 33))
        
        return Path(path.cgPath)
    }
}

struct msg : Identifiable {
    var id : Int
    var name: String
    var msg: String
    var date: String
    var img : String
}

var data = [
    msg(id: 0, name: "Becky", msg: "Hey there!", date: "02/02/20", img: "p1"),
    msg(id: 1, name: "Barry", msg: "Let's Win!", date: "02/02/20", img: "p2"),
    msg(id: 2, name: "Paul", msg: "Run the ball!", date: "02/02/20", img: "p3"),
    msg(id: 3, name: "JT", msg: "Too Easy!", date: "02/02/20", img: "p4"),
    msg(id: 4, name: "Russel", msg: "Dimes!", date: "02/02/20", img: "p5"),
    msg(id: 5, name: "Army", msg: "Welcome!", date: "02/02/20", img: "ArmyLogo"),
    msg(id: 6, name: "Iowa", msg: "We Lost!", date: "02/02/20", img: "IowaLogo")

]
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
