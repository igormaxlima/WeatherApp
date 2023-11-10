//
//  LoadingView.swift
//  SwiftUI-Weather
//
//  Created by Igor Max de Lima Nunes on 08/11/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
