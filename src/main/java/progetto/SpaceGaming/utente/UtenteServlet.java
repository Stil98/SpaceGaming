package progetto.SpaceGaming.utente;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UtenteServlet", value = "/utente/*")
public class UtenteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String path= getPath(request);
        switch (path){
            case "/":
                break;
            case "/secret":  //login admin
                request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request, response);
                break;
            case "/signup":
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            case "/header":
                request.getRequestDispatcher("/WEB-INF/views/partials/header.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String path= getPath(request);
        UtenteDAO utenteDao = new UtenteDAO();
        switch (path){
            case "/":
                break;
            case "/signup":
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            case "/secret":
                String email=request.getParameter("email");
                String pword=request.getParameter("password");
                UtenteDAO dao= new UtenteDAO();
                if(dao.doRetrieveUserByEmailPassword(email, pword).isAdmin())
                    request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                else
                    request.getRequestDispatcher("/WEB-INF/index.jsp");
                break;
            case "/create": // CREAZIONE PROFILO CLIENTE
                String fname = request.getParameter("nome");
                String lname = request.getParameter("cognome");
                String address = request.getParameter("indirizzo");
                String username = request.getParameter("username");
                String emailutente = request.getParameter("email");
                String password = request.getParameter("password");
                String phoneNumber = request.getParameter("telefono");
                Utente newUtente = new Utente(fname,lname,address,username,emailutente,password,phoneNumber,false, null);
                utenteDao.addUser(newUtente);
                request.getRequestDispatcher("/WEB-INF/views/site/succreg.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }

    private String getPath(HttpServletRequest request) {
        String path= (request.getPathInfo() != null) ? request.getPathInfo() : "/";
        return path;
    }

}

