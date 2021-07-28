//
//  ApiRequest.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/25/21.
//

import Foundation

func getData(from url: String, sender: MainViewController){
    let dataTask = URLSession.shared.dataTask(with: URL(string: url)!){ data, _, _ in
        guard let jsonData = data else{
            return
        }
        do {
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(Response.self, from: jsonData)
            setData(data: apiResponse, sender: sender)
        }catch {
            print(error)
        }
    }
    dataTask.resume()
}
