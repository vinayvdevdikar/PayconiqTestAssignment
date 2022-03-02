//
//  PopupScreenViewController.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit

class PopupScreenViewControllerImpl: UIViewController {
    var router: PopupScreenRouter!
    var interactor: PopupScreenInteractor!
    let configurator: PopupScreenConfigurator = PopupScreenConfiguratorImpl()
    var selectedCode: String = ""
    
    private lazy var popupView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints =  false
        button.addTarget(self, action: #selector(closeButtonDidTouches), for: .touchUpInside)
        return button
    }()
    
    private lazy var shuffelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints =  false
        button.addTarget(self, action: #selector(shuffelButtonDidTouches), for: .touchUpInside)
        return button
    }()
    
    private lazy var fancyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fancyicon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    private lazy var buttonContainer: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = baseUnit
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = baseUnit
        stackView.axis = .vertical
        return stackView
    }()
    
    private var topAnchor: NSLayoutConstraint!
    private var bottomAnchor: NSLayoutConstraint!
    private var leadingAnchor: NSLayoutConstraint!
    private var trailingAnchor: NSLayoutConstraint!
    
    private let baseUnit: CGFloat = 16.0
    private let heightPercentage: CGFloat = 10
    private let widthPercentage: CGFloat = 20
    private let imageHeight: CGFloat = 170
    private let longText: String = "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. This long text contains the your code"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configurator.configure(viewController: self)
        setUpView()
        setupTapGesture()
        applyStyling()
        applyViewModel()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        interactor.calculateMarginPercentage(with: size.width,
                                             percentage: widthPercentage,
                                             type: .width)
        interactor.calculateMarginPercentage(with: size.height,
                                             percentage: heightPercentage,
                                             type: .height)
        
        if UIDevice.current.orientation.isLandscape {
            fancyImageView.isHidden = true
        }else {
            fancyImageView.isHidden = false
        }
    }
    
    // MARK: - Setup Views
    
    /// `setUpView` used to setup all component.
    private func setUpView() {
        addContainerView()
        addPopupView()
        addStackView()
        interactor.calculateMarginPercentage(with: view.frame.width,
                                             percentage: widthPercentage,
                                             type: .width)
        interactor.calculateMarginPercentage(with: view.frame.height,
                                             percentage: heightPercentage,
                                             type: .height)
    }
    
    /// `setupTapGesture` is used to setup tap gesture.
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonDidTouches))
        backGroundView.addGestureRecognizer(tap)
    }
    
    /// `applyStyling` is used to set style for sub component.
    private func applyStyling() {
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        closeButton.setBorder()
        
        shuffelButton.setTitleColor(.black, for: .normal)
        shuffelButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        shuffelButton.setBorder()
        
        codeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        codeLabel.textColor = .black
    
        /// this call to set imageview hidden if orientation is landscape.
        if let interfaceOrientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation, interfaceOrientation.isLandscape {
            fancyImageView.isHidden = true
        }
    }
    
    /// `applyViewModel` is used to set the data on screen.
    private func applyViewModel() {
        codeLabel.text = "\(longText) \"\(selectedCode) \""
        self.title = "Popup"
        shuffelButton.setTitle("Shuffel", for: .normal)
        closeButton.setTitle("Close", for: .normal)
    }
}

///MARK:- `PopupScreenViewController` protocol methods implementation.

extension PopupScreenViewControllerImpl: PopupScreenViewController {
    
    /// `changeLeftRightConstraintConstant` this method is used to update the left and right constraint constant value.
    func changeLeftRightConstraintConstant(with margin: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            self?.trailingAnchor.constant = -margin
            self?.leadingAnchor.constant = margin
        }
    }
    
    /// `changeTopBottomConstraintConstant` this method is used to update the top and bottom constraint constant value.
    func changeTopBottomConstraintConstant(with margin: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            self?.topAnchor.constant = margin
            self?.bottomAnchor.constant = -margin
        }
    }
    
    /// `changeTheTextOfLabel` this method is used to update the text
    func changeTheTextOfLabel(with reShuffelCode: String) {
        DispatchQueue.main.async { [weak self] in
            self?.codeLabel.text = "\(self?.longText ?? "") \"\(reShuffelCode) \""
        }
    }
}

//MARK: - Method under these extensions are used to handle all actions.

private extension PopupScreenViewControllerImpl {
    @objc func closeButtonDidTouches() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.popupView.alpha = 0
        }) { [weak self] result in
            self?.popupView.isHidden = result
        }
    }
    
    @objc func shuffelButtonDidTouches() {
        let codeWithOutHypen = self.selectedCode.replacingOccurrences(of: "-", with: "")
        interactor.shuffelTheExistingCharater(with: codeWithOutHypen)
    }
}

//MARK: - These methods are used to add subcomponent on screen.

private extension PopupScreenViewControllerImpl {
    
    func addContainerView() {
        view.addSubview(backGroundView)
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            backGroundView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backGroundView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backGroundView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func addPopupView() {
        view.addSubview(popupView)
        topAnchor = popupView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor)
        bottomAnchor = popupView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        leadingAnchor = popupView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor)
        trailingAnchor = popupView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor)
        
        NSLayoutConstraint.activate([
            topAnchor ,
            bottomAnchor,
            leadingAnchor,
            trailingAnchor
        ])
    }
    
    func addStackView() {
        popupView.addSubview(buttonContainer)
        popupView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(fancyImageView)
        containerStackView.addArrangedSubview(codeLabel)
        buttonContainer.addArrangedSubview(closeButton)
        buttonContainer.addArrangedSubview(shuffelButton)
        let bottomConstraint = containerStackView.bottomAnchor.constraint(equalTo: buttonContainer.topAnchor,
                                                                          constant: -baseUnit)
        bottomConstraint.priority = UILayoutPriority(rawValue: 999)
        
        NSLayoutConstraint.activate([
            buttonContainer.bottomAnchor.constraint(equalTo: popupView.bottomAnchor,
                                                    constant: -baseUnit),
            buttonContainer.leadingAnchor.constraint(equalTo: popupView.leadingAnchor,
                                                     constant: baseUnit),
            buttonContainer.trailingAnchor.constraint(equalTo: popupView.trailingAnchor,
                                                      constant: -baseUnit),
            buttonContainer.heightAnchor.constraint(equalToConstant: 30.0),
            containerStackView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor,
                                                        constant: baseUnit),
            containerStackView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor,
                                                         constant: -baseUnit),
            containerStackView.topAnchor.constraint(equalTo: popupView.topAnchor,
                                                    constant: baseUnit),
            bottomConstraint,
            
        ])
    }
}


