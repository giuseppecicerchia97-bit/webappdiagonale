package com.diagonale.webappdiagonale;

import java.io.IOException;
import java.text.DecimalFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CalcoloServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- 1. LETTURA DEGLI INPUT DAL FORM ---
        // I valori vengono letti come stringhe e convertiti in double.
        double l1 = Double.parseDouble(request.getParameter("l1"));
        double l2 = Double.parseDouble(request.getParameter("l2"));
        double diametroIniziale = Double.parseDouble(request.getParameter("diametroIniziale"));

        // --- 2. ESECUZIONE DEI CALCOLI (SECONDO L'ALGORITMO DEFINITO) ---
        
        // Cella F5 (Secondo Diametro)
        double diametroSecondo = diametroIniziale + 25;

        // Cella D8 (L1 Modificato)
        double l1Modificato = l1 - (2 * (25 + diametroIniziale));

        // Cella E8 (L2 Modificato)
        double l2Modificato = l2 - (2 * (25 + diametroIniziale));
        
        // Cella I8 (Diagonale Riferimento 1)
        double diagRif1 = Math.sqrt(Math.pow(diametroIniziale, 2) + Math.pow(diametroIniziale, 2));
        
        // Cella K8 (Diagonale Riferimento 2)
        double diagRif2 = Math.sqrt(Math.pow(diametroSecondo, 2) + Math.pow(diametroSecondo, 2));

        // Cella D5 (Diagonale Principale - RISULTATO FINALE)
        // Formula: (RADQ(D8^2 + E8^2)) - I8
        double diagonalePrincipale = Math.sqrt(Math.pow(l1Modificato, 2) + Math.pow(l2Modificato, 2)) - diagRif1;
        
        // --- 3. FORMATTAZIONE DEI RISULTATI PER LA VISUALIZZAZIONE ---
        // Usiamo DecimalFormat per avere lo stesso numero di decimali dell'Excel.
        DecimalFormat df2 = new DecimalFormat("#.##"); // 2 cifre decimali
        DecimalFormat df4 = new DecimalFormat("#.####"); // 4 cifre decimali

        // --- 4. SALVATAGGIO DEI RISULTATI NELLA RICHIESTA ---
        // I risultati vengono "allegati" alla richiesta per essere letti dalla pagina JSP.
        // Vengono salvati anche i valori di input per poterli mostrare nella pagina dei risultati.
        request.setAttribute("l1_input", l1);
        request.setAttribute("l2_input", l2);
        request.setAttribute("diametro_input", diametroIniziale);
        
        request.setAttribute("diagonalePrincipale", df2.format(diagonalePrincipale));
        request.setAttribute("l1Modificato", df2.format(l1Modificato));
        request.setAttribute("l2Modificato", df2.format(l2Modificato));
        request.setAttribute("diametroSecondo", diametroSecondo);
        request.setAttribute("diagRif1", df4.format(diagRif1));
        request.setAttribute("diagRif2", df4.format(diagRif2));

        // --- 5. INVIO ALLA PAGINA JSP PER LA VISUALIZZAZIONE ---
        // La richiesta (con i risultati) viene inoltrata a risultato.jsp.
        request.getRequestDispatcher("risultato.jsp").forward(request, response);
    }
}

