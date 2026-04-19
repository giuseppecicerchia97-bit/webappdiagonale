<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configuratore Staffa - Faritalia</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; padding: 20px; }
        .container { background-color: white; padding: 40px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 100%; max-width: 400px; }
        .logo { max-width: 200px; height: auto; display: block; margin: 0 auto 20px auto; }
        h1 { text-align: center; color: #1c1e21; margin-bottom: 30px; font-size: 1.5rem; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: 600; color: #4b4f56; }
        input[type="number"] { width: 100%; padding: 12px; border: 1px solid #dddfe2; border-radius: 6px; box-sizing: border-box; font-size: 16px; }
        button { width: 100%; padding: 12px; background-color: #1877f2; color: white; border: none; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: background-color 0.2s; }
        button:hover { background-color: #166fe5; }
    </style>
</head>
<body>
    <div class="container">
        <img src="img/faritalia.png" alt="Logo Faritalia" class="logo">
        <h1>Configuratore Staffa</h1>
        <form action="calcolo" method="post">
            <div class="form-group">
                <label for="l1">Lunghezza L1 (mm):</label>
                <input type="number" id="l1" name="l1" step="any" required>
            </div>
            <div class="form-group">
                <label for="l2">Lunghezza L2 (mm):</label>
                <input type="number" id="l2" name="l2" step="any" required>
            </div>
            <div class="form-group">
                <label for="diametroPeso">Diametro per PESO (mm):</label>
                <input type="number" id="diametroPeso" name="diametroPeso" step="any" required>
            </div>
            <div class="form-group">
                <label for="diametroAttrezzaggio">Diametro ATTREZZAGGIO (mm):</label>
                <input type="number" id="diametroAttrezzaggio" name="diametroAttrezzaggio" step="any" required>
            </div>
            <button type="submit">Calcola Risultati</button>
        </form>
    </div>
</body>
</html>