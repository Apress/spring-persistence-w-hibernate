<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: Nov 29, 2008
  Time: 7:45:30 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

<title><g:layoutTitle>Gallery</g:layoutTitle></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <g:javascript library="prototype"/>
    <g:javascript library="scriptaculous"/>
         <script type="text/javascript"
    src="http://lite.piclens.com/current/piclens.js"></script>
        <script type="text/javascript" src="js/prototype/prototype.js"></script>
<script type="text/javascript" src="js/prototype/scriptaculous.js?load=effects"></script>
<script type="text/javascript" src="${createLinkTo(dir: "js", file: "lightbox.js")}"></script>
<link rel="stylesheet" href="${createLinkTo(dir: "css", file: "lightbox.css")}" type="text/css" media="screen" />


<link href="${createLinkTo(dir:"css", file:"bifa.css")}" rel="stylesheet" type="text/css">
    <g:layoutHead/>
</head>

<body>
<div id="container">
  <div id="intheader"></div>
  <div id="intnav">
    <div class="intnav"><a href="${createLink(action: "viewCategoriesMenu", controller: "app")}"><img src="${createLinkTo(dir: "images", file: "int_galleries.gif")}" width="165" height="31"></a></div>
     <div class="intnav"><a href="${createLink(action: "viewExhibitionsMenu", controller: "app")}"><img src="${createLinkTo(dir: "images", file: "int_exhib.gif")}"></a></div>
    <div class="intnav"><a href="${createLink(action: "appBio", controller: "bio")}"><img src="${createLinkTo(dir: "images", file: "int_bio.gif")}"></a></div>
  </div>
  <div id="intnavline"></div>
   
    <g:layoutBody/>


    </div>
</body>
</html>