import org.hibernate.Criteria

class AppController {

    def index = { }

    def viewCategoriesMenu = {
        List categories = Category.list(sort: "name", order: "asc")
        def filteredCategories = categories.findAll {
            return (it.artEntites != null && it.artEntites.size() > 0) 
        }
        def posStyle = ["categoryLeft", "categoryRight"]
        render(view: "categoriesMenu", model: [categories: filteredCategories, posStyle: posStyle])

    }

    def viewCategory = {
        Category category = Category.get(params.id)
       // List artEntities = ArtEntity.findAll("from ArtEntity artEntity left join artEntity.categories as category with category.id = :categoryId", ["categoryId": category.id])

        def criteria = ArtEntity.createCriteria()
        def artEntities = criteria {
            categories {
                eq("name", category.name)
            }
        }

        def selectedId = params.artEntityId;
        def selectedArt = null
        if (!selectedId) {
            selectedArt = artEntities[0]
            selectedId = selectedArt['id']
        } else {
            selectedArt = ArtEntity.get(Long.parseLong(selectedId))
            selectedId = selectedArt?.id
        }
        def previousIndex = 0;
        def nextIndex = 0;
        def index = 0
        artEntities.eachWithIndex { ArtEntity curEntity, def curIndex ->
            String curName = curEntity.name
            String selectedName = selectedArt.name
            if (curName == selectedName) {
                index = curIndex
                return;
            }
        }
        def selectedIndex = index

        boolean existsNext = false
        boolean existsPrevious = false
        if (selectedIndex < artEntities.size() - 1) {
            nextIndex = selectedIndex + 1;
            existsNext = true
        }
        if (selectedIndex > 0) {
            previousIndex = selectedIndex - 1
            existsPrevious = true
        }
        render(view: "category", model: [category: category, artEntities: artEntities,
                selectedArt: selectedArt, nextId: artEntities[nextIndex]?.id, previousId: artEntities[previousIndex]?.id,
                existsNext: existsNext, existsPrevious: existsPrevious    
        ])

    }


    def viewExhibitionsMenu = {
        List exhibitions = Exhibition.list(sort: "name", order: "asc")
        def filteredExhibitions = exhibitions.findAll {
            return (it.exhibitionArtwork != null && it.exhibitionArtwork.size() > 0) 
        }
        def posStyle = ["categoryLeft", "categoryRight"]
        render(view: "exhibitionsMenu", model: [exhibitions: filteredExhibitions, posStyle: posStyle])
    }


    def viewExhibition = {
       Exhibition exhibition = Exhibition.get(params.id)
       // List artEntities = ArtEntity.findAll("from ArtEntity artEntity left join artEntity.categories as category with category.id = :categoryId", ["categoryId": category.id])

        def artEntities = []
        artEntities.addAll(exhibition.exhibitionArtwork);

        def selectedId = params.artEntityId;
        def selectedArt = null
        if (!selectedId) {
            selectedArt = artEntities[0]
            selectedId = selectedArt['id']
        } else {
            selectedArt = ArtEntity.get(Long.parseLong(selectedId))
            selectedId = selectedArt?.id
        }
        def previousIndex = 0;
        def nextIndex = 0;
        def index = 0
        artEntities.eachWithIndex { ArtEntity curEntity, def curIndex ->
            String curName = curEntity.name
            String selectedName = selectedArt.name
            if (curName == selectedName) {
                index = curIndex
                return;
            }
        }
        def selectedIndex = index

        boolean existsNext = false
        boolean existsPrevious = false
        if (selectedIndex < artEntities.size() - 1) {
            nextIndex = selectedIndex + 1;
            existsNext = true
        }
        if (selectedIndex > 0) {
            previousIndex = selectedIndex - 1
            existsPrevious = true
        }
        render(view: "exhibition", model: [exhibition: exhibition, artEntities: artEntities,
                selectedArt: selectedArt, nextId: artEntities[nextIndex]?.id, previousId: artEntities[previousIndex]?.id,
                existsNext: existsNext, existsPrevious: existsPrevious
        ])
    }


    def viewRecent = {

        def criteria = ArtEntity.createCriteria()
        def artEntities = criteria {
            maxResults(36)
            order("displayDate", "desc")
            eq("isGeneralViewable", true)

        }
        
        def selectedId = params.artEntityId;
        def selectedArt = null
        if (!selectedId) {
            selectedArt = artEntities[0]
            selectedId = selectedArt['id']
        } else {
            selectedArt = ArtEntity.get(Long.parseLong(selectedId))
            selectedId = selectedArt?.id
        }
        def previousIndex = 0;
        def nextIndex = 0;
        def index = 0
        artEntities.eachWithIndex { ArtEntity curEntity, def curIndex ->
            String curName = curEntity.name
            String selectedName = selectedArt.name
            if (curName == selectedName) {
                index = curIndex
                return;
            }
        }
        def selectedIndex = index

        boolean existsNext = false
        boolean existsPrevious = false
        if (selectedIndex < artEntities.size() - 1) {
            nextIndex = selectedIndex + 1;
            existsNext = true
        }
        if (selectedIndex > 0) {
            previousIndex = selectedIndex - 1
            existsPrevious = true
        }
        render(view: "recent", model: [ artEntities: artEntities,
                selectedArt: selectedArt, nextId: artEntities[nextIndex]?.id, previousId: artEntities[previousIndex]?.id,
                existsNext: existsNext, existsPrevious: existsPrevious
        ])
        
    }

    def renderImage = {
        def id = params.id;
        ArtEntity artEntity = ArtEntity.get(id)
        ArtData artData = artEntity.artData.find{
            if (it instanceof ArtData_Gallery) {
                return it
            }
        }
        response.contentType = artData.contentType
        response.outputStream << artData.picture
        response.outputStream.flush()

    }


      def renderArchive = {
        def id = params.id;
        ArtEntity artEntity = ArtEntity.get(id)
        ArtData artData = artEntity.artData.find{
            if (it instanceof ArtData_Storage) {
                return it
            }
        }
        response.contentType = artData.contentType
        response.outputStream << artData.picture
        response.outputStream.flush()

    }

    def renderThumbnail = {
        def id = params.id;
        ArtEntity artEntity = ArtEntity.get(id)
        ArtData artData = artEntity.artData.find{
            if (it instanceof ArtData_Thumbnail) {
                return it
            }
        }
        response.contentType = artData.contentType
        response.outputStream << artData.picture
        response.outputStream.flush()
    }


}
