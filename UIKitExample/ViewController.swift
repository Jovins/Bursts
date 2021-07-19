//
//  ViewController.swift
//  UIKitExample
//
//  Created by Jovins on 2021/3/18.
//

import UIKit
import Bursts

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemBackground
        let safeArea = view.safeAreaLayoutGuide

        view.addSubview(fieldsStackView)
        NSLayoutConstraint.activate([
            fieldsStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            fieldsStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80),
            fieldsStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])

        view.addSubview(showButton)
        NSLayoutConstraint.activate([
            showButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            showButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            showButton.bottomAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 80)
        ])

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tap)
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var titleTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "Title"
        field.text = "Hello Bursts!"
        return field
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtitle"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var subtitleTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "Subtitle"
        field.text = "Use Bursts to show alerts"
        return field
    }()

    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Position"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var positionSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Top", "Bottom"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        return control
    }()

    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Duration"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var durationSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0.1
        slider.maximumValue = 10.0
        slider.value = 2.0
        slider.tintColor = UIColor.orange
        slider.addTarget(self, action: #selector(didChangeDuration), for: .valueChanged)
        return slider
    }()

    private lazy var iconLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Icon"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var iconSwitch: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    private lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Button"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var buttonSwitch: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    private lazy var fieldsStackView: UIStackView = {
        let views: [UIView] = [
            titleLabel, titleTextField,
            subtitleLabel, subtitleTextField,
            iconLabel, iconSwitch,
            buttonLabel, buttonSwitch,
            positionLabel, positionSegmentedControl,
            durationLabel, durationSlider
        ]

        let view = UIStackView(arrangedSubviews: views)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 5
        view.setCustomSpacing(20, after: titleTextField)
        view.setCustomSpacing(20, after: subtitleTextField)
        view.setCustomSpacing(20, after: iconSwitch)
        view.setCustomSpacing(20, after: buttonSwitch)
        view.setCustomSpacing(20, after: positionSegmentedControl)
        return view
    }()

    private lazy var showButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Bursts", for: .normal)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.contentEdgeInsets = .init(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(didTapShowButton), for: .touchUpInside)
        return button
    }()

    @objc
    private func didTapShowButton() {
        
        view.endEditing(true)
        let title = titleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let subtitle = subtitleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let position: Burst.Position = positionSegmentedControl.selectedSegmentIndex == 0 ? .top : .bottom
        let duration = TimeInterval(durationSlider.value)

        let icon = iconSwitch.isOn ? UIImage(systemName: "star.fill") : nil
        let buttonIcon = buttonSwitch.isOn ? UIImage(systemName: "arrowshape.turn.up.left") : nil

        let burst = Burst(
            title: title,
            subtitle: subtitle,
            icon: icon,
            action: .init(icon: buttonIcon, handler: {
                print("Burst tapped")
                Bursts.hide()
            }),
            position: position,
            duration: .seconds(duration)
        )
        Bursts.show(burst)
    }

    @objc
    private func didTap() {
        view.endEditing(true)
    }

    /// Select Duration
    @objc
    func didChangeDuration(slider: UISlider) {
        let duration = slider.value
        durationLabel.text = "Duration (\(String(format: "%.1f", duration)) s)"
    }
}


