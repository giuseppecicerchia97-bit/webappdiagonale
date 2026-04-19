<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Risultati - Faritalia</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background-color: #f4f7f9; display: flex; justify-content: center; padding: 20px; min-height: 100vh; align-items: center; margin: 0; }
        .container { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); width: 100%; max-width: 500px; }
        .logo { max-width: 180px; display: block; margin: 0 auto 20px; }
        h1 { text-align: center; color: #1a253c; font-size: 1.8rem; margin-bottom: 25px; }
        .box { background: #f8f9fa; border: 1px solid #ddd; padding: 15px; border-radius: 8px; margin-bottom: 15px; text-align: center; }
        .box h2 { margin: 0 0 10px; font-size: 1.1rem; color: #0056b3; }
        .val { font-size: 1.8rem; font-weight: bold; color: #1a253c; }
        .weight { background: #fff3cd; border-color: #ffeeba; }
        .weight h2, .weight .val { color: #856404; }
        .attr { background: #e2f3f5; border-color: #bee5eb; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; font-size: 0.9rem; }
        td { padding: 8px; border-bottom: 1px solid #eee; }
        .back-link { display: block; text-align: center; margin-top: 20px; text-decoration: none; color: #007bff; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <img src="img/faritalia.png" alt="Logo" class="logo">
        <h1>Risultati Calcolo</h1>
        
        <div class="box">
            <h2>Diagonale Attrezzaggio</h2>
            <div class="val">${diag} mm</div>
        </div>

        <div class="box">
            <h2>Metà Diagonale</h2>
            <div class="val">${meta} mm</div>
        </div>

        <div class="box attr">
            <h2>Misure per Attrezzaggio</h2>
            <div style="font-size: 1.4rem; font-weight: bold;">L1: ${l1Attr} mm</div>
            <div style="font-size: 1.4rem; font-weight: bold;">L2: ${l2Attr} mm</div>
            <small style="color: #666;">(Formula: L - 2*Øattr - 10)</small>
        </div>

        <div class="box weight">
            <h2>Peso Staffa</h2>
            <div class="val">${peso} Kg</div>
            <small>Basato su Ø commerciale ${dPeso} mm (${pesoLin} kg/m)</small>
        </div>

        <table>
            <tr><td><strong>L1 / L2 Originali</strong></td><td>${l1_in} x ${l2_in} mm</td></tr>
            <tr><td><strong>Ø Attrezzaggio usato</strong></td><td>${dAttr} mm</td></tr>
        </table>
        
        <a href="index.jsp" class="back-link">Esegui un altro calcolo</a>
    </div>
</body>
</html>