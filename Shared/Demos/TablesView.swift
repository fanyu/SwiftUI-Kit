//
//  TablesView.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/17.
//

import SwiftUI

struct TablesView<Cell: View>: View {
    var cells: [[Cell]]
    let padding: CGFloat = 5
    @State private var columnWidths:[Int: CGFloat] = [:]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cells.indices) { row in
                HStack(alignment: .top) {
                    ForEach(cells[row].indices) { column in
                        cellFor(row: row, column: column)
                    }
                }
                .background(
                    row.isMultiple(of: 2) ?
                        Color(.secondarySystemBackground) :
                        Color(.systemBackground)
                )
            }
        }
        .onPreferenceChange(TWidthPreference.self) {
            columnWidths = $0
        }
    }
    
    private func cellFor(row: Int, column: Int) -> some View {
        cells[row][column]
            .widthPreference(column: column)
            .frame(width: columnWidths[column], alignment: .leading)
            .padding(padding)
            .onTapGesture {
                
            }
    }
}

extension View {
    func widthPreference(column: Int) -> some View {
        background(GeometryReader(content: { proxy in
            Color.clear.preference(
                key: TWidthPreference.self,
                value: [column : proxy.size.width]
            )
        }))
    }
}

// 取最大宽度
struct TWidthPreference: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    static func reduce(value: inout [Int : CGFloat], nextValue: () -> [Int : CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}

//struct TablesView_Previews: PreviewProvider {
//    static var previews: some View {
//        //TablesView()
//    }
//}
