<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 28, 2008
  Time: 1:21:33 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="admin" />

    <title>Upload Image</title></head>
  <body>

<g:form action="doUpload" controller="artEntity" method="post" enctype="multipart/form-data">

      <div class="centertext">
        <h1>Upload Artwork </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${artEntity}">
            <div class="errors">
                <g:renderErrors bean="${artEntity}" as="list" />
            </div>
            </g:hasErrors>
      </div>
      <div class="formline" style="margin-top: 40px">

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
                                    <label for="name">Upload File:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'storagePicture','errors')}">
                                    <input type="file" maxlength="50" id="storagePicture" name="storagePicture" value="${fieldValue(bean:artEntity,field:'storagePicture')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'title','errors')}">
                                    <textarea rows="1" cols="40" name="title">${fieldValue(bean:artEntity, field:'title')}</textarea>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subTitle">Sub Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artEntity,field:'subTitle','errors')}">
                                    <textarea rows="1" cols="40" name="subTitle">${fieldValue(bean:artEntity, field:'subTitle')}</textarea>
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
                                    <textarea rows="1" cols="40" name="media">${fieldValue(bean:artEntity, field:'media')}</textarea>
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
                                    <label for="categories">Categories:</label>
                                </td>
                                <td valign="top" class="value">
                                    <ul>
                                    <g:each in="${categories}" var="curCategory" status="catStatus">

                                       <li>
                                        <g:checkBox name="categoryMap['${curCategory.name}']" value="${curCategory.id}" checked="${artEntity?.categories?.contains(curCategory)}"></g:checkBox> <label for="categories[${catStatus}]">${curCategory}</label>
                                        </li>
                                    </g:each>
                                    </ul>
                                </td>
                            </tr>


                          <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibitions">Exhibitions:</label>
                                </td>
                                <td valign="top" class="value">
                                    <ul>
                                    <g:each in="${exhibitions}" var="curExhibit" status="exhibitStatus">

                                       <li>
                                        <g:checkBox name="exhibitionMap['${curExhibit.name}']" value="${curExhibit.id}" checked="${exhibitions?.contains(curExhibit)}"></g:checkBox> <label for="exhibitionMap['${curExhibit.name}']">${curExhibit}</label>
                                        </li>
                                    </g:each>
                                    </ul>
                                </td>
                            </tr>

                        <tr class="prop">
                           <td valign="top" class="name">
                               <label for="tags">Tags:</label>
                           </td>
                           <td valign="top" class="value">
                               < <input type="text" id="tags" name="tagString" value="${fieldValue(bean:artEntity,field:'tagString')}" />
                           </td>
                       </tr>

                     



                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>




  </div>

            </g:form>

  

  </body>
</html>