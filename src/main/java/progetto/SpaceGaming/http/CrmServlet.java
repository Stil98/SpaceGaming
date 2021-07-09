package progetto.SpaceGaming.http;

import progetto.SpaceGaming.console.Console;
import progetto.SpaceGaming.console.ConsoleDAO;
import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.product.ProductDAO;
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
        UtenteDAO usrDao=new UtenteDAO();
        ProductDAO prodDao=new ProductDAO();
        ConsoleDAO cnslDao=new ConsoleDAO();
        switch (path){
            case "/":
                break;
            case "/dashboard":
                int nUtenti = usrDao.userCount();
                request.setAttribute("nUtenti", nUtenti);
                request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                break;
            case "/gClienti":
                ArrayList<Utente> customers= usrDao.doRetrieveAll();
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("/WEB-INF/views/crm/gClienti.jsp").forward(request, response);
                break;
            case "/modClienti":
                Utente usr=usrDao.doRetrieveByEmail(request.getParameter("id"));
                request.setAttribute("customer", usr);
                request.getRequestDispatcher("/WEB-INF/views/crm/modClienti.jsp").forward(request, response);
                break;
            case "/gProdotti":
                ArrayList<Product> products= prodDao.doRetrieveAll();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/WEB-INF/views/crm/gProdotti.jsp").forward(request, response);
                break;
            case "/modProdotti":
                request.getRequestDispatcher("/WEB-INF/views/crm/modProdotti.jsp").forward(request, response);
                break;
            case "/newProdotto":
                request.getRequestDispatcher("/WEB-INF/views/crm/newProdotto.jsp").forward(request, response);
                break;
            case "/gOrdini":
                request.getRequestDispatcher("/WEB-INF/views/crm/gOrdini.jsp").forward(request, response);
                break;
            case "/gCategorie":
                ArrayList<Console> consoles= cnslDao.doRetrieveAll();
                request.setAttribute("consoles", consoles);
                request.getRequestDispatcher("/WEB-INF/views/crm/gCategorie.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo() : "/";
        UtenteDAO usrDao=new UtenteDAO();
        ProductDAO prodDao=new ProductDAO();
        ConsoleDAO cnslDao=new ConsoleDAO();
        switch (path){
            case "/":
                break;
            case "/clienteModificato":
                Utente usr= usrDao.doRetrieveByEmail(request.getParameter("email"));
                usr.setFname(request.getParameter("nome"));
                usr.setLname(request.getParameter("cognome"));
                usr.setPhoneNumber(request.getParameter("telefono"));
                usr.setAddress(request.getParameter("indirizzo"));
                usrDao.doChanges(usr);
                ArrayList<Utente> customers= usrDao.doRetrieveAll();
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("/WEB-INF/views/crm/gClienti.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }
}
