<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Risultato del Calcolo</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; background-color: #f4f7f9; color: #333; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; padding: 20px; box-sizing: border-box; }
        .container { background-color: #ffffff; padding: 30px 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); width: 100%; max-width: 600px; }
        h1 { color: #1a253c; text-align: center; margin-bottom: 25px; font-size: 2rem; }
        .result-section { background-color: #f0f2f5; border: 1px solid #e0e0e0; border-radius: 8px; padding: 20px; margin-bottom: 20px; text-align: center; }
        .result-section h2 { margin-top: 0; margin-bottom: 10px; color: #0056b3; font-size: 1.4rem; }
        .result-section .calculation { font-size: 0.9rem; color: #666; margin-bottom: 5px; font-family: 'Courier New', Courier, monospace; }
        .result-section .final-value { font-size: 2.2rem; font-weight: bold; color: #1a253c; }
        .weight-section { background-color: #fff3cd; border: 1px solid #ffeeba; }
        .weight-section h2 { color: #856404; }
        .weight-section .final-value { color: #856404; }
        table { width: 100%; border-collapse: collapse; margin-top: 25px; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f2f2f2; font-weight: 600; }
        td strong { color: #333; }
        .back-link { display: block; text-align: center; margin-top: 30px; text-decoration: none; color: #007bff; font-weight: 500; }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Risultati Calcolo</h1>

        <div class="result-section weight-section">
            <h2>Peso Staffa</h2>
            <div class="calculation">Perimetro: ((${l1_input} + ${l2_input}) * 2) = ${perimetroMm} mm</div>
            <div class="calculation">Calcolo: (${perimetroMm} / 1000) m * ${pesoLineare} kg/m</div>
            <div class="final-value">${pesoStaffa} Kg</div>
        </div>

        <div class="result-section">
            <h2>Diagonale Attrezzaggio</h2>
            <div class="final-value">${diagonalePrincipale} mm</div>
        </div>

        <div class="result-section">
            <h2>Metà Diagonale</h2>
            <div class="calculation">${diagonalePrincipale} / 2</div>
            <div class="final-value">${metaDiagonale} mm</div>
        </div>

        <h2>Dati di Riferimento</h2>
        <table>
            <tr>
                <td><strong>Staffa (L1 x L2)</strong></td>
                <td>${l1_input} x ${l2_input} mm</td>
            </tr>
            <tr>
                <td><strong>Diametro</strong></td>
                <td>${diametro_input} mm</td>
            </tr>
            <tr>
                <td><strong>Peso Specifico (da tabella)</strong></td>
                <td>${pesoLineare} kg/m</td>
            </tr>
            <tr>
                <td><strong>L1 Modificato</strong></td>
                <td>${l1Modificato} mm</td>
            </tr>
            <tr>
                <td><strong>L2 Modificato</strong></td>
                <td>${l2Modificato} mm</td>
            </tr>
        </table>

        <a href="index.jsp" class="back-link">Esegui un altro calcolo</a>
    </div>
</body>
</html>