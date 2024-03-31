//
//  HomeContract.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

protocol HomeContractView: AnyObject {
    func onGetListCenters(listCenters: [Center])
}

protocol HomeContractPresenter {
    func attachView(view: HomeContractView)
    func detachView()
    func getListCenters()
}
