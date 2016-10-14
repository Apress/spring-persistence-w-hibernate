<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 29, 2008
  Time: 7:48:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Gallery Categories Menu</title>
          <meta name="layout" content="app" />

  </head>
  <body>

   <div id="intgallery">
    <div class="breadcrumb">Galleries</div>
    <div class="clear"> </div>
    <div class="categorybox">
      <div class="centertext">Select a gallery below:</div>

        <g:each in="${categories}" var="curCat" status="status">

                <a href="${createLink(action: 'viewCategory', controller: 'app', id: curCat.id)}">
                 <div class='${posStyle[status % 2]}'>
	  	        <div class="categoryimage"><img src="${createLinkTo(dir: "images", file: "categoryimage1.gif")}"></div>
		        <div class="categorytext">
                   ${curCat.name}
                </div>
	        </div>
            </a>
       </g:each>


	  <div class="categorycenter">
	  	<div class="categoryimagecenter"><img src="${createLinkTo(dir: "images", file: "categoryimage3.gif")}"></div>
	  	<div class="categorytext"><a href="${createLink(action: 'viewRecent', controller: 'app')}">Recent Works</a></div>
	  </div>

	  <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>


  </body>
</html>