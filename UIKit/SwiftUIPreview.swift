struct MyCollectionViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = MyViewController()
        vc.configure(some: "Initial config")
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
