//
//  UICollectionView.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/30/21.
//

import UIKit

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let weekDate = getWeek(locale: UserSettings.dateLocale ?? "en_EN")

        let cell = dailyCollection.dequeueReusableCell(withReuseIdentifier: "DailyCell", for: indexPath) as! DailyCell
        if items.count != 0 {
            cell.setupCell(image: items[0].daily[indexPath.item].weatherIcon, temp: items[0].daily[indexPath.item].dayTemp, date: weekDate[indexPath.item])
        }
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weekDate = getWeek(locale: UserSettings.dateLocale ?? "en_EN")
        let vc = getViewControllerByID("detailVC") as! DetailViewController
        vc.dayIndex = indexPath.item
        vc.day = weekDate[indexPath.item]
        navigationController?.show(vc, sender: self)
        
    }
}
