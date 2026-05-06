<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL CORE TAGS</title>
</head>
<body>

<c:set var="name" value="vaibhavi"></c:set>
<c:out value="${name }"></c:out>

<br>

<c:import url="ErrorPage.jsp"></c:import>

<br>

<c:set var="test" value="0"></c:set>
<c:if test="${test == 0 }">
<c:out value="${'Its a Zero' }"></c:out>
</c:if>

<c:remove var="test"/>

<br>

<c:forEach begin="5" end="15" var="i">
<c:out value="${i }"></c:out>
</c:forEach>

<br>

<c:set var="price" value="2000"></c:set>
<c:choose>
<c:when test="${price > 1000 }">
Expensive
</c:when>
<c:otherwise>
Affordable
</c:otherwise>
</c:choose>

<br>

<c:url var="myUrl" value="price">
<c:param name="id" value="101"></c:param>
</c:url>

<a href="${myUrl}">View url</a>

</body>
</html>