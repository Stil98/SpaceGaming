package progetto.SpaceGaming.http;

import progetto.SpaceGaming.utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CrmServlet", value = "/crm/*")
public class CrmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo() : "/";
        switch (path){
            case "/":
                break;
            case "/dashboard":
                UtenteDAO dao=new UtenteDAO();
                int uTotali= dao.userCount();
                request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }


}
