class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "login",action: "index")
//      "500"(view:'/error')
        "500"(view:'/errors/500Error')
       "404"(view: '/errors/404Error')
	}
}
