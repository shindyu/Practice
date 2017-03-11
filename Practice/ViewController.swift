import UIKit
import PureLayout

class ViewController: UIViewController {
    var redView: UIView!
    var blueView: UIView!
    var greenView: UIView!
    var yellowView: UIView!
    var purpleView: UIView!
    var containerView: UIView!
    var button: UIButton!

    var viewArray: NSArray = []
    var arrayConstraints: NSArray?

    override func viewDidLoad() {
        redView = UIView.newAutoLayout()
        blueView = UIView.newAutoLayout()
        greenView = UIView.newAutoLayout()
        yellowView = UIView.newAutoLayout()
        purpleView = UIView.newAutoLayout()
        containerView = UIView.newAutoLayout()
        button = UIButton.newAutoLayout()

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
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(containerView)
        view.addSubview(button)

        containerView.addSubview(greenView)
        containerView.addSubview(yellowView)
        containerView.addSubview(purpleView)
    }

    func configureSubviews() {
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        yellowView.backgroundColor = .yellow
        purpleView.backgroundColor = .purple

        viewArray = [greenView, yellowView, purpleView]

        button.setTitle("button", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(self.tapButton(_:)), for: .touchUpInside)
    }

    func setConstraints() {
        redView.autoAlignAxis(toSuperviewAxis: .vertical)
        redView.autoPinEdge(toSuperviewEdge: .top, withInset: 50.0)
        redView.autoSetDimensions(to: CGSize(width: 100.0, height: 100.0))

        blueView.autoAlignAxis(.horizontal, toSameAxisOf: redView)
        blueView.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        blueView.autoSetDimensions(to: CGSize(width: 100.0, height: 100.0))

        containerView.autoPinEdge(toSuperviewEdge: .left)
        containerView.autoPinEdge(toSuperviewEdge: .right)
        containerView.autoPinEdge(.top, to: .bottom, of: blueView)
        containerView.autoAlignAxis(toSuperviewAxis: .vertical)
        containerView.autoSetDimension(.height, toSize: 200.0)

        greenView.autoPinEdge(toSuperviewEdge: .top)
        greenView.autoPinEdge(toSuperviewEdge: .bottom)

        yellowView.autoPinEdge(toSuperviewEdge: .top)
        yellowView.autoPinEdge(toSuperviewEdge: .bottom)

        purpleView.autoPinEdge(toSuperviewEdge: .top)
        purpleView.autoPinEdge(toSuperviewEdge: .bottom)

        arrayConstraints = NSLayoutConstraint.autoCreateAndInstallConstraints {
            viewArray.autoDistributeViews(along: .horizontal, alignedTo: .horizontal, withFixedSpacing: 10.0, insetSpacing: false)
            } as NSArray

        button.autoPinEdge(.top, to: .bottom, of: containerView, withOffset: 100.0)
        button.autoAlignAxis(toSuperviewAxis: .vertical)
    }

    func tapButton(_ sender: UIButton) {
        if viewArray.count > 2 {
            viewArray = [greenView, yellowView]
            greenView.isHidden = false
            yellowView.isHidden = false
            purpleView.isHidden = true
        } else {
            viewArray = [greenView, yellowView, purpleView]
            greenView.isHidden = false
            yellowView.isHidden = false
            purpleView.isHidden = false
        }

        arrayConstraints?.autoRemoveConstraints()
        arrayConstraints = NSLayoutConstraint.autoCreateAndInstallConstraints {
            viewArray.autoDistributeViews(along: .horizontal, alignedTo: .horizontal, withFixedSpacing: 10.0, insetSpacing: false)
            } as NSArray

    }
}

