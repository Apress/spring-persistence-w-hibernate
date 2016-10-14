class TagController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ tagList: Tag.list( params ) ]
    }

    def show = {
        def tag = Tag.get( params.id )

        if(!tag) {
            flash.message = "Tag not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tag : tag ] }
    }

    def delete = {
        def tag = Tag.get( params.id )
        if(tag) {
            tag.delete()
            flash.message = "Tag ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Tag not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tag = Tag.get( params.id )

        if(!tag) {
            flash.message = "Tag not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tag : tag ]
        }
    }

    def update = {
        def tag = Tag.get( params.id )
        if(tag) {
            tag.properties = params
            if(!tag.hasErrors() && tag.save()) {
                flash.message = "Tag ${params.id} updated"
                redirect(action:show,id:tag.id)
            }
            else {
                render(view:'edit',model:[tag:tag])
            }
        }
        else {
            flash.message = "Tag not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def tag = new Tag()
        tag.properties = params
        return ['tag':tag]
    }

    def save = {
        def tag = new Tag(params)
        if(!tag.hasErrors() && tag.save()) {
            flash.message = "Tag ${tag.id} created"
            redirect(action:show,id:tag.id)
        }
        else {
            render(view:'create',model:[tag:tag])
        }
    }
}
