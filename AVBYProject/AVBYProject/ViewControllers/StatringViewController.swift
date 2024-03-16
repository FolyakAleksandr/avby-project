import UIKit

final class StatringViewController: UIViewController {
    // MARK: - Private Properties

    private let nextButton = UIButton()

    // MARK: - Lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceView()
        layoutNextButton()
        appearanceNextButton()
        logicNextButton()
    }

    // MARK: - Methods

    private func appearanceView() {
        view.backgroundColor = UIColor(named: "backgroundView")
    }

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

    @objc func tappedNextButton() {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
}
