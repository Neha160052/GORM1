package com.ttnd.linksharing

import CO.ResourceSearchCO
import VO.RatingInfoVO

class ResourceController {
   // static scaffold =Resource

    def index() { }

    def search(ResourceSearchCO co){
         if(co.q){
             co.visibility=Visibility.PUBLIC
         }
    }

    def show(long id){
        Resource resource=Resource.get(id)
        RatingInfoVO vo=resource.ratingInfo
        render"Total Score=${vo.totalScore},Total Votes=${vo.totalVotes},Average Score=${vo.averageScore}"

    }


}
