//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Andrea Reinicke on 18.02.23.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack {
            
            // MARK: HOTSPOT
            Image(systemName: "circle.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .symbolRenderingMode(.hierarchical)
                .onLongPressGesture (minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            
            // MARK: INFO PANEL
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .backgroundStyle(.ultraThinMaterial)
            .frame(maxWidth: 420)
            .cornerRadius(8)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
