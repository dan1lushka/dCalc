//
//  ListView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct ListView: View {
  
  @ObservedObject var calculationManager: CalculationManager
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  var body: some View {
    
    GeometryReader { geo in
      
        VStack {
          ViewHeader(width: geo.size.width * 0.95, text: "List")
          
          ScrollView {
            VStack(spacing: 2) {
              ForEach(calculationManager.consumedFoodItems.items) { item in
                RowContent(items: $calculationManager.consumedFoodItems.items, colorScheme: colorScheme, item: item)
                  .frame(height: 100)
              }
            }
          }
        }
        .background(colorScheme == .light ? Color.whiteStart : Color.darkEnd)
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct RowContent: View {
  
  @Binding var items: [ConsumedFood.Item]
  
  var colorScheme: ColorScheme
  var item: ConsumedFood.Item
  let width: CGFloat = 60
  
  @State var offset = CGSize.zero
  @State var scale: CGFloat = 0.5
  
  // todo: stop row from swiping from left to right
  
  var body: some View {
    
    GeometryReader { geo in
      
      HStack(spacing: 0) {
        
        HStack {
          Image(systemName: "circle")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.blue)
            .padding(3)
            .cornerRadius(20)
          
          Spacer()
          
          VStack {
            Text("\(item.productName)")
              .animation(nil)
              .foregroundColor(.cornBlue)
              .font(.system(size: 15, weight: .bold))
              .padding()
            
            Text(String(format: "%.1f", item.grammsConsumed))
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
          .background(NeumorphicBackground(isHighlighted: false, shape: Rectangle()))
          .shadow(color: .cornBlue, radius: 0, x: 0, y: 0)
          .onTapGesture {
            items.removeAll(where: { $0.id == item.id })
          }
      }
      .background(NeumorphicBackground(isHighlighted: true, shape: Rectangle()))
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
          items.removeAll(where: { $0.id == item.id })
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
    ListView(calculationManager: CalculationManager())
  }
}
