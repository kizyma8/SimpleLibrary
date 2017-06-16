package simplelibrary

import com.simplelibrary.Role
import com.simplelibrary.User
import com.simplelibrary.UserRole
import grails.transaction.Transactional

@Transactional
class UserService {
    def getUserList(){
        def users = User.list()
        [users:users]

    }
   def addUser(User user){

       user.save(flush: true)
       def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
       new UserRole(user: user, role: Role.findByAuthority('ROLE_USER')).save(flush: true, failOnError: true)



   }

}
