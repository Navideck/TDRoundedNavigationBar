//
//  TDRoundedNavigationBar.swift
//  TDRoundedNavigationBarDemo
//
//  Created by Fotios Dimanidis on 7/8/15.
//  Copyright (c) 2015 Navideck. All rights reserved.
//

import UIKit

public class TDRoundedNavigationBar: UINavigationBar {
    
    @IBInspectable public var navBarHeight: Double = 60.0 {
        didSet {
            setupAppearance()
        }
    }
    @IBInspectable public var horizontalSpacing : Double = 20.0 {
        didSet {
            setupAppearance()
        }
    }
    @IBInspectable public var verticalSpacing : Double = 0.0 {
        didSet {
            setupAppearance()
        }
    }
    @IBInspectable public var roundedTopLeftCorner: Bool = true
    @IBInspectable public var roundedTopRightCorner: Bool = true
    @IBInspectable public var roundedBottomRightCorner: Bool = true
    @IBInspectable public var roundedBottomLeftCorner: Bool = true
    @IBInspectable public var cornerRadius : Double = 7.5    //Set to 0.0 for square corners
    @IBInspectable public var color : UIColor?
    private var corners: UIRectCorner {
        get {
            var roundedCorners : UIRectCorner = UIRectCorner(rawValue: 0)
            if roundedTopLeftCorner {
                roundedCorners = roundedCorners.union(.topLeft)
            }
            if roundedTopRightCorner {
                roundedCorners = roundedCorners.union(.topRight)
            }
            if roundedBottomRightCorner {
                roundedCorners = roundedCorners.union(.bottomRight)
            }
            if roundedBottomLeftCorner {
                roundedCorners = roundedCorners.union(.bottomLeft)
            }
            return roundedCorners
        }
    }
    
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
        
        if let navBarColorVal = color {
            self.barTintColor = navBarColorVal
        }
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = layer.bounds
        let maskPath = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
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
            computedHeight += verticalSpacing + 5
        }
        else {
            computedHeight += verticalSpacing
        }
        let newSize = CGSize(width: superview.bounds.size.width - CGFloat(horizontalSpacing), height: CGFloat(computedHeight))
        return newSize
    }
    
    override public var bounds : CGRect {      //Set bar size
        didSet {
            self.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: CGFloat(navBarHeight))
        }
    }
}
