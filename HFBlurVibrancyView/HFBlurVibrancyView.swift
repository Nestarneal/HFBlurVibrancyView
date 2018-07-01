//
//  HFBlurVibrancyView.swift
//  HFBlurVibrancyView
//
//  Created by Nestarneal on 2018/07/01.
//  Copyright © 2018年 Han-Feng Lin. All rights reserved.
//

import UIKit

open class HFBlurVibrancyView: UIView {
    
    public let contentView = UIView()
    
    public convenience init(blurStyle: UIBlurEffectStyle, vibrancyBlurStyle: UIBlurEffectStyle) {
        self.init(frame: .zero)
        
        backgroundColor = .clear
        setupEffectsWith(blurStyle: blurStyle, vibrancyBlurStyle: vibrancyBlurStyle)
    }
}

extension HFBlurVibrancyView {
    
    func setupEffectsWith(blurStyle: UIBlurEffectStyle, vibrancyBlurStyle: UIBlurEffectStyle) {
        
        // Setup effect and related views.
        let blurEffect = UIBlurEffect(style: blurStyle)
        let vibrancyBlurEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: vibrancyBlurStyle))
        
        let blurView = UIVisualEffectView(effect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyBlurEffect)
        
        // Add views into view hierarchy.
        addSubview(blurView)
        blurView.contentView.addSubview(vibrancyView)
        vibrancyView.contentView.addSubview(contentView)
        
        // Set auto layout constraints.
        blurView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: self.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vibrancyView.topAnchor.constraint(equalTo: blurView.topAnchor),
            vibrancyView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            vibrancyView.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            vibrancyView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor)])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: vibrancyView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: vibrancyView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: vibrancyView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: vibrancyView.bottomAnchor)])
    }
}
