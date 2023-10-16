
import UIKit

class CreateButton: UIButton {

    //MARK: Public attributes
    var inputState: InputState = .normal {
        didSet {
            switch inputState {
            case .normal:
                borderColor = .adjVeryLightPinkAndBlueyGrey
                plusButton.isHighlighted = false
                descriptionButton.titleLabel?.textColor = UIColor.strawberry

            case .focused:
                borderColor = .adjBlueyGreyAndVeryLightPink
                plusButton.isHighlighted = true
                descriptionButton.titleLabel?.textColor = UIColor.rosyPink

            case .invalid:
                borderColor = .strawberry
                plusButton.imageView?.image = UIImage(named: "icoPlusAddDeckRed")
                UIDevice.vibrate()
                InputState.setInvalidInputAnimation(for: self)
            }
        }
    }

    //MARK: Private UI elements
    private let plusButton = UIButton()
    private let descriptionButton = UIButton()

    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    //MARK: overriding holding click methods
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        inputState = .focused
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        inputState = .normal
    }
}

//MARK: Private methods
private extension CreateDeckOrderButton {
    func setup() {
        isUserInteractionEnabled = true
        setupPlusButton()
        setupDescriptionButton()
    }

    func setupPlusButton() {
        addSubview(plusButton)
        plusButton.isUserInteractionEnabled = false
        plusButton.cornerRadius = plusButton.frame.height * 0.5
        plusButton.setImage(UIImage(named: "icoPlusAddDeck"), for: .normal)
        plusButton
            .centerY(to: centerYAnchor)
            .centerX(to: centerXAnchor)
    }

    func setupDescriptionButton() {
        addSubview(descriptionButton)
        descriptionButton.isEnabled = false
        descriptionButton.titleLabel?.font = .systemFont(ofSize: 12)
        descriptionButton.setTitle("Create and order your new deck.".localized, for: .normal)
        descriptionButton.setTitleColor(.strawberry , for: .normal)
        descriptionButton
            .top(to: plusButton.bottomAnchor, padding: 18)
            .height(15)
            .centerX(to: centerXAnchor)
    }
}



enum InputState {
    case normal, focused, invalid

    //MARK: Animations
    static func setInvalidInputAnimation(for view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))
        view.layer.add(animation, forKey: "position")
    }
}
