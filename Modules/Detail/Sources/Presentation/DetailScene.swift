import Core
import SwiftUI

struct DetailScene<ViewModel: DetailViewModelProtocol>: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Text("This is the detail of the Pokemon")
        Text("This component will be builded as soon as possible")
    }
}
