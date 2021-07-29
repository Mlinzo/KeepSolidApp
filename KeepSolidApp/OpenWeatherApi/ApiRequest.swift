//
//  ApiRequest.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/25/21.
//

import Foundation

func getData(sender: MainViewController){
    
    let url = buildURL()
    let dataTask = URLSession.shared.dataTask(with: url){ data, _, _ in
        guard let jsonData = data else{
            print("data do not gathered")
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
