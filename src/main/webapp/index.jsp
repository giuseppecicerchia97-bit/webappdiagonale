<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcolo Diagonale</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .container { background-color: white; padding: 40px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 100%; max-width: 400px; }
        h1 { text-align: center; color: #1c1e21; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: 600; color: #4b4f56; }
        input[type="number"] { width: 100%; padding: 12px; border: 1px solid #dddfe2; border-radius: 6px; box-sizing: border-box; font-size: 16px; }
        input[type="number"]:focus { border-color: #1877f2; outline: none; box-shadow: 0 0 0 2px rgba(24, 119, 242, 0.2); }
        button { width: 100%; padding: 12px; background-color: #1877f2; color: white; border: none; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: background-color 0.2s; }
        button:hover { background-color: #166fe5; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Calcolatore Diagonale</h1>
        <form action="calcolo" method="post">
            <div class="form-group">
                <label for="l1">Valore L1 (mm):</label>
                <input type="number" id="l1" name="l1" step="any" required>
            </div>
            <div class="form-group">
                <label for="l2">Valore L2 (mm):</label>
                <input type="number" id="l2" name="l2" step="any" required>
            </div>
            <div class="form-group">
                <label for="diametroIniziale">Diametro Iniziale (mm):</label>
                <input type="number" id="diametroIniziale" name="diametroIniziale" step="any" required>
            </div>
            <button type="submit">Calcola</button>
        </form>
    </div>
</body>
</html>
