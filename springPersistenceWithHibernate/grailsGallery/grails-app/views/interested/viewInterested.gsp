<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 29, 2008
  Time: 7:48:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Barbara's Art I am interested in</title>
          <meta name="layout" content="app" />

  </head>
  <body>

   <div id="intgallery">
    <div class="breadcrumb">Galleries</div>
    <div class="clear"> </div>
       <g:if test="${flash.message}">
           ${flash.message}
       </g:if>


         <g:form action="sendInterest" controller="interested">
             <table class="interestCommentBox">
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
                            <label for="emailAddress">Email:</label>
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
                        <tr><td><td align="right" style="padding-right: 60px;"><input type="submit" value="Submit"/></td></td></tr>

                   </table>

                </table>



         </g:form>


    <div class="interestedBox">
      <div class="centertext">Art I am interested in:</div>

        <table  height="100%">
        <g:each in="${selectedArt}" var="curEntity" status="status">
             <tr>

                 <td>


	  	        <div class="thumbnail"><img src="${createLink(action: "renderThumbnail", controller: "app", id: curEntity?.id)}"></div>




                      </td>
                     <td class="categorytext" style="text-align:left" align="left" width="450">
                         ${curEntity.title}

                     </td>
                 <td  align="right" width="50">

                     <a href="${createLink(action: "removeFromCart", controller: "interested", id: curEntity?.id)}">Remove</a>
                 </td>

            </tr>
       </g:each>
        </table>




	  <div class="clear"></div>
    </div>



  </div>
  <div class="clear"></div>


  </body>
</html>