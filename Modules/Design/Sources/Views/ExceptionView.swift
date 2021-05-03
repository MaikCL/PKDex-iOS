//
//  Created by Miguel Angel on 14-04-21.
//

import SwiftUI
import AltairMDKCommon

public struct ExceptionView: View {
    var exception: Exception
    
    public init(exception: Exception) {
        self.exception = exception
    }
    
    public var body: some View {
        VStack {
            Text("Exception!")
            if let description = exception.errorDescription { Text(description) }
            Text("Code: \(exception.code)")
        }
        .background(Color.red)
    }
}

struct ExceptionView_Preview: PreviewProvider {
    private struct DummyException: Exception {
        var code: String = "foo.bar.01"
        var category: ExceptionCategory = .feature
        var errorDescription: String? = "Lorem ipsum dolor sit amet"
    }
    
    static var previews: some View {
        ExceptionView(exception: DummyException())
    }

}
