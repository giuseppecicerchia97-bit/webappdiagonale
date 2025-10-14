<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Risultati Calcolo</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; padding: 20px; box-sizing: border-box; }
        .container { background-color: white; padding: 30px 40px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 100%; max-width: 600px; }
        h1 { text-align: center; color: #1c1e21; margin-bottom: 25px; }
        .section { margin-bottom: 30px; }
        h2 { font-size: 1.2em; color: #1877f2; border-bottom: 2px solid #e7f3ff; padding-bottom: 8px; margin-bottom: 15px; }
        .result-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 15px; }
        .result-item { background-color: #f0f2f5; padding: 15px; border-radius: 8px; }
        .result-label { font-size: 0.9em; color: #606770; display: block; margin-bottom: 5px; }
        .result-value { font-size: 1.5em; font-weight: bold; color: #1c1e21; }
        .highlight .result-value { color: #1877f2; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { text-align: left; padding: 12px; border-bottom: 1px solid #dddfe2; }
        th { background-color: #f0f2f5; font-weight: 600; }
        .back-link { display: block; text-align: center; margin-top: 30px; text-decoration: none; color: #1877f2; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Risultati del Calcolo</h1>

        <div class="section">
            <h2>Risultati Principali</h2>
            <div class="result-grid">
                <div class="result-item highlight">
                    <span class="result-label">Diagonale Principale (mm)</span>
                    <span class="result-value">${diagonalePrincipale}</span>
                </div>
                <div class="result-item">
                    <span class="result-label">L1 Modificato (mm)</span>
                    <span class="result-value">${l1Modificato}</span>
                </div>
                <div class="result-item">
                    <span class="result-label">L2 Modificato (mm)</span>
                    <span class="result-value">${l2Modificato}</span>
                </div>
            </div>
        </div>
        
        <div class="section">
            <h2>Dati di Riferimento Macchina</h2>
             <table>
                <thead>
                    <tr>
                        <th>Descrizione</th>
                        <th>Valore</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Diametro Iniziale (Input)</td>
                        <td>${diametro_input} mm</td>
                    </tr>
                     <tr>
                        <td>Secondo Diametro (F5)</td>
                        <td>${diametroSecondo} mm</td>
                    </tr>
                    <tr>
                        <td>Diagonale Riferimento 1 (I8)</td>
                        <td>${diagRif1} mm</td>
                    </tr>
                    <tr>
                        <td>Diagonale Riferimento 2 (K8)</td>
                        <td>${diagRif2} mm</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <a href="index.jsp" class="back-link">Esegui un altro calcolo</a>
    </div>
</body>
</html>
