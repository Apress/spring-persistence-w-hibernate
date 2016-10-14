class BioController {

    def appBio = {

    }


    def contact = {
        String destinationAddress = grailsApplication.config.contactMail;
        Person person = new Person(params)
        String comment = params.comment
        String messageContent = getMailMessage(person, session['selectedArt'], comment)
        if (person) {
            //todo: send email using person details

           try {
                sendMail {
                  to destinationAddress
                  subject "Someone interested in your artwork"
                  body messageContent
                }

                // send mail to end-user
                 sendMail {
                  to "${person.emailAddress}"
                  subject "Thank you for your interest in Barbara Israel's artwork"
                  body "Thank you for your interest in Barbara Israel's artwork. We will get back to you shortly regarding your inquiry."
                }
           } catch (Exception e) {
               log.error("Error sending email")
               flash.message = "There was an error sending your email. Please try again."
               render(view: "appBio")
           }

        }
        render (view: "contactSuccess")
    }

    private String getMailMessage(Person person, Set selectedArt, def comment) {
        String message = """
            Someone is interested in your artwork.

            Their contact info is:
                Name: ${person.firstName} ${person.lastName}
                Email Address: ${person.emailAddress}
                Phone: ${person.telephone}

            They are interested in the following artwork:

                """

         String selectedArtString = selectedArt.inject("") {String string, ArtEntity art ->
            string + "Name: ${art.title}/n Description: ${art.description}/n"
         }
        return "${message} ${selectedArtString} Comment: ${comment}"
    }

}
