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

        // --- 2. ESECUZIONE DEI CALCOLI GEOMETRICI (DIAGONALE) ---
        double raggio = 25.0; // Fisso da Excel
        double l1Modificato = l1 - (2 * (raggio + diametroIniziale));
        double l2Modificato = l2 - (2 * (raggio + diametroIniziale));
        double risultante = Math.sqrt(Math.pow(l1Modificato, 2) + Math.pow(l2Modificato, 2));
        double diagonalePrincipale = risultante - (2 * raggio);
        double metaDiagonale = diagonalePrincipale / 2.0;

        // --- 3. NUOVI CALCOLI: L1 e L2 PER ATTREZZAGGIO ---
        double fissoAttrezzaggio = 10.0;
        double l1PerAttrezzaggio = l1 - (2 * diametroIniziale) - fissoAttrezzaggio;
        double l2PerAttrezzaggio = l2 - (2 * diametroIniziale) - fissoAttrezzaggio;

        // --- 4. RICERCA PESO E CALCOLO PESO STAFFA ---
        double pesoLineare = getPesoPerDiametro(diametroIniziale);
        double perimetroMm = (l1 + l2) * 2;
        double pesoStaffa = (perimetroMm / 1000.0) * pesoLineare;

        // --- 5. FORMATTAZIONE DEI RISULTATI ---
        DecimalFormat df2 = new DecimalFormat("#.##"); 
        DecimalFormat df4 = new DecimalFormat("#.####"); 

        // --- 6. SALVATAGGIO DEI RISULTATI NELLA RICHIESTA ---
        request.setAttribute("l1_input", l1);
        request.setAttribute("l2_input", l2);
        request.setAttribute("diametro_input", diametroIniziale);
        request.setAttribute("raggio_input", raggio);
        
        request.setAttribute("l1Modificato", df2.format(l1Modificato));
        request.setAttribute("l2Modificato", df2.format(l2Modificato));
        request.setAttribute("risultante", df4.format(risultante));
        request.setAttribute("diagonalePrincipale", df4.format(diagonalePrincipale));
        request.setAttribute("metaDiagonale", df4.format(metaDiagonale));
        
        // Attributi per L1 e L2 Attrezzaggio
        request.setAttribute("l1PerAttrezzaggio", df2.format(l1PerAttrezzaggio));
        request.setAttribute("l2PerAttrezzaggio", df2.format(l2PerAttrezzaggio));
        
        // Attributi per il peso della staffa
        request.setAttribute("pesoLineare", df2.format(pesoLineare));
        request.setAttribute("perimetroMm", df2.format(perimetroMm));
        request.setAttribute("pesoStaffa", df2.format(pesoStaffa));

        // --- 7. INVIO ALLA PAGINA JSP ---
        request.getRequestDispatcher("risultato.jsp").forward(request, response);
    }

    // --- METODO DI SUPPORTO: TABELLA DEI PESI ---
    private double getPesoPerDiametro(double diametro) {
        int d = (int) Math.round(diametro); 
        switch (d) {
            case 10: return 0.16;
            case 11: return 0.19;
            case 12: return 0.23;
            case 13: return 0.27;
            case 14: return 0.31;
            case 15: return 0.35;
            case 16: return 0.40;
            case 17: return 0.45;
            case 18: return 0.51;
            case 19: return 0.57;
            case 20: return 0.63;
            case 21: return 0.69;
            case 22: return 0.76;
            case 23: return 0.83;
            case 24: return 0.90;
            case 25: return 0.98;
            case 26: return 1.06;
            case 27: return 1.14;
            case 28: return 1.23;
            case 29: return 1.32;
            case 30: return 1.41;
            case 31: return 1.51;
            case 32: return 1.61;
            case 33: return 1.71;
            case 34: return 1.81;
            case 35: return 1.92;
            case 36: return 2.03;
            case 37: return 2.15;
            case 38: return 2.27;
            case 39: return 2.39;
            case 40: return 2.51;
            case 45: return 3.18;
            case 46: return 3.32;
            case 50: return 3.93;
            default: return 0.0;
        }
    }
}