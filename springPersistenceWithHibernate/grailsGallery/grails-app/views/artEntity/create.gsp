

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title>Create ArtEntity</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ArtEntity List</g:link></span>
        </div>
      <div class="formline" style="margin-top: 40px">

                <div class="dialog">
        <div class="clear">
            <h1>Create ArtEntity</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${artEntity}">
            <div class="errors">
                <g:renderErrors bean="${artEntity}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:artEntity,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'title','errors')}">
                                    <textarea rows="5" cols="40" name="title">${fieldValue(bean:artEntity, field:'title')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subTitle">Sub Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'subTitle','errors')}">
                                    <textarea rows="5" cols="40" name="subTitle">${fieldValue(bean:artEntity, field:'subTitle')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uploadedDate">Uploaded Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'uploadedDate','errors')}">
                                    <g:datePicker name="uploadedDate" value="${artEntity?.uploadedDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="displayDate">Display Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'displayDate','errors')}">
                                    <g:datePicker name="displayDate" value="${artEntity?.displayDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="width">Width:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'width','errors')}">
                                    <input type="text" id="width" name="width" value="${fieldValue(bean:artEntity,field:'width')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="height">Height:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'height','errors')}">
                                    <input type="text" id="height" name="height" value="${fieldValue(bean:artEntity,field:'height')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="media">Media:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'media','errors')}">
                                    <textarea rows="5" cols="40" name="media">${fieldValue(bean:artEntity, field:'media')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:artEntity, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caption">Caption:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'caption','errors')}">
                                    <textarea rows="5" cols="40" name="caption">${fieldValue(bean:artEntity, field:'caption')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isGeneralViewable">Is General Viewable:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'isGeneralViewable','errors')}">
                                    <g:checkBox name="isGeneralViewable" value="${artEntity?.isGeneralViewable}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isPrivilegeViewable">Is Privilege Viewable:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'isPrivilegeViewable','errors')}">
                                    <g:checkBox name="isPrivilegeViewable" value="${artEntity?.isPrivilegeViewable}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="storagePicture">Storage Picture:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'storagePicture','errors')}">
                                    <input type="file" id="storagePicture" name="storagePicture" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
