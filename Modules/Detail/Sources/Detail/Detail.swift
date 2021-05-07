import SwiftUI
import Core

public struct DetailView1: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var destination: Destination?
    
    public var body: some View {
        Button("asdf") {
            destination = .detail(id: "")
        }.navigation(item: $destination, destination: viewModel.router.route(to:))
    }
    
}

public struct DetailView2: View {
    public init() { }
    
    public var body: some View {
        Text("Este es el detalle 2")
    }
    
}

public class DetailViewModel: ObservableObject {
    
    let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
}

