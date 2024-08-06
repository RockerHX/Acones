// The Swift Programming Language
// https://docs.swift.org/swift-book



#if os(iOS)


import UIKit
import Kingfisher

class Acones {

    static let shared = Acones()
    private let baseURL = "https://api.iconify.design/"

    func fetchIcon(named name: String?, completion: @escaping (UIImage?) -> Void) {

        guard let iconName = name,
              let url = URL(string: "\(baseURL)\(iconName).svg")
        else {
            completion(nil)
            return
        }

        let resource = KF.ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource, options: [.processor(SVGProcessor())], progressBlock: nil) { result in
            switch result {
            case .success(let imageResult):
                completion(imageResult.image)
            case .failure(let error):
                debugPrint(error)
                completion(nil)
            }
        }
    }
}


import SwiftDraw
struct SVGProcessor: ImageProcessor {

    var identifier = "com.sample.SVGProcessor"

    private func convert(from data: Data?) -> UIImage? {
        guard let orginData = data else { return nil }
        let svg = SVG(data: orginData)
        return svg?.rasterize()
    }

    // 将数据转换为 KFCrossPlatformImage（兼容多平台的图像类型）
    func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .data(let data):
            guard let svgImage = convert(from: data) else { return nil }
            return svgImage
        default:
            return nil
        }
    }

}


@IBDesignable
class AconesImageView: UIImageView {

    @IBInspectable var name: String? {
        didSet {
            guard let iconName = name else { return }
            Acones.shared.fetchIcon(named: iconName) { [weak self] image in
                self?.image = image
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        guard let iconName = name else { return }
        Acones.shared.fetchIcon(named: iconName) { [weak self] image in
            self?.image = image
        }
    }
}


#endif
