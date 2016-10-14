import com.dialmercury.converter.ImageHandler
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class ArtEntityController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ artEntityList: ArtEntity.list( params ) ]
    }

    def show = {
        def artEntity = ArtEntity.get( params.id )

        if(!artEntity) {
            flash.message = "ArtEntity not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            artEntity.tagString = buildTagString(artEntity)
            return [ artEntity : artEntity ]
        }
    }

    def delete = {
        def artEntity = ArtEntity.get( params.id )
        if(artEntity) {
            artEntity.delete()
            flash.message = "ArtEntity ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ArtEntity not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def artEntity = ArtEntity.get( params.id )

        if(!artEntity) {
            flash.message = "ArtEntity not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            artEntity.tagString = buildTagString(artEntity)
            return [ artEntity : artEntity ]
        }
    }

    def update = {
        def artEntity = ArtEntity.get( params.id )
        if(artEntity) {
            artEntity.properties = params
            buildTagCollection(artEntity)
            if(!artEntity.hasErrors() && artEntity.save()) {
                flash.message = "ArtEntity ${params.id} updated"
                redirect(action:show,id:artEntity.id)
            }
            else {
                render(view:'edit',model:[artEntity:artEntity])
            }
        }
        else {
            flash.message = "ArtEntity not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def artEntity = new ArtEntity()
        artEntity.properties = params
        return ['artEntity':artEntity]
    }

    def save = {
        def artEntity = new ArtEntity(params)
        if(!artEntity.hasErrors() && artEntity.save()) {
            flash.message = "ArtEntity ${artEntity.id} created"
            redirect(action:show,id:artEntity.id)
        }
        else {
            render(view:'create',model:[artEntity:artEntity])
        }
    }

  def upload = {
      def artEntity = new ArtEntity()
      artEntity.tagString = ""
      def exhibitions = Exhibition.list(sort: "name", order: "asc")
      def categories = Category.list(sort: "name", order: "asc")
      artEntity.properties = params
      return ['artEntity':artEntity, "exhibitions": exhibitions, "categories": categories]
  }



    def doUpload = {
        def artEntity = new ArtEntity(params)
      if(request instanceof MultipartHttpServletRequest) {
        //this is an upload multipart request

        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("storagePicture");
          def origName = file.getOriginalFilename();

            ImageHandler imageHandler = new ImageHandler();

            String contentType = file.getContentType();

            ArtData_Storage artDataStorage = new ArtData_Storage(picture: file.getBytes(), contentType: contentType, origName: origName)
            byte[] galleryData = imageHandler.convertToGallery(file.getBytes())
            byte[] thumbnailData = imageHandler.convertToThumb(file.getBytes())


            ArtData_Gallery artDataGallery = new ArtData_Gallery(picture: galleryData, contentType: contentType, origName: origName);
            ArtData_Thumbnail artDataThumbnail = new ArtData_Thumbnail(picture: thumbnailData, contentType: contentType, origName: origName)


            artEntity.addToArtData(artDataStorage)
            artEntity.addToArtData(artDataGallery)
            artEntity.addToArtData(artDataThumbnail)

         }

        bindCategoriesToArtEntity(artEntity)
        bindExhibitionsToArtEntity(artEntity) 

        buildTagCollection(artEntity)



        if(!artEntity.hasErrors() && artEntity.save()) {
            flash.message = "ArtEntity ${artEntity.id} created"
            flash.uploadSuccess = true
            redirect(action:show,id:artEntity.id)
        }
        else {
            render(view:'upload',model:[artEntity:artEntity])
        }
    }

    public String buildTagString(ArtEntity artEntity) {
        def tagList = []
        artEntity.tags.each { curTag ->
            tagList << curTag.name

        }
        tagList.sort()
        return tagList.join(" ")
    }

    void buildTagCollection(ArtEntity artEntity) {
        def loadedTags = []
        def tags = artEntity.tagString.split("\\s|,\\s|,")
        tags.each { curTag ->
            Tag loadedTag = Tag.findByName(curTag)
            if (loadedTag) {
                artEntity.addToTags(loadedTag)
            } else {
                loadedTag = new Tag(name: curTag)
                artEntity.addToTags(loadedTag)
            }
        }
    }

    public static void bindCategoriesToArtEntity(ArtEntity artEntity) {

        artEntity?.categoryMap.each { key, value ->
            Category category = null
            if (value) {
                category = Category.get(value)
                if (category) {
                   artEntity.addToCategories(category)
                }
            }
        }

    }

      public static void bindExhibitionsToArtEntity(ArtEntity artEntity) {

        artEntity?.exhibitionMap.each { key, value ->
            Exhibition exhibition = null
            if (value) {
                exhibition = Exhibition.get(value)
                if (exhibition) {
                    exhibition.addToExhibitionArtwork(artEntity)
                }
            }
        }

    }

}
