class LoginController {



    def index = { }

    def doLogin = {
      def username = params.username
      def password = params.password
      Person person = Person.findByUsernameAndPassword(username, password)
      if (person) {
        session["user"] = person
        render(view: "loginSuccess")
      } else {
        flash.message = "Username and password not found"
        render(view: "index", model: [person: person])
      }
    }


 /**
  * Main menu for admin users
  */
  def loginSuccess = {

  }

   def doLogoff = {
     session.invalidate()
     render(view: "index")
   }

}
