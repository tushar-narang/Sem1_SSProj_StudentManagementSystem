<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- Bootstrap CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>


<table>
<tr>
<td style="display: block">

<table style="margin-top: 30px;margin-left: 30px">
    <tr class="nick" >
        <td>Nickname:</td>
        <td><input id="nick"  style="margin-bottom: 10px"/></td>
    </tr>
    <tr>
        <td>Message:</td>
        <td><textarea id="message" disabled="disabled" style="width: 250px; margin-bottom: 10px"></textarea></td>
    </tr>
</table>

<button type="button" id="sendButton" class="btn btn-primary" style="margin-left: 100px">Start</button>
<br><br>
Status: <span></span>
</td>
<td>

<ul style="margin-left: 30px"></ul>

</td>
</tr>
</table>


<script src="jquery-1.9.1.js" type="text/javascript"></script>
<script type="text/javascript" src="chat.js"></script>
</body>
</html>