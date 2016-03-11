package CO

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

@Validateable
class RegisterCO {
    String firstName
    String lastName
    String username
    String email
    String password
    String confirmPassword
   // String photo
    MultipartFile userPhoto

    static constraints = {
        email(blank: false, email: true)
        password(blank: false, minSize: 5)
        firstName(blank: false)
        lastName(blank: false)
        username(blank: false)
        userPhoto(nullable: true)
        confirmPassword(bindable: true, nullable: true, blank: true, validator: { val, user ->
            return (val != null) && val.equals(user.password) ?: "com.tothenew.co.RegisterCO.confirmPassword.validator"
        })
    }


}
