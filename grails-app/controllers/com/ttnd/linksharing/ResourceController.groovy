package com.ttnd.linksharing

import co.ResourceSearchCO

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
        Resource resource = Resource.get(id)
        [resource: resource]
    }

    def delete(long id) {
        Resource resource = Resource.get(id)
        if (session.user.canDeleteResource(resource)) {
            resource.delete()
            render "Resource is detleted"
        } else {
            render "Can not Delete it"
        }

    }

}
