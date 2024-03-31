import UIKit

class MainViewController: UIViewController {
    // MARK: - Private properties

    private let carTableView = UITableView()
    private let infoCar = Car.addCar()

    private let viewFromBelowWindow: UIView = {
        let viewFromBelowWindow = UIView()
        viewFromBelowWindow.backgroundColor = .clear
        return viewFromBelowWindow
    }()

    private let searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.backgroundColor = UIColor(named: "colorTwoButtons")
        searchButton.layer.cornerRadius = 10
        return searchButton
    }()

    private let imageForSearchButton = UIImageView()

    private let parametersButton: UIButton = {
        let parametersButton = UIButton()
        parametersButton.backgroundColor = UIColor(named: "colorTwoButtons")
        parametersButton.layer.cornerRadius = 10
        return parametersButton
    }()

    private let imageForParametersButton = UIImageView()
    private let textParametersButton: UILabel = {
        let textParametersButton = UILabel()
        textParametersButton.text = "Параметры"
        textParametersButton.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        textParametersButton.textColor = .white
        return textParametersButton
    }()

    // MARK: - Variables

    var counter = 0

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundViewController()

        setupUI()
    }

    // MARK: - Methods

    private func setupUI() {
        layoutCarTableView()
        layoutViewFromBelowWindow()
        layoutSearchButton()
        layoutParametersButton()
        layoutImageForSearchButton()
        layoutImageForParametersButton()
        layoutTextParametersButton()

        configureCarTableView()
        settingImageViews()
        logicButtons()
    }

    private func layoutCarTableView() {
        view.addSubview(carTableView)
        carTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            carTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            carTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            carTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }

    private func configureCarTableView() {
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.separatorStyle = .none
        carTableView.backgroundColor = UIColor(named: "backgroundView")
        carTableView.register(CarsCustomCell.self, forCellReuseIdentifier: "CarsCustomCell")
        carTableView.showsVerticalScrollIndicator = false
    }

    private func layoutViewFromBelowWindow() {
        view.addSubview(viewFromBelowWindow)
        viewFromBelowWindow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewFromBelowWindow.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            viewFromBelowWindow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55),
            viewFromBelowWindow.heightAnchor.constraint(equalToConstant: 45),
            viewFromBelowWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func layoutSearchButton() {
        viewFromBelowWindow.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: viewFromBelowWindow.topAnchor, constant: 0),
            searchButton.leadingAnchor.constraint(equalTo: viewFromBelowWindow.leadingAnchor, constant: 0),
            searchButton.bottomAnchor.constraint(equalTo: viewFromBelowWindow.bottomAnchor, constant: 0),
            searchButton.widthAnchor.constraint(equalTo: viewFromBelowWindow.widthAnchor, multiplier: 0.27),
        ])
    }

    private func layoutParametersButton() {
        viewFromBelowWindow.addSubview(parametersButton)
        parametersButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parametersButton.topAnchor.constraint(equalTo: viewFromBelowWindow.topAnchor, constant: 0),
            parametersButton.trailingAnchor.constraint(equalTo: viewFromBelowWindow.trailingAnchor, constant: 0),
            parametersButton.bottomAnchor.constraint(equalTo: viewFromBelowWindow.bottomAnchor, constant: 0),
            parametersButton.widthAnchor.constraint(equalTo: viewFromBelowWindow.widthAnchor, multiplier: 0.71),
        ])
    }

    private func layoutImageForSearchButton() {
        searchButton.addSubview(imageForSearchButton)
        imageForSearchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageForSearchButton.centerXAnchor.constraint(equalTo: searchButton.centerXAnchor),
            imageForSearchButton.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            imageForSearchButton.heightAnchor.constraint(equalToConstant: 18),
            imageForSearchButton.widthAnchor.constraint(equalToConstant: 18),
        ])
    }

    private func layoutImageForParametersButton() {
        parametersButton.addSubview(imageForParametersButton)
        imageForParametersButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageForParametersButton.centerYAnchor.constraint(equalTo: parametersButton.centerYAnchor),
            imageForParametersButton.leadingAnchor.constraint(equalTo: parametersButton.leadingAnchor, constant: 20),
            imageForParametersButton.heightAnchor.constraint(equalToConstant: 18),
            imageForParametersButton.widthAnchor.constraint(equalToConstant: 18),
        ])
    }

    private func layoutTextParametersButton() {
        parametersButton.addSubview(textParametersButton)
        textParametersButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textParametersButton.centerYAnchor.constraint(equalTo: parametersButton.centerYAnchor),
            textParametersButton.trailingAnchor.constraint(equalTo: parametersButton.trailingAnchor, constant: -20),
        ])
    }

    private func settingImageViews() {
        imageForSearchButton.image = UIImage(systemName: "magnifyingglass")
        imageForParametersButton.image = UIImage(systemName: "slider.horizontal.3")

        [imageForSearchButton, imageForParametersButton].forEach { $0.tintColor = .white }
    }

    private func logicButtons() {
        searchButton.addTarget(self, action: #selector(tapOnSearchButton), for: .touchUpInside)
        parametersButton.addTarget(self, action: #selector(tapOnParametersButton), for: .touchUpInside)
    }

    @objc private func tapOnSearchButton() {
        present(Alert.showAlert("Это поиск", "Скоро здесь будет добавлен поиск по названию автомобиля"), animated: true)
    }

    @objc private func tapOnParametersButton() {
        present(Alert.showAlert("Параметры", "Скоро здесь будет добавлен поиск по параметрам автомобиля"), animated: true)
    }
}

// MARK: - Extension

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoCar.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarsCustomCell", for: indexPath) as? CarsCustomCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "backgroundView")
        cell.selectionStyle = .none
        cell.setupInfoCar(model: infoCar[indexPath.row])
        cell.closure = { [weak self] in
            guard let self = self else { return }
            self.present(Alert.showAlert("Кредит!", "Данный авто будет обходиться в \(self.infoCar[indexPath.row].priceCredit) USD/месяц"), animated: true)
        }
        cell.closureBookmarkButton = { [weak self] in
            guard let self = self else { return }
            if self.counter == 0 {
                self.present(Alert.showAlert("Успех!", "Вы добавили \(self.infoCar[indexPath.row].name.rawValue) в избранное"), animated: true)
                self.counter += 1
            } else {
                self.present(Alert.showAlert("Жаль!", "Вы удалили \(self.infoCar[indexPath.row].name.rawValue) из избранного"), animated: true)
                self.counter = 0
            }
        }

        cell.closureForMainView = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(StatringViewController(), animated: true)
        }

        return cell
    }
}
