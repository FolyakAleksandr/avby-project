import UIKit

final class StatringViewController: UIViewController {
    // MARK: - Private Properties

    private let nextButton = UIButton()
    private let tabBar = TabBarController()

    // MARK: - Lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundViewController()
        layoutNextButton()
        appearanceNextButton()
        logicNextButton()
        setupNavigationBar()
    }

    // MARK: - Methods

    private func layoutNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
    }

    private func appearanceNextButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(named: "backgroundButton-bottom-next")
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 7
    }

    private func logicNextButton() {
        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchDown)
    }
    
    private func setupNavigationBar() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = UIColor(named: "background-nav-tab")
        navigationController?.navigationBar.layer.borderColor = UIColor.systemGray3.cgColor
        navigationController?.navigationBar.layer.borderWidth = 0.7
    }

    @objc func tappedNextButton() {
        navigationController?.pushViewController(tabBar.configureTabBarController(), animated: true)
    }
}
