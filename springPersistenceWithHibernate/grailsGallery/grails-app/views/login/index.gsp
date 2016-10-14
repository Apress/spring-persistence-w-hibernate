<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 27, 2008
  Time: 3:16:10 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
<meta name="layout" content="admin" />
    <title>Admin Log-in</title></head>
  <body>
    <br/><p/>
  


      <div class="centertext">
        <p>Welcome to the administration tool. <br>
          Log in below to begin. </p>
          <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${person}">
            <div class="errors">
                <g:renderErrors bean="${person}" as="list" />
            </div>
            </g:hasErrors>
      </div>
        <g:form action="doLogin" method="post">
      <div class="centertext" style="margin-top: 40px">
      <table>
          <tr><td>
      <label class="prop" for="username">Username:</label>
              </td>
      <td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
        <input type="text" maxlength="100" id="username" name="username" value="${fieldValue(bean:person,field:'username')}"/>

       </td>
      </tr>

        <tr><td>
        <label class="prop" for="password">Password:</label>
            </td>
         <td valign="top" class="value ${hasErrors(bean:person,field:'password','errors')}">
          <input type="password" maxlength="100" id="password" name="password" value="${fieldValue(bean:person,field:'password')}"/>
        </td></tr>
          </table>
	  <div class="formline" style="margin-top: 40px">
        <div class="centertext">
          <input name="submit" type="submit" id="submit" value="Submit">
        </div>
      </div>

      </div>
     </g:form>
      </div>

      </div>

  </div>

  <div class="clear"></div>
  <div class="clear"></div>

  </body>
</html>


