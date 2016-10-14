class InterestedController {

    def addInterest = {
        def selectedArtId = params.id
        ArtEntity selectedArt = ArtEntity.get(selectedArtId)
        if (selectedArt) {
            if (!session['selectedArt'] || (!session['selectedArt'] instanceof Collection)) {
                session.selectedArt = new HashSet()
            }
            session.selectedArt << selectedArt
        }

        redirect(action: viewInterested)
    }


    def viewInterested = {
        def selectedArt = session['selectedArt']
        if (!selectedArt) {
            selectedArt = new HashSet()
        }
        render(view: "viewInterested", model: [selectedArt: selectedArt])
    }

    def removeFromCart = {
        Long id = Long.parseLong(params.id)
        def selectedArt
        if (id) {
            ArtEntity selectedArtEntity = ArtEntity.get(id)
            if (selectedArtEntity && session['selectedArt']) {
                selectedArt = session['selectedArt']
                selectedArt.remove(selectedArtEntity)
            }
        }
        render(view: "viewInterested", model: [selectedArt: selectedArt])
    }

    def sendInterest = {
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


}
