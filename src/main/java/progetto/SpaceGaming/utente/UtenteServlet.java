package progetto.SpaceGaming.utente;


import progetto.SpaceGaming.acquisto.Acquisto;
import progetto.SpaceGaming.acquisto.AcquistoDAO;
import progetto.SpaceGaming.cart.Cart;
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
import java.util.Date;
import java.util.GregorianCalendar;

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
        Product p = new Product();
        Boolean b;
        Cart car = new Cart();
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
                    session.setAttribute("profilo", user);
                    session.setAttribute("log", true);
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
                Utente newProfilo = new Utente(fname2,lname2,address2,emailutente2,password2,phoneNumber2,false,null);
                dao.doChanges(newProfilo);
                session.setAttribute("profilo", newProfilo);
                request.getRequestDispatcher("/index.jsp").forward(request,response);
                break;
            case "/home": //TI RIMANDA ALLA HOME
                request.getRequestDispatcher("/index.jsp").forward(request,response);
                break;
            case "/carrello": //VIEW CARRELLO
                b =(Boolean) session.getAttribute("log"); // DA SESSIONE PRENDO LOGGATO
                if (b==null){ //CONTROLLO SE PRIMA VOLTA
                    b=false;
                    session.setAttribute("log",b);
                }
                if (b) { //CONTROLLO SE LOGGATO E SE IL CART ESISTE SENO ISTANZIO
                    if (session.getAttribute("cart") != null)
                        car=(Cart) session.getAttribute("cart");
                    if (car != null)
                        request.getRequestDispatcher("/WEB-INF/views/site/cart.jsp").forward(request, response);
                    else {
                        session.setAttribute("cart", car);
                        request.getRequestDispatcher("/WEB-INF/views/site/cart.jsp").forward(request, response);
                    }
                }
            case "/inputcarrello": //INSERIMENTO IN CARRELLO
                b = (Boolean)session.getAttribute("log"); // DA SESSIONE PRENDO LOGGATO
                if (b==null){ //CONTROLLO SE PRIMA VOLTA
                    b=false;
                    session.setAttribute("log",b);
                }
                if (!b) { //CONTROLLO SE NON LOGGATO
                    request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request, response);
                }else { //SE LOGGATO AGGIUNGO
                    int id=Integer.parseInt(request.getParameter("id"));
                    Product pro = prodao.doRetrieveById(id);//RECUPERO PRODOTTO
                    if (session.getAttribute("cart") != null)
                        car=(Cart) session.getAttribute("cart");
                    if(!(pro.getQty()<=0)) {
                        if (car.getItems() == null) { //SE PRIMA VOLTA DICHIARO
                            car.addProduct(pro); //aggiungo a cart il prodotto
                        } else {
                            car.addProduct(pro); //aggiungo a cart il prodotto se non c'è gia
                        }
                    }
                        session.setAttribute("cart", car);
                        response.sendRedirect(contextPath + "/utente/carrello");
                        break;
                }
            case "/addprod":
                car = (Cart) session.getAttribute("cart");
                p =prodao.doRetrieveById(Integer.parseInt(request.getParameter("add")));
                System.out.println(car.getProductCopies(0)+"___"+p.getQty());
                if(car.getProductCopies(p)<p.getQty())
                    car.addProduct(p);
                session.setAttribute("cart", car);
                response.sendRedirect(contextPath + "/utente/carrello");
                break;
            case "/deletepro":
                car= (Cart) session.getAttribute("cart");
                car.removeProduct(Integer.parseInt(request.getParameter("delete")));
                if(car.getItems().isEmpty()){
                    response.sendRedirect(contextPath+"/utente/home");
                }
                else {
                    session.setAttribute("cart", car);
                    response.sendRedirect(contextPath + "/utente/carrello");
                }
                break;
            case "/acquistoCart":
                car = (Cart) request.getSession().getAttribute("cart");
                Acquisto acquisto=new Acquisto();
                java.util.Date dataOrdine=new Date();
                java.sql.Date sqlDate = new java.sql.Date(dataOrdine.getTime());
                System.out.println(sqlDate);
                acquisto.setUtente((Utente) session.getAttribute("profilo"));
                acquisto.setData(sqlDate);
                AcquistoDAO aDao=new AcquistoDAO();
                aDao.addAcquisto(acquisto, car);
                car = new Cart();
                session.setAttribute("cart",car);
                request.getRequestDispatcher("/WEB-INF/views/site/succord.jsp").forward(request, response);

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

