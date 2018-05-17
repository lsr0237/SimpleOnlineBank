<%
session.setAttribute("userid", null);
session.setAttribute("userrole", null);
session.invalidate();
response.sendRedirect("home");
%>