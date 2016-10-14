<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 29, 2008
  Time: 8:24:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Recent Artwork</title></head>
  <body>


  <div id="intgallery">
    <div class="breadcrumb"><a href="${createLink(action: "viewCategoriesMenu", controller: "app")}">Galleries:</a>Recent Artwork</div>
    <div class="clear">
      <div id="gallerytextarea">
        <table width="144" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"> <p> <span class="titleofpiece">${selectedArt?.title}</span> </p>
              <p class="smalltext"> ${selectedArt?.description}</p></td>
          </tr>
          <tr>
            <td align="center" valign="bottom"><a href="${createLink(action: "addInterest", controller: "interested", id: selectedArt.id)}"><img src="${createLinkTo(dir: "images", file: "interested.gif")}"/></a></td>
          </tr>
            <tr>
            <td align="center" valign="bottom" width="151" height="19">
                <a href="${createLink(action: "viewCategoriesMenu", controller: "app")}"><img src="${createLinkTo(dir: "images", file: "returngallery.gif")}" ></a>


            </td>
          </tr>

        </table>
      </div>
      <div id="galleryimagearea">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" valign="top">

                 <a href="${createLink(action: "renderImage", controller: "app", id: selectedArt?.id)}" rel="lightbox[recent]" title="${selectedArt?.title}">
                <img src="${createLink(action: "renderImage", controller: "app", id: selectedArt?.id)}">
                 </a>
                </td>
          </tr>
        </table>
        <div class="clear">
          <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
              <td align="center" valign="top">
                  <g:if test="${existsPrevious}">
                  <a href="${createLink(action: "viewRecent", controller: "app", params: [artEntityId: previousId])}">
                    <img src="${createLinkTo(dir: "images", file: "previous.gif")}">
                  </a>
                  </g:if>
                  </td>

              <td align="center" valign="middle"><span class="titleofpiece">
                  ${selectedArt?.title}
              </span></td>
              <td align="center" valign="top">
                 <g:if test="${existsNext}">
                  <a href="${createLink(action: "viewRecent", controller: "app", params: [artEntityId: nextId])}">
                    <img src="${createLinkTo(dir: "images", file: "next.gif")}">
                  </a>
                  </g:if>
                  </td>
            </tr>
          </table>

        </div>

      </div>

    </div>
    <div class="gallthumbs">
      <div class="thumbscontent">
        <!-- repeat this div for the thumbnails  -->
        <g:each in="${artEntities}" var="curEntity">
          <a href="${createLink(action: "viewRecent", controller: "app", params: [artEntityId: curEntity?.id])}">
            <div class="thumbnail"> <img src="${createLink(action: "renderThumbnail", controller: "app", id: curEntity?.id)}"></div>
            </a>

            <c:if test="${(curEntity.id != selectedArt?.id)}">
            <div style="display:none; visibility:hidden;">
            <a href="${createLink(action: "renderImage", controller: "app", id: curEntity?.id)}" rel="lightbox[recent]" title="${curEntity?.title}">
            </a>

            </div>
            </c:if>
        </g:each>
              <!-- End repeat this div for the thumbnails  -->
        <div class="clear"></div>
      </div>
    </div>
  </div>
  <div class="clear">



  </div>

</div>



  </body>
</html>