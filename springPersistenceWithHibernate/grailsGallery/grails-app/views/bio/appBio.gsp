<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Jan 25, 2009
  Time: 2:45:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
       <meta name="layout" content="app" />

      <title>Barbara Israel's Biography</title></head>
  <body>

   <div id="intgallery">
    <div class="breadcrumb">Bio</div>
    <div class="clear"> </div>
    <div class="biobox">
      <div class="biopicture">place image here</div>
      <p>

      ${bio}

      </p>
      <p><a name="contact"></a><span class="titleofpiece" style="align:left">Contact Barbara:</span><br>
        <br>

        <g:if test="${flash.message}">
            ${flash.message}
        </g:if>

         <g:form action="contact" controller="bio">
             <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="firstname">First Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean:person,field:'firstName','errors')}">
                            <input type="text" maxlength="50" id="firstname" name="firstname" value="${fieldValue(bean:person,field:'firstName')}"/>
                        </td>
                    </tr>



                     <tr class="prop">
                        <td valign="top" class="name">
                            <label for="lastname">Last Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean:person,field:'lastName','errors')}">
                            <input type="text" maxlength="50" id="lastname" name="lastname" value="${fieldValue(bean:person,field:'lastName')}"/>
                        </td>
                    </tr>

                     <tr class="prop">
                        <td valign="top" class="name">
                            <label for="emailAddress">Email Address:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean:person,field:'emailAddress','errors')}">
                            <input type="text" maxlength="50" id="emailAddress" name="emailAddress" value="${fieldValue(bean:person,field:'emailAddress')}"/>
                        </td>
                    </tr>


                       <tr class="prop">
                        <td valign="top" class="name">
                            <label for="telephone">Telephone:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean:person,field:'telephone','errors')}">
                            <input type="text" maxlength="50" id="telephone" name="telephone" value="${fieldValue(bean:person,field:'telephone')}"/>
                        </td>
                    </tr>


                     <tr class="prop">
                        <td valign="top" class="name">
                            <label for="telephone">Comment:</label>
                        </td>
                        <td valign="top" class="value">
                            <textarea id="comment" name="comment" cols="50" rows="10" value="${comment}">

                                </textarea>
                        </td>
                    </tr>
                        <tr><td><td align="right" style="padding-right: 60px;"><input type="submit" value="Submit"/></td></tr>

                   </table>


                   </table>

                </table>

         </g:form>


		<div class="clear"> &nbsp; </div>
             <a href="${createLink(action: "viewCategoriesMenu", controller: "app")}"><img src="../images/returngallery.gif" width="151" height="19"></a> 
    </div>
  </div>
  <div class="clear"></div>


  </body>
</html>