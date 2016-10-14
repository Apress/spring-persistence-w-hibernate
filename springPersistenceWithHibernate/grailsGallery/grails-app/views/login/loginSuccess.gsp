<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 27, 2008
  Time: 3:47:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="admin" />
    <title>Simple GSP page</title></head>
  <body>


      <div class="centertext">
        <p class="categorytext">Success!</p>
		<p>You have successfully logged in! Please select an option </p>
      </div>
      <br>
      <br>
      <div class="formline" style="margin-top: 40px">
        <div class="centertext">
            <ul>
       <li><a href="${createLink(action: "create", controller: "exhibition")}">Create a new Exhibition</a> </li>

       <li>  <a href="${createLink(action: "upload", controller: "artEntity")}">Upload an image</a>  </li>  

       <li>       <a href="${createLink(action: "create", controller: "category")}">Define a new Category</a>  </li>

      <li>   <a href="${createLink(action: 'doLogoff', controller: "login")}">Log Out</a>   </li>

                </ul>
        </div>
      </div>

	  <div class="clear"> &nbsp; </div>

  <div class="clear"></div>



  </body>
</html>