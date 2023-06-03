//
//  ToastModifier.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI
import UIKit

struct ToastModifier: ViewModifier {
    
    @Binding var toast: ToastModel?
    @State private var workItem: DispatchWorkItem?
    var callback: () -> ()
    
    init(toast: Binding<ToastModel?>,
         workItem: DispatchWorkItem? = nil,
         callback: @escaping () -> Void) {
        _toast = toast
        self.workItem = workItem
        self.callback = callback
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: -30)
                }.animation(.spring(), value: toast)
            )
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                Spacer()
                ToastView(
                    type: toast.type,
                    title: toast.title,
                    message: toast.message) {
                        dismissToast()
                    }
            }
            .transition(.move(edge: .bottom))
        }
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
               dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
        callback()
    }
}

extension View {
    func toastView(toast: Binding<ToastModel?>, callback: @escaping () -> ()) -> some View {
        self.modifier(ToastModifier(toast: toast, callback: callback))
    }
}
