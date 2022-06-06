//
//  DetailViewController.swift
//  Project1
//
//  Created by Luthfor Khan on 6/5/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    var count: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = count
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let img = selectedImage {
            imageView.image = UIImage(named: img)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let img = imageView.image?.jpegData(compressionQuality: 0.8),
              let name = selectedImage else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [img, name], applicationActivities: [])
        
        // needed for an iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
