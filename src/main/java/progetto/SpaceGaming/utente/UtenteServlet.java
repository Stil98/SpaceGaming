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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
        HttpSession session = request.getSession();
        String contextPath = getServletContext().getContextPath();
        String path = getPath(request);
        switch (path) {
            case "/logout": //LOGOUT CLIENTE
                session.setAttribute("log", false);
                session.invalidate();
                response.sendRedirect(contextPath + "/utente/home");
                break;

            case "/profilo": //apre pagina profilo
                request.getRequestDispatcher("/WEB-INF/views/site/profilo.jsp");
                break;
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String path= getPath(request);
        String contextPath = getServletContext().getContextPath();
        HttpSession session=request.getSession();
        UtenteDAO dao= new UtenteDAO();
        switch (path){
            case "/":
                break;
            case "/secret":  //login admin
                request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request, response);
                break;
            case "/header":
                request.getRequestDispatcher("/WEB-INF/views/partials/header.jsp").forward(request, response);
                break;
            case "/signup":
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            case "/accesso":
                String email=request.getParameter("email");
                String pword=request.getParameter("password");
                Utente user = dao.doRetrieveUserByEmailPassword(email,pword);
                if(user == null){
                    session.setAttribute("failedLogin", true);
                    request.getRequestDispatcher("/WEB-INF/views/site/secret.jsp").forward(request, response);
                }
                if(user.isAdmin()) {
                    int nUtenti = dao.userCount();
                    request.setAttribute("nUtenti", nUtenti);
                    response.sendRedirect(getServletContext().getContextPath() + "/crm/dashboard");
                }
                else {
                    session.setAttribute("profilo", user);
                    session.setAttribute("log", true);
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
                session.setAttribute("log",true);
                session.setAttribute("profilo",newUtente);
                request.getRequestDispatcher("/index.jsp").forward(request,response);
                break;
            case "/home": //TI RIMANDA ALLA HOME
                request.getRequestDispatcher("/index.jsp").forward(request,response);
                break;
            default:
               // request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }

    private String getPath(HttpServletRequest request) {
        String path= (request.getPathInfo() != null) ? request.getPathInfo() : "/";
        return path;
    }

}

