

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <g:if test="${flash.uploadSuccess}">
            <g:set var="titleMessage" value="Image successfully uploaded"/>
        </g:if>
        <g:else>
            <g:set var="titleMessage" value="Showing ArtEntity"/>
        </g:else>
        <title>${titleMessage}</title>
    </head>
    <body>
        
        <div class="clear">

            <h1>${titleMessage}</h1>

             <div class="centertext">
        <g:if test="${flash.uploadSuccess}">
           <p class="categorytext">Success!</p>
		<p>Your artwork has been successfully uploaded. </p>
        </g:if>

      </div>
      <br>
      <br>
      <div class="formline" style="margin-top: 40px">
        <div class="centertext">
          <a href="${createLink(action: "doLogoff", controller: "login")}">Log Off</a>

          <a href="${createLink(action: "upload", controller: "artEntity")}">Upload another image</a>
        </div>
      </div>

	  <div class="clear"> &nbsp; </div>
    </div>


            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">



                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sub Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'subTitle')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Uploaded Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'uploadedDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Display Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'displayDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Width:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'width')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Height:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'height')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Media:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'media')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Caption:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'caption')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Art Data:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="a" in="${artEntity.artData}">
                                    <li><g:link controller="artData" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Categories:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'categories')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Comments:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="c" in="${artEntity.comments}">
                                    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is General Viewable:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'isGeneralViewable')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Privilege Viewable:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'isPrivilegeViewable')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Storage Picture:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:artEntity, field:'storagePicture')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${artEntity?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
