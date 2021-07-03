package progetto.SpaceGaming.http;

import progetto.SpaceGaming.utente.Utente;
import progetto.SpaceGaming.utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CrmServlet", value = "/crm/*")
public class CrmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo() : "/";
        switch (path){
            case "/":
                break;
            case "/dashboard":
                // UtenteDAO dao=new UtenteDAO();
                // int uTotali= dao.userCount();
                request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                break;
            case "/gClienti":
                ArrayList<Utente> list= new ArrayList<>();
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));
                list.add(new Utente("Gennaro", "Rascato", "Via abito a torre", "gennarorascato@gmail.com", "gens", "kjkjkjkj", "347322434", false, null));

                request.setAttribute("customers", list);
                request.getRequestDispatcher("/WEB-INF/views/crm/gClienti.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }


}
