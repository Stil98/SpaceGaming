package progetto.SpaceGaming.utente;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        HttpSession session=request.getSession();
        UtenteDAO dao= new UtenteDAO();
        switch (path){
            case "/":
                break;
            case "/signup":
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            case "/accesso":
                String email=request.getParameter("email");
                String pword=request.getParameter("password");
                int nUtenti= dao.userCount();
                request.setAttribute("nUtenti", nUtenti);
                Utente user = dao.doRetrieveUserByEmailPassword(email,pword);
                if(user == null){
                    session.setAttribute("failedLogin", true);
                    request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request, response);
                }
                request.setAttribute("utente", user);
                if(user.isAdmin())
                    request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                else {
                    session.setAttribute("log", true);
                    session.setAttribute("profilo", user);
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
                break;
            case "/create": // CREAZIONE PROFILO CLIENTE
                String fname = request.getParameter("nome");
                String lname = request.getParameter("cognome");
                String address = request.getParameter("indirizzo");
                String emailutente = request.getParameter("email");
                String password = request.getParameter("password");
                String phoneNumber = request.getParameter("telefono");
                Utente newUtente = new Utente(fname,lname,address, emailutente,password,phoneNumber,false, null);
                dao.addUser(newUtente);
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

