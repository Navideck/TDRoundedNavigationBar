//
//  TDRoundedNavigationBar.swift
//  TDRoundedNavigationBarDemo
//
//  Created by Fotios Dimanidis on 7/8/15.
//  Copyright (c) 2015 Navideck. All rights reserved.
//

import UIKit

public class TDRoundedNavigationBar: UINavigationBar {
    
    public var navBarHeight = 60.0
    public var navBarRadius = 7.5    //Set to 0.0 for square corners
    public var navBarSideSpacing = 20.0
    public var navBarSpacingWhenStatusBarHidden = 5.0
    public var corners = UIRectCorner.allCorners // [UIRectCorner.bottomLeft, UIRectCorner.bottomRight]
    public var navBarColor : UIColor? //= UIColor.blueColor()
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    override init(frame: CGRect) {  //For code initialization
        super.init(frame: frame)
        setupAppearance()
    }
    
    required public init?(coder aDecoder: NSCoder) {   //For IB initialization
        super.init(coder: aDecoder)
        setupAppearance()
    }   
    
    func setupAppearance() {
        // Compensate for height change by moving back button
        let offset : CGFloat = (44 - CGFloat(navBarHeight))/2
        
        TDRoundedNavigationBar.appearance().setTitleVerticalPositionAdjustment(offset, for: UIBarMetrics.default)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [TDRoundedNavigationBar.self]).setBackgroundVerticalPositionAdjustment(offset, for: .default)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [TDRoundedNavigationBar.self]).setBackButtonBackgroundVerticalPositionAdjustment(offset, for: .default)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [TDRoundedNavigationBar.self]).setBackButtonTitlePositionAdjustment(UIOffsetMake(0, offset), for: .default)  
        
        if let navBarColorVal = navBarColor {
            self.barTintColor = navBarColorVal
        }
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = layer.bounds
        let maskPath = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: navBarRadius, height: navBarRadius))
        let maskLayer = CAShapeLayer()  //?
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
        
        // As there's no API to reposition the back button's arrow we do it here
        for view in self.subviews {
            // The arrow is a class of type _UINavigationBarBackIndicatorView. Any bar button item is of type UINavigationButton.
            if String(describing: type(of: view)) == "_UINavigationBarBackIndicatorView" || String(describing: type(of: view)) == "UINavigationButton" {
                var frame = view.frame
                if view.tag == 0 {
                    // On the first layout we work out what the actual position should be by applying our offset to the default position.
                    frame.origin.y = (CGFloat(navBarHeight) - view.frame.size.height)/2
                    view.tag = Int(frame.origin.y)
                }
                else{
                    frame.origin.y = CGFloat(view.tag)
                }
                // Update the frame.
                view.frame = frame
            }
        }
    }
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {    //Set bar & spacing size. Used when the status bar is hidden to give some top space to our navigation bar.
        
        guard let superview = self.superview else {return size}
        
        var computedHeight = navBarHeight
        if UIApplication.shared.isStatusBarHidden {
            computedHeight += navBarSpacingWhenStatusBarHidden
        }
        let newSize = CGSize(width: superview.bounds.size.width - CGFloat(navBarSideSpacing), height: CGFloat(computedHeight))
        return newSize
    }
    
    override public var bounds : CGRect {      //Set bar size
        didSet {
            self.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: CGFloat(navBarHeight))
        }
    }
}
