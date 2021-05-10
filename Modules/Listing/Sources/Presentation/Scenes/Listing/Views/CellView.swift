//
//  CellView.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import SwiftUI

struct CellView: View {
    var name: String
    
    var body: some View {
        Text(name)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(name: "Lorem ipsum")
    }
}
