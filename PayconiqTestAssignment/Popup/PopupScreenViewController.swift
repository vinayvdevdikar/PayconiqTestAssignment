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
    
    private lazy var popupView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
        return button
    }()
    
    private lazy var shuffelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints =  false
        return button
    }()
    
    private lazy var fancyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fancyicon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
            fancyImageView.setNeedsDisplay()
            fancyImageView.setNeedsLayout()
            
        }
        
        
    }
    private func setUpView() {
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    /// `applyStyling` is used to set style for sub component.
    private func applyStyling() {
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.backgroundColor = .green
        closeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        shuffelButton.setTitleColor(.black, for: .normal)
        shuffelButton.backgroundColor = .green
        shuffelButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        codeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        codeLabel.textColor = .black
        
        view.backgroundColor = .lightGray
    }
    
    /// `applyViewModel` is used to set the data on screen.
    private func applyViewModel() {
        codeLabel.text = "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. This long text contains the your code \"asdasd \" "
        self.title = "Popup"
        shuffelButton.setTitle("Shuffel", for: .normal)
        closeButton.setTitle("Close", for: .normal)
    }
}

///MARK:- `PopupScreenViewController` protocol methods implementation.

extension PopupScreenViewControllerImpl: PopupScreenViewController {
    
    /// this method is used to update the left and right constraint constant value.
    func changeLeftRightConstraintConstant(with margin: CGFloat) {
        DispatchQueue.main.async {
            self.trailingAnchor.constant = -margin
            self.leadingAnchor.constant = margin
        }
    }
    
    /// this method is used to update the top and bottom constraint constant value.
    func changeTopBottomConstraintConstant(with margin: CGFloat) {
        DispatchQueue.main.async {
            self.topAnchor.constant = margin
            self.bottomAnchor.constant = -margin
        }
    }
}

///MARK:- Method under these extensions are used to handle all actions.

private extension PopupScreenViewControllerImpl {
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.popupView.alpha = 0
        }) { [weak self] result in
            self?.popupView.isHidden = result
        }
    }
}

///MARK:- These methods are used to add subcomponent on screen.

private extension PopupScreenViewControllerImpl {
    
    func addPopupView() {
        view.addSubview(popupView)
        topAnchor = popupView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor)
        bottomAnchor = popupView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        leadingAnchor = popupView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        trailingAnchor = popupView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        NSLayoutConstraint.activate([
            topAnchor ,
            bottomAnchor,
            leadingAnchor,
            trailingAnchor
        ])
        
    }
    
    func addStackView() {
        popupView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(fancyImageView)
        containerStackView.addArrangedSubview(codeLabel)
        buttonContainer.addArrangedSubview(closeButton)
        buttonContainer.addArrangedSubview(shuffelButton)
        containerStackView.addArrangedSubview(buttonContainer)
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: baseUnit),
            containerStackView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -baseUnit),
            containerStackView.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -baseUnit),
            containerStackView.topAnchor.constraint(equalTo: popupView.topAnchor, constant: baseUnit),
        ])
    }
}
