package com.ttnd.linksharing

import CO.ResourceSearchCO
import VO.RatingInfoVO

class ResourceController {
    // static scaffold =Resource

    def index() {
        render("sucess")
    }

    def search(ResourceSearchCO co) {
        if (co.q) {
            co.visibility = Visibility.PUBLIC
        }
    }

    def show(long id) {
        User user = session.user
        Resource resource = Resource.get(id)
        [resource: resource]
    }

    def delete(long id) {
        User user = session.user
        print user
        Resource resource = Resource.get(id)
        if (user.canDeleteResource(resource)) {
            resource.delete()
            render "Resource is detleted"
        } else {
            render "Can not Delete it"
        }

    }

}
