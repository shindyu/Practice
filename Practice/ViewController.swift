import UIKit
import PureLayout

// PureLayout Practice
class ViewController: UIViewController {
    var greenButton: UIButton!
    var yellowButton: UIButton!
    var redButton: UIButton!
    var horizontalContainerView: UIView!
    var greenButton2: UIButton!
    var yellowButton2: UIButton!
    var redButton2: UIButton!
    var verticalContainerView: UIView!
    var horizontalButton: UIButton!
    var verticalButton: UIButton!

    var horizontalViewArray: NSArray = []
    var verticalViewArray: NSArray = []
    var horizonralArrayConstraints: NSArray?
    var verticalArrayConstraints: NSArray?

    override func viewDidLoad() {
        greenButton = UIButton.newAutoLayout()
        yellowButton = UIButton.newAutoLayout()
        redButton = UIButton.newAutoLayout()
        horizontalContainerView = UIView.newAutoLayout()
        greenButton2 = UIButton.newAutoLayout()
        yellowButton2 = UIButton.newAutoLayout()
        redButton2 = UIButton.newAutoLayout()
        verticalContainerView = UIView.newAutoLayout()
        horizontalButton = UIButton.newAutoLayout()
        verticalButton = UIButton.newAutoLayout()

        super.viewDidLoad()

        addSubviews()
        configureSubviews()
        setConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addSubviews() {
        view.addSubview(horizontalContainerView)
        horizontalContainerView.addSubview(greenButton)
        horizontalContainerView.addSubview(yellowButton)
        horizontalContainerView.addSubview(redButton)
        view.addSubview(horizontalButton)
        view.addSubview(verticalContainerView)
        verticalContainerView.addSubview(greenButton2)
        verticalContainerView.addSubview(yellowButton2)
        verticalContainerView.addSubview(redButton2)
        view.addSubview(verticalButton)

    }

    func configureSubviews() {
        horizontalViewArray = [greenButton, yellowButton, redButton]
        verticalViewArray = [greenButton2, yellowButton2, redButton2]

        horizontalContainerView.backgroundColor = .lightGray
        greenButton.backgroundColor = .green
        yellowButton.backgroundColor = .yellow
        redButton.backgroundColor = .red

        verticalContainerView.backgroundColor = .lightGray
        greenButton2.backgroundColor = .green
        yellowButton2.backgroundColor = .yellow
        redButton2.backgroundColor = .red


        greenButton.setTitle("greeeeeeeen", for: .normal)
        greenButton.setTitleColor(.gray, for: .normal)
        greenButton.addTarget(self, action: #selector(self.tapHorizontalButton(_:)), for: .touchUpInside)

        yellowButton.setTitle("yelloww", for: .normal)
        yellowButton.setTitleColor(.gray, for: .normal)
        yellowButton.addTarget(self, action: #selector(self.tapHorizontalButton(_:)), for: .touchUpInside)

        redButton.setTitle("red", for: .normal)
        redButton.setTitleColor(.gray, for: .normal)
        redButton.addTarget(self, action: #selector(self.tapHorizontalButton(_:)), for: .touchUpInside)

        horizontalButton.setTitle("horizontalButton", for: .normal)
        horizontalButton.setTitleColor(.gray, for: .normal)
        horizontalButton.addTarget(self, action: #selector(self.tapHorizontalButton(_:)), for: .touchUpInside)

        greenButton2.setTitle("greeeeeeeen", for: .normal)
        greenButton2.setTitleColor(.gray, for: .normal)
        greenButton2.addTarget(self, action: #selector(self.tapVerticalButton(_:)), for: .touchUpInside)

        yellowButton2.setTitle("yelloww", for: .normal)
        yellowButton2.setTitleColor(.gray, for: .normal)
        yellowButton2.addTarget(self, action: #selector(self.tapVerticalButton(_:)), for: .touchUpInside)

        redButton2.setTitle("red", for: .normal)
        redButton2.setTitleColor(.gray, for: .normal)
        redButton2.addTarget(self, action: #selector(self.tapVerticalButton(_:)), for: .touchUpInside)

        verticalButton.setTitle("verticalButton", for: .normal)
        verticalButton.setTitleColor(.gray, for: .normal)
        verticalButton.addTarget(self, action: #selector(self.tapVerticalButton(_:)), for: .touchUpInside)
    }

    func setConstraints() {
        horizontalButton.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
        horizontalButton.autoPinEdge(toSuperviewEdge: .left, withInset: 20.0)

        verticalButton.autoPinEdge(toSuperviewEdge: .right, withInset: 20.0)
        verticalButton.autoAlignAxis(.horizontal, toSameAxisOf: horizontalButton)

        horizontalContainerView.autoPinEdge(.top, to: .bottom, of: horizontalButton, withOffset: 20.0)
        horizontalContainerView.autoAlignAxis(toSuperviewAxis: .vertical)
        horizontalContainerView.autoSetDimension(.height, toSize: 200.0)

        greenButton.autoPinEdge(toSuperviewEdge: .top)
        greenButton.autoPinEdge(toSuperviewEdge: .bottom)

        yellowButton.autoPinEdge(toSuperviewEdge: .top)
        yellowButton.autoPinEdge(toSuperviewEdge: .bottom)

        redButton.autoPinEdge(toSuperviewEdge: .top)
        redButton.autoPinEdge(toSuperviewEdge: .bottom)

        horizonralArrayConstraints = NSLayoutConstraint.autoCreateAndInstallConstraints {
            horizontalViewArray.autoDistributeViews(along: .horizontal, alignedTo: .horizontal, withFixedSpacing: 20.0, insetSpacing: false, matchedSizes: false)
            } as NSArray

        verticalContainerView.autoPinEdge(.top, to: .bottom, of: horizontalContainerView, withOffset: 20.0)
        verticalContainerView.autoAlignAxis(toSuperviewAxis: .vertical)
        verticalContainerView.autoSetDimension(.width, toSize: 300.0)

        greenButton2.autoPinEdge(toSuperviewEdge: .left)
        greenButton2.autoPinEdge(toSuperviewEdge: .right)

        yellowButton2.autoPinEdge(toSuperviewEdge: .left)
        yellowButton2.autoPinEdge(toSuperviewEdge: .right)

        redButton2.autoPinEdge(toSuperviewEdge: .left)
        redButton2.autoPinEdge(toSuperviewEdge: .right)

        verticalArrayConstraints = NSLayoutConstraint.autoCreateAndInstallConstraints {
            verticalViewArray.autoDistributeViews(along: .vertical, alignedTo: .vertical, withFixedSpacing: 20.0, insetSpacing: false, matchedSizes: false)
            } as NSArray
    }

    func tapHorizontalButton(_ sender: UIButton) {
        if horizontalViewArray.count > 2 {
            horizontalViewArray = [greenButton, redButton]
            greenButton.isHidden = false
            yellowButton.isHidden = true
            redButton.isHidden = false
        } else {
            horizontalViewArray = [greenButton, yellowButton, redButton]
            greenButton.isHidden = false
            yellowButton.isHidden = false
            redButton.isHidden = false
        }

        horizonralArrayConstraints?.autoRemoveConstraints()
        horizonralArrayConstraints = NSLayoutConstraint.autoCreateAndInstallConstraints {
            horizontalViewArray.autoDistributeViews(along: .horizontal, alignedTo: .horizontal, withFixedSpacing: 20.0, insetSpacing: false, matchedSizes: false)
            } as NSArray
    }

    func tapVerticalButton(_ sender: UIButton) {
        if verticalViewArray.count > 2 {
            verticalViewArray = [greenButton2, redButton2]
            greenButton2.isHidden = false
            yellowButton2.isHidden = true
            redButton2.isHidden = false
        } else {
            verticalViewArray = [greenButton2, yellowButton2, redButton2]
            greenButton2.isHidden = false
            yellowButton2.isHidden = false
            redButton2.isHidden = false
        }

        verticalArrayConstraints?.autoRemoveConstraints()
        verticalArrayConstraints = NSLayoutConstraint.autoCreateAndInstallConstraints {
            verticalViewArray.autoDistributeViews(along: .vertical, alignedTo: .vertical, withFixedSpacing: 20.0, insetSpacing: false, matchedSizes: false)
            } as NSArray
    }
}

