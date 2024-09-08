//
//  ContentView.swift
//  Screen
//
//  Created by zuole on 9/8/24.
//

import SwiftUI
import Cocoa

extension NSScreen {
    var hasNotch: Bool {
        // 获取屏幕的 frame 和可见区域 visibleFrame
        let screenFrame = self.frame
        let visibleFrame = self.visibleFrame
        
        // 如果屏幕的frame高度大于可见区域的高度，说明有刘海
        return screenFrame.height > visibleFrame.height
    }
}

struct ContentView: View {
    @State private var notchInfo: String = "检测屏幕是否有刘海..."

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(notchInfo)
        }
        .onAppear {
            checkForNotch()
        }
    }
    
    // 使用NSScreen检测刘海
    func checkForNotch() {
        if let mainScreen = NSScreen.main {
            if mainScreen.hasNotch {
                notchInfo = "这是一个带刘海的屏幕"
            } else {
                notchInfo = "这是一个普通屏幕"
            }
        } else {
            notchInfo = "无法获取屏幕信息"
        }
    }
}

#Preview {
    ContentView()
}
