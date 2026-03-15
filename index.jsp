<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Corporate Intranet</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #e9ecef; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .hero-card { background: white; padding: 50px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); text-align: center; max-width: 500px; }
        h1 { color: #343a40; margin-bottom: 10px; }
        p { color: #6c757d; margin-bottom: 30px; line-height: 1.6; }
        .action-btn { background: #007bff; color: white; text-decoration: none; padding: 12px 30px; border-radius: 6px; font-weight: bold; transition: background 0.3s; }
        .action-btn:hover { background: #0056b3; }
        .footer { margin-top: 40px; font-size: 0.8rem; color: #adb5bd; }
    </style>
</head>
<body>
    <div class="hero-card">
        <h1>Enterprise Portal</h1>
        <p>Welcome to the internal employee network. Please ensure your profile information and avatar are up to date according to the new corporate security policy.</p>
        <a href="upload.jsp" class="action-btn">Go to Profile Settings</a>
        
        <div class="footer">
            &copy; 2026 Enterprise Inc. Internal Use Only.
        </div>
    </div>
</body>
</html>