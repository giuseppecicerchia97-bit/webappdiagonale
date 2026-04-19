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
        
        // 1. LETTURA INPUT
        double l1 = Double.parseDouble(request.getParameter("l1"));
        double l2 = Double.parseDouble(request.getParameter("l2"));
        double dPeso = Double.parseDouble(request.getParameter("diametroPeso"));
        double dAttr = Double.parseDouble(request.getParameter("diametroAttrezzaggio"));

        // 2. CALCOLI GEOMETRICI (Usa Diametro Attrezzaggio)
        double raggio = 25.0; 
        double l1Mod = l1 - (2 * (raggio + dAttr));
        double l2Mod = l2 - (2 * (raggio + dAttr));
        double risultante = Math.sqrt(Math.pow(l1Mod, 2) + Math.pow(l2Mod, 2));
        double diagPrinc = risultante - (2 * raggio);
        double metaDiag = diagPrinc / 2.0;

        // 3. CALCOLI ATTREZZAGGIO (Formula: L - 2d - 10)
        double l1Attr = l1 - (2 * dAttr) - 10.0;
        double l2Attr = l2 - (2 * dAttr) - 10.0;

        // 4. CALCOLO PESO (Usa Diametro Peso)
        double pesoLin = getPesoPerDiametro(dPeso);
        double perimetroM = ((l1 + l2) * 2) / 1000.0;
        double pesoTot = perimetroM * pesoLin;

        // 5. INVIO DATI ALLA JSP
        DecimalFormat df2 = new DecimalFormat("#.##");
        request.setAttribute("l1_in", l1);
        request.setAttribute("l2_in", l2);
        request.setAttribute("dPeso", dPeso);
        request.setAttribute("dAttr", dAttr);
        
        request.setAttribute("diag", df2.format(diagPrinc));
        request.setAttribute("meta", df2.format(metaDiag));
        request.setAttribute("l1Attr", df2.format(l1Attr));
        request.setAttribute("l2Attr", df2.format(l2Attr));
        request.setAttribute("peso", df2.format(pesoTot));
        request.setAttribute("pesoLin", df2.format(pesoLin));

        request.getRequestDispatcher("risultato.jsp").forward(request, response);
    }

    private double getPesoPerDiametro(double d) {
        int val = (int)Math.round(d);
        switch(val) {
            case 10: return 0.16; case 11: return 0.19; case 12: return 0.23; 
            case 13: return 0.27; case 14: return 0.31; case 15: return 0.35; 
            case 16: return 0.40; case 17: return 0.45; case 18: return 0.51; 
            case 19: return 0.57; case 20: return 0.63; case 21: return 0.69; 
            case 22: return 0.76; case 23: return 0.83; case 24: return 0.90; 
            case 25: return 0.98; case 26: return 1.06; case 27: return 1.14; 
            case 28: return 1.23; case 29: return 1.32; case 30: return 1.41; 
            case 31: return 1.51; case 32: return 1.61; case 33: return 1.71; 
            case 34: return 1.81; case 35: return 1.92; case 36: return 2.03; 
            case 37: return 2.15; case 38: return 2.27; case 39: return 2.39; 
            case 40: return 2.51; case 45: return 3.18; case 46: return 3.32; 
            case 50: return 3.93;
            default: return 0.0; 
        }
    }
}