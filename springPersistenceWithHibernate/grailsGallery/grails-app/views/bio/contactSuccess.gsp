<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 29, 2008
  Time: 8:27:02 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Thank you for your interest!</title>
   <meta name="layout" content="app" />

  </head>
  <body>


   <div id="intnavline"></div>
    <div id="intgallery">
      <div class="breadcrumb">Thank you</div>
      <div class="clear">
        <div class="interestedbox">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr><td><span class="titleofpiece">Title
                  of Piece</span></tr>
				  <tr>
              <td align="center" valign="top"><img src="images/artwork.jpg"></td>
            </tr>


			<tr>
			  <td align="center">
                <p>&nbsp;  </p>
                <p class="smalltext">
                           Thank you for your inquiry.
                  <br>
                    <a href="${createLink(action: "viewCategoriesMenu", controller: "app")}"><img src="${createLinkTo(dir: "images", file: "returngallery.gif")}" ></a>

                  </span> </p>
				</td>
			</tr>
			</table>
        </div>

      </div>

    </div>
  </div>
  <div class="clear"></div>
</div>


  </body>
</html>