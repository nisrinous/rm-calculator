//
//  CustomTextField.swift
//  Calculator
//
//  Created by Retno Shintya Hariyani on 15/07/24.
//

import SwiftUI
import UIKit

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var activeField: CustomKeyboardField?

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.activeField = .weight // You can customize this based on your needs
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.borderStyle = .roundedRect
        textField.inputView = UIView() // Disable default keyboard

        // Apply the same styles as the TextField in the HStack
        textField.keyboardType = .numberPad
        textField.backgroundColor = UIColor(red: 0.46, green: 0.46, blue: 0.5, alpha: 0.12)
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(10) // Custom padding extension
        textField.setRightPaddingPoints(10) // Custom padding extension
        
        // Set fixed frame width
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal) // Optional: lower compression resistance
//        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Optional: higher hugging priority
        

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
