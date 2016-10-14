class PersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ personList: Person.list( params ) ]
    }

    def show = {
        def person = Person.get( params.id )

        if(!person) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ person : person ] }
    }

    def delete = {
        def person = Person.get( params.id )
        if(person) {
            person.delete()
            flash.message = "Person ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def person = Person.get( params.id )

        if(!person) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ person : person ]
        }
    }

    def update = {
        def person = Person.get( params.id )
        if(person) {
            person.properties = params
            if(!person.hasErrors() && person.save()) {
                flash.message = "Person ${params.id} updated"
                redirect(action:show,id:person.id)
            }
            else {
                render(view:'edit',model:[person:person])
            }
        }
        else {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def person = new Person()
        person.properties = params
        return ['person':person]
    }

    def save = {
        def person = new Person(params)
        if(!person.hasErrors() && person.save()) {
            flash.message = "Person ${person.id} created"
            redirect(action:show,id:person.id)
        }
        else {
            render(view:'create',model:[person:person])
        }
    }
}
