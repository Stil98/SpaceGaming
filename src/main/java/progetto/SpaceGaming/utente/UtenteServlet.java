package progetto.SpaceGaming.utente;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import progetto.SpaceGaming.utente.UtenteDAO;

@WebServlet(name = "UtenteServlet", value = "/utente/*")
public class UtenteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String path= getPath(request);
        switch (path){
            case "/":
                break;
            case "/create":
                break;
            case "/secret":  //login admin
                request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request, response);
                break;
            case "/header":
                request.getRequestDispatcher("/WEB-INF/views/partials/header.jsp").forward(request, response);
                break;
            default:
                break;
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String path= getPath(request);
        switch (path){
            case "/":
                break;
            case "/create":
                break;
            case "/secret":
                String email=request.getParameter("email");
                String pword=request.getParameter("password");
                UtenteDAO dao= new UtenteDAO();
                if(dao.doRetrieveUserByEmailPassword(email, pword).isAdmin())
                    request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    private String getPath(HttpServletRequest request) {
        String path= (request.getPathInfo() != null) ? request.getPathInfo() : "/";
        return path;
    }

}

