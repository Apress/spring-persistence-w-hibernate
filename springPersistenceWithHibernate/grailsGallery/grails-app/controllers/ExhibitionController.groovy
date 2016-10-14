class ExhibitionController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ exhibitionList: Exhibition.list( params ) ]
    }

    def show = {
        def exhibition = Exhibition.get( params.id )

        if(!exhibition) {
            flash.message = "Exhibition not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ exhibition : exhibition ] }
    }

    def delete = {
        def exhibition = Exhibition.get( params.id )
        if(exhibition) {
            exhibition.delete()
            flash.message = "Exhibition ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Exhibition not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def exhibition = Exhibition.get( params.id )

        if(!exhibition) {
            flash.message = "Exhibition not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ exhibition : exhibition ]
        }
    }

    def update = {
        def exhibition = Exhibition.get( params.id )
        if(exhibition) {
            exhibition.properties = params
            if(!exhibition.hasErrors() && exhibition.save()) {
                flash.message = "Exhibition ${params.id} updated"
                redirect(action:show,id:exhibition.id)
            }
            else {
                render(view:'edit',model:[exhibition:exhibition])
            }
        }
        else {
            flash.message = "Exhibition not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def exhibition = new Exhibition()
        exhibition.properties = params
        return ['exhibition':exhibition]
    }

    def save = {
        def exhibition = new Exhibition(params)
        if(!exhibition.hasErrors() && exhibition.save()) {
            flash.message = "Exhibition ${exhibition.id} created"
            redirect(action:show,id:exhibition.id)
        }
        else {
            render(view:'create',model:[exhibition:exhibition])
        }
    }
}
