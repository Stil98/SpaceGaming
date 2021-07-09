package progetto.SpaceGaming.product;

import progetto.SpaceGaming.console.Console;
import progetto.SpaceGaming.console.ConsoleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

    @WebServlet(name = "ProductServlet", value = "/prodotto/*")
    public class ProductServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            ProductDAO proDAO = new ProductDAO();
            String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
            switch (path) {
                case "/PS4":
                    ArrayList<Product> listaP = proDAO.doRetrieveProdottiByPlatform("PS4");
                    request.setAttribute("lista", listaP);
                    System.out.println(listaP.size());

                    request.getRequestDispatcher("/WEB-INF/views/site/categoria1.jsp").forward(request, response);
                    break;
                case "/XBOX":
                    ArrayList<Product> listaX = proDAO.doRetrieveProdottiByPlatform("XBOX");
                    request.setAttribute("lista", listaX);
                    request.getRequestDispatcher("/WEB-INF/views/site/categoria1.jsp").forward(request, response);
                case "/SWITCH":
                    ArrayList<Product> listaS = proDAO.doRetrieveProdottiByPlatform("SWITCH");
                    request.setAttribute("lista", listaS);
                    request.getRequestDispatcher("/WEB-INF/views/site/categoria1.jsp").forward(request, response);
            }
        }
    }

