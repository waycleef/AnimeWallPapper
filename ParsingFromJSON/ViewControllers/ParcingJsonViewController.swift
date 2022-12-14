//
//  ViewController.swift
//  ParsingFromJSON
//
//  Created by Алишер Маликов on 13.12.2022.
//

import UIKit

class ParcingJsonViewController: UIViewController {
    
    private let waifuUrl = "https://api.waifu.im/search/?included_tags=selfies"
    
    @IBAction func checkApiAction() {
        getWaifuInfo()
    }
    
    
    // MARK: - Private Methods
    // AlertControllers
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Успешно",
                message: "Результат можете увидеть в консоли",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Неуспешно",
                message: "Ошибку можно увидеть в консоли",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

// MARK: - Networking
extension ParcingJsonViewController {
    private func getWaifuInfo() {
        guard let url = URL(string: waifuUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error desctription")
                return
            }
            
            do {
                let animeImagesInfo = try JSONDecoder().decode(AnimeImages.self, from: data)
                print(animeImagesInfo)
                self?.successAlert()
            }
            catch let error {
                print(error)
                self?.failedAlert()
            }
        }.resume()
    }
}






