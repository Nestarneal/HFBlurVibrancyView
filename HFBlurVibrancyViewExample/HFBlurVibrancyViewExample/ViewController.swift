//
//  ViewController.swift
//  HFBlurVibrancyViewExample
//
//  Created by Nestarneal on 2018/07/01.
//  Copyright © 2018年 Han-Feng Lin. All rights reserved.
//

/**
 The points to use HFBlurVibrancyView are
 
 1) Construct HFBlurVibrancyView with the intializer: HFBlurVibrancyView(blurStyle:vibrancyBlurStyle:)
 
 2) Add HFBlurVibrancyView into your view hierarchy. The views, such as UIImageView in our example, under
 the HFBlurVibrancyView will reflected by the visual effect.
 
 3) Add any views you want into the property contentView of HFBlurVibrancyView. And set its auto layout
 constraints the make the views you added can be shown on the screen.
 
 That's all, enjoy it!
 
 If you have any feedback, feel free to contact to me: nestarneal@gmail.com
 */

import UIKit

// You should import the framework in order to use HFBlurVibrancyView.
import HFBlurVibrancyView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) Make the background color to white color.
        //    (If you construct the app with code instead of story board, the default color of view is black.)
        view.backgroundColor = .white
        
        // 2) Setup an image view to fill the whole screen (excluding status bar) to show the blur and vibrancy effect.
        setupExampleImage()
        
        // 3) Setup HFBlurVibrancyView above image view to show the visual effect.
        let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 30)
            label.text = "Hello HFBlurVibrancyView!"
            return label
        }()
        setupHFBlurVibrancyView(with: label)
    }
}

extension ViewController {
    
    func setupExampleImage() {
        // Setup image view and add it into view hierarchy.
        let imageView = UIImageView(image: UIImage(named: "example"))
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        // Setup auto layout constraints.
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    func setupHFBlurVibrancyView(with label: UILabel?) {
        // Setup a HFBlurVibrancyView into view hierarchy.
        let effectView = HFBlurVibrancyView(blurStyle: .light, vibrancyBlurStyle: .extraLight)
        view.addSubview(effectView)
        
        // Setup auto layout constraints.
        effectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            effectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            effectView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            effectView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            effectView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        // If there is a label passed to this methods, we put the label at the center of the scrren.
        // Note: You should add the label into the contentView of HFBlurVibrancyView instead of
        // calling addSubView directly.
        // That is, you SHOULD NOT call:
        //      effectView.addSubView(label)
        // Instead, you SHOULD CALL:
        //      effectView.contentView.addSubview(label)
        if let label = label {
            effectView.contentView.addSubview(label)
            
            // Also, you should set the auto layout constraints.
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: effectView.topAnchor),
                label.leadingAnchor.constraint(equalTo: effectView.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: effectView.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: effectView.bottomAnchor)])
        }
    }
}
