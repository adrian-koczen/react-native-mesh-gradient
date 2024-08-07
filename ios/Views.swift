import SwiftUI

@available(iOS 18.0, *)
struct ErrorMessage: View {
    var message: String = ""
    
    init (message: String?) {
        if let message {
            self.message = message
        }
    }
    
    var body: some View {
        VStack {
            Text(self.message)
                .foregroundColor(.white)
                .padding(16)
        }
            .background(.red)
            .cornerRadius(16)
    }
}
