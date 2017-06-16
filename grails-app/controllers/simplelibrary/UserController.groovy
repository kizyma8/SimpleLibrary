package simplelibrary

import com.simplelibrary.User

class UserController {
   def userService

def home(){
    redirect (controller: "books", action:"showBooks")
}
    def formReg(){

    }
    def register(){
        def user=new User(params)
    def u=User.findByUsername(params.username)
        if(u!=null){
            flash.message = "This username is already used"
            redirect(action:"formReg")
        }
        else{
        userService.addUser(user)
        redirect(controller: "login", action: "index")
    }}



    }



