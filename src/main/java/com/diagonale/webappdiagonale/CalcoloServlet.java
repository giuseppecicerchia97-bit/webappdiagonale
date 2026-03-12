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
        double l1 = Double.parseDouble(request.getParameter("l1"));
        double l2 = Double.parseDouble(request.getParameter("l2"));
        double diametroIniziale = Double.parseDouble(request.getParameter("diametroIniziale"));

        // --- 2. ESECUZIONE DEI CALCOLI (AGGIORNATI SECONDO L'EXCEL) ---
        // Il valore "R" è fisso a 25 nel file Excel.
        double raggio = 25.0;

        // L1 Modificato (L1 equivalente)
        double l1Modificato = l1 - (2 * (raggio + diametroIniziale));

        // L2 Modificato (L2 equivalente)
        double l2Modificato = l2 - (2 * (raggio + diametroIniziale));
        
        // Risultante (Teorema di Pitagora applicato a L1 eq. e L2 eq.)
        double risultante = Math.sqrt(Math.pow(l1Modificato, 2) + Math.pow(l2Modificato, 2));

        // Diagonale Principale (Risultante - 2*R)
        double diagonalePrincipale = risultante - (2 * raggio);
        
        // Metà Diagonale
        double metaDiagonale = diagonalePrincipale / 2.0;

        // --- 3. FORMATTAZIONE DEI RISULTATI ---
        DecimalFormat df2 = new DecimalFormat("#.##"); 
        DecimalFormat df4 = new DecimalFormat("#.####"); 

        // --- 4. SALVATAGGIO DEI RISULTATI NELLA RICHIESTA ---
        request.setAttribute("l1_input", l1);
        request.setAttribute("l2_input", l2);
        request.setAttribute("diametro_input", diametroIniziale);
        request.setAttribute("raggio_input", raggio);
        
        request.setAttribute("l1Modificato", df2.format(l1Modificato));
        request.setAttribute("l2Modificato", df2.format(l2Modificato));
        request.setAttribute("risultante", df4.format(risultante));
        request.setAttribute("diagonalePrincipale", df4.format(diagonalePrincipale));
        request.setAttribute("metaDiagonale", df4.format(metaDiagonale));

        // --- 5. INVIO ALLA PAGINA JSP PER LA VISUALIZZAZIONE ---
        request.getRequestDispatcher("risultato.jsp").forward(request, response);
    }
}