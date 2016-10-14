<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 29, 2008
  Time: 7:54:56 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Virtual Exhibitions</title></head>
  <body>

  <div id="intgallery">
    <div class="breadcrumb">Virtual Exhibitions</div>
    <div class="clear"> </div>
    <div class="categorybox">
      <div class="centertext">Select an exhibition below:</div>

        <g:each in="${exhibitions}" var="curCat" status="status">

                <a href="${createLink(action: 'viewExhibition', controller: 'app', id: curCat.id)}">
                 <div class='${posStyle[status % 2]}'>
	  	        <div class="categoryimage"><img src="${createLinkTo(dir: "images", file: "categoryimage1.gif")}"></div>
		        <div class="categorytext">
                   ${curCat.name}
                </div>
	        </div>
            </a>
       </g:each>




	  <div class="clear"></div>
         <a href="${createLink(action: "viewCategoriesMenu", controller: "app")}"><img src="../images/returngallery.gif" width="151" height="19"></a> 
    </div>
  </div>

  <div class="clear"></div>


  </body>
</html>