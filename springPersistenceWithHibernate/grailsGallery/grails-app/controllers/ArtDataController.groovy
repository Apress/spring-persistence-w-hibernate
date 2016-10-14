class ArtDataController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ artDataList: ArtData.list( params ) ]
    }

    def show = {
        def artData = ArtData.get( params.id )

        if(!artData) {
            flash.message = "ArtData not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ artData : artData ] }
    }

    def delete = {
        def artData = ArtData.get( params.id )
        if(artData) {
            artData.delete()
            flash.message = "ArtData ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ArtData not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def artData = ArtData.get( params.id )

        if(!artData) {
            flash.message = "ArtData not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ artData : artData ]
        }
    }

    def update = {
        def artData = ArtData.get( params.id )
        if(artData) {
            artData.properties = params
            if(!artData.hasErrors() && artData.save()) {
                flash.message = "ArtData ${params.id} updated"
                redirect(action:show,id:artData.id)
            }
            else {
                render(view:'edit',model:[artData:artData])
            }
        }
        else {
            flash.message = "ArtData not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def artData = new ArtData()
        artData.properties = params
        return ['artData':artData]
    }

    def save = {
        def artData = new ArtData(params)
        if(!artData.hasErrors() && artData.save()) {
            flash.message = "ArtData ${artData.id} created"
            redirect(action:show,id:artData.id)
        }
        else {
            render(view:'create',model:[artData:artData])
        }
    }
}
