//
//  ListView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct ListView: View {
    @State var array = ["First Text", "Second Text", "Third Text"]
    @State var indices: [Int] = []
    
    var colorScheme: ColorScheme
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                colorScheme == .light ? Color.whiteStart : Color.darkEnd
                
                VStack {
                    ViewHeader(width: geo.size.width * 0.95, text: "List")
                    
                    ScrollView {
                        LazyVStack(spacing: 2) {
                            ForEach (0..<array.count, id: \.self) { index in
                                if !indices.contains(index) {
                                    RowContent(colorScheme: colorScheme, text: array[index], index: index, indices : $indices)
                                        .frame(height: 100)
                                }
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RowContent: View {
    
    var colorScheme: ColorScheme
    let text: String
    let index: Int
    let width: CGFloat = 60
    
    @Binding var indices: [Int]
    @State var offset = CGSize.zero
    @State var scale: CGFloat = 0.5
    
    var body: some View {
        GeometryReader { geo in
            HStack (spacing: 0) {
                HStack {
                    Image(systemName: "circle")
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(Color.blue)
                        .padding(3)
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    VStack {
                        Text("item name")
                            .animation(nil)
                            .foregroundColor(.cornBlue)
                            .font(.system(size: 15, weight: .bold))
                            .padding()
                        
                        Text("carbs 10g")
                            .animation(nil)
                            .foregroundColor(.cornBlue)
                            .font(.system(size: 15, weight: .bold))
                            .padding()
                    }
                    
                }
                .frame(width: geo.size.width, alignment: .leading)
                
                Image(systemName: "trash")
                    .font(.system(size: 20))
                    .scaleEffect(scale)
                    .foregroundColor(.cornBlue)
                    .frame(width: width, height: geo.size.height)
                    .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                    .shadow(color: .cornBlue, radius: 0, x: 0, y: 0)
                    .onTapGesture {
                        indices.append(index)
                    }
            }
            .background(NeumorphicBackground(color: colorScheme, isHighlighted: true, shape: Rectangle()))
            .cornerRadius(20)
            .offset(self.offset)
            .animation(.spring())
            .gesture(DragGesture()
                        .onChanged { gesture in
                            self.offset.width = gesture.translation.width
                        }
                        .onEnded { _ in
                            if self.offset.width > -(geo.size.width * 0.4) && self.offset.width < 0 {
                                self.scale = 1
                                self.offset.width = -width
                            } else if self.offset.width < -(geo.size.width * 0.4) {
                                indices.append(index)
                            } else {
                                self.scale = 0.5
                                self.offset = .zero
                            }
                        }
            )
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(array: ["First Text", "Second Text", "Third Text"], indices: [3], colorScheme: .dark)
    }
}


