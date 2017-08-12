//
//  backView.swift
//  Swift-09
//
//  Created by liangzhen on 2017/8/12.
//  Copyright © 2017年 liangzhen. All rights reserved.
//

import UIKit

class backView: UIView, UIScrollViewDelegate {

    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView.init(image: UIImage.init(named: "Steve"))
        
        setUpScrollView()
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    override func layoutSubviews() {
        super.layoutSubviews()
        setZoomScaleFor(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }
    
    
    
    fileprivate func setUpScrollView() {
        
        scrollView = UIScrollView.init(frame: self.bounds)
        //这里是一种约束
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        imageView.backgroundColor = UIColor.red
        scrollView.addSubview(imageView)
        self.addSubview(scrollView)
        
    }
    
    fileprivate func setZoomScaleFor(_ scrollViewSize: CGSize) {
        
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let hightScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, hightScale)
        //最小的缩放size设置为 保证最小缩放为 看到图片整体大小 而且 充满屏幕宽或者 屏幕高
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    }
    //当imageView的size小于scrollViewSize时保证image居中。
    fileprivate func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width)/2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height)/2.0 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        print(verticalSpace,horizontalSpace,scrollViewSize.width,scrollViewSize.height)
        
    }
    
    
    // 缩放的view  这个方法会返回进行缩放时所使用的 UIView 对象
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    //scorllView的contentView改变的时候会被调用
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.recenterImage()
    }

    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
