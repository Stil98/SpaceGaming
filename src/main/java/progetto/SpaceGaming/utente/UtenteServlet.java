package progetto.SpaceGaming.utente;


import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.product.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

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
                request.getRequestDispatcher("/WEB-INF/views/site/modProfilo.jsp");
                break;
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String path= getPath(request);
        String contextPath = getServletContext().getContextPath();
        HttpSession session=request.getSession();
        UtenteDAO dao= new UtenteDAO();
        ProductDAO prodao = new ProductDAO();
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
                    request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request, response);
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
            case "/profile": // SHOW PROFILO CLIENTE
                Boolean x = (Boolean) session.getAttribute("log");
                if (x) {
                    Utente userlog =(Utente) session.getAttribute("profilo");
                    request.getRequestDispatcher("/WEB-INF/views/site/modProfilo.jsp").forward(request, response);
                }else
                    response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita" );
                break;
            case "/update": // AGGIORNAMENTO PROFILO CLIENTE
                String fname2 = request.getParameter("nome");
                String lname2 = request.getParameter("cognome");
                String address2 = request.getParameter("indirizzo");
                String emailutente2 = request.getParameter("email");
                String password2 = request.getParameter("password");
                String phoneNumber2 = request.getParameter("telefono");
                String oldemail = request.getParameter("oldemail");
                Utente oldprof= dao.doRetrieveByEmail(oldemail);
                System.out.print(oldprof.getAddress());
                Utente newProfilo = new Utente(fname2,lname2,address2,emailutente2,password2,phoneNumber2,false,null);
                System.out.println(newProfilo.getAddress());
                if (oldprof.getPassword().equals(password2)) {
                    dao.doChanges(newProfilo);
                    session.setAttribute("profilo", newProfilo);
                }
                response.sendRedirect(contextPath+"/utente/profile");
                break;
            case "/home": //TI RIMANDA ALLA HOME
                request.getRequestDispatcher("/index.jsp").forward(request,response);
                break;
            case "/inputcarrello": //INSERIMENTO IN CARRELLO
                Boolean b = (Boolean)session.getAttribute("log"); // DA SESSIONE PRENDO LOGGATO
                ArrayList<Product> cart;

                if (b==null){ //CONTROLLO SE PRIMA VOLTA
                    b=false;
                    session.setAttribute("log",b);
                }
                if (!b) { //CONTROLLO SE NON LOGGATO
                    request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request, response);

                }else { //SE LOGGATO AGGIUNGO
                    int id=Integer.parseInt(request.getParameter("id"));

                    Product pro = prodao.doRetrieveById(id);//RECUPERO PRODOTTO
                    System.out.println(pro.getNome());

                    cart = (ArrayList<Product>) session.getAttribute("cart");
                    if (cart == null) { //SE PRIMA VOLTA DICHIARO
                        cart = new ArrayList<>();
                        cart.add(pro); //aggiungo a cart il prodotto
                        System.out.println("aggiunto");
                        session.setAttribute("cart", cart);
                    }
                    else {
                        cart.add(pro); //aggiungo a cart il prodotto se non c'è gia
                        System.out.println("aggiunto");
                        session.setAttribute("cart", cart);
                    }
                    System.out.println(cart.get(0).getNome());
                }
            default:
               // request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }

    private String getPath(HttpServletRequest request) {
        String path= (request.getPathInfo() != null) ? request.getPathInfo() : "/";
        return path;
    }

}

