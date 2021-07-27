package progetto.SpaceGaming.http;

import progetto.SpaceGaming.acquisto.Acquisto;
import progetto.SpaceGaming.acquisto.AcquistoDAO;
import progetto.SpaceGaming.cart.Cart;
import progetto.SpaceGaming.console.Console;
import progetto.SpaceGaming.console.ConsoleDAO;
import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.product.ProductDAO;
import progetto.SpaceGaming.utente.Utente;
import progetto.SpaceGaming.utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

@WebServlet(name = "CrmServlet", value = "/crm/*")
@MultipartConfig
public class CrmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo() : "/";
        UtenteDAO usrDao=new UtenteDAO();
        ProductDAO prodDao=new ProductDAO();
        ConsoleDAO cnslDao=new ConsoleDAO();
        AcquistoDAO ordDao=new AcquistoDAO();
        HttpSession session=request.getSession();
        int id;
        Utente usr=new Utente();
        Product p=new Product();
        switch (path){
            case "/":
                break;
            case "/dashboard":
                int nUtenti = usrDao.userCount();
                String total = ordDao.getTotal();
                String monthlytotal = ordDao.getTotalMonthly();
                int totProd = prodDao.countById();
                request.setAttribute("totaleprodotti",totProd);
                request.setAttribute("totalemese", monthlytotal);
                request.setAttribute("totale", total);
                request.setAttribute("nUtenti", nUtenti);
                request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                break;

            case "/gClienti":
                ArrayList<Utente> customers= usrDao.doRetrieveAll();
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("/WEB-INF/views/crm/gClienti.jsp").forward(request, response);
                break;

            case "/modClienti":
                usr=usrDao.doRetrieveByEmail(request.getParameter("id"));
                request.setAttribute("customer", usr);
                request.getRequestDispatcher("/WEB-INF/views/crm/modClienti.jsp").forward(request, response);
                break;

            case "/delClienti":
                usrDao.deleteByEmail(request.getParameter("idDel"));
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gClienti");
                break;
            case "/gProdotti":
                ArrayList<Product> products= prodDao.doRetrieveAll();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/WEB-INF/views/crm/gProdotti.jsp").forward(request, response);
                break;

            case "/modProdotti":
                id= Integer.parseInt(request.getParameter("id"));
                p=prodDao.doRetrieveById(id);
                request.setAttribute("product", p);
                request.getRequestDispatcher("/WEB-INF/views/crm/modProdotti.jsp").forward(request, response);
                break;
            case "/delProdotti":
                id= Integer.parseInt(request.getParameter("idDel"));
                prodDao.deleteById(id);
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gProdotti");
                break;
            case "/newProdotto":
                request.getRequestDispatcher("/WEB-INF/views/crm/newProdotto.jsp").forward(request, response);
                break;
            case "/gOrdini":
                ArrayList<Acquisto> orders=ordDao.doRetrieveAll();
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/WEB-INF/views/crm/gOrdini.jsp").forward(request, response);
                break;

            case "/gCategorie":
                ArrayList<Console> consoles= cnslDao.doRetrieveAll();
                request.setAttribute("consoles", consoles);
                request.getRequestDispatcher("/WEB-INF/views/crm/gCategorie.jsp").forward(request, response);
                break;

            case "/modCategorie":
                Console c=cnslDao.doRetrieveById(request.getParameter("id"));
                request.setAttribute("console", c);
                request.getRequestDispatcher("/WEB-INF/views/crm/modCategorie.jsp").forward(request, response);
                break;

            case "/cnslModifica":
                System.out.println(cnslDao.doRetrieveById(request.getParameter("nome")));
                Console cn=cnslDao.doRetrieveById(request.getParameter("nome"));
                cn.setDescrizione(request.getParameter("descrizione"));
                cnslDao.doChanges(cn);
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gCategorie");
                break;
            case "/viewOrdine":
                id= Integer.parseInt(request.getParameter("idOrdine"));
                Acquisto a= ordDao.doRetrieveById(id);
                Cart cart= ordDao.getCart(a);
                session.setAttribute("cart", cart);
                request.getRequestDispatcher("/WEB-INF/views/crm/viewCart.jsp").forward(request, response);
                break;

                default:
                    request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo() : "/";
        UtenteDAO usrDao=new UtenteDAO();
        ProductDAO prodDao=new ProductDAO();
        AcquistoDAO aDao=new AcquistoDAO();
        Product p=new Product();
        switch (path){
            case "/":
                break;
            case "/clienteModifica":
                Utente usr= usrDao.doRetrieveByEmail(request.getParameter("email"));
                usr.setFname(request.getParameter("nome"));
                usr.setLname(request.getParameter("cognome"));
                usr.setPhoneNumber(request.getParameter("telefono"));
                usr.setAddress(request.getParameter("indirizzo"));
                usrDao.doChanges(usr);
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gClienti");
                break;

            case "/setAdmin":
                usr=usrDao.doRetrieveByEmail(request.getParameter("idAdm"));
                if (usr.isAdmin())
                    usr.setAdmin(false);
                else
                    usr.setAdmin(true);
                usrDao.doChanges(usr);
                ArrayList<Utente> customerz= usrDao.doRetrieveAll();
                request.setAttribute("customers", customerz);
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gClienti");
                break;
            case "/prodCreato":
                p=new Product();
                p.setNome(request.getParameter("prod"));
                double prezzo= Double.parseDouble(request.getParameter("prezzo"));
                p.setPrezzo(prezzo);
                int qty = Integer.parseInt(request.getParameter("quantita"));
                p.setQty(qty);
                p.setConsole(request.getParameter("console"));
                p.setDescrizione(request.getParameter("descrizione"));
                String updatePath = "C:"+ File.separator+"ProgramData" +File.separator + "MySQL" +
                        File.separator + "MySQL Server 8.0" + File.separator + "Uploads" + File.separator;
                Part filePart=request.getPart("img");
                String fileName= Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                InputStream stream = filePart.getInputStream();
                String linkImg = updatePath + fileName;
                File file= new File(linkImg);
                try{
                    Files.copy(stream,file.toPath());
                } catch (FileAlreadyExistsException e){
                    /* do nothing */
                }
                p.setBase64img(fileName);
                prodDao.addProdotto(p);
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gProdotti");
                break;
            case "/prodModifica":
                int idn= Integer.parseInt(request.getParameter("id"));
                p=prodDao.doRetrieveById(idn);
                p.setNome(request.getParameter("prod"));
                int qt= Integer.parseInt(request.getParameter("quantita"));
                p.setQty(qt);
                double price=Double.parseDouble(request.getParameter("prezzo"));
                p.setPrezzo(price);
                p.setDescrizione(request.getParameter("descrizione"));
                if (request.getParameter("img")!=null) {
                    String uPath = "C:" + File.separator + "ProgramData" + File.separator + "MySQL" +
                            File.separator + "MySQL Server 8.0" + File.separator + "Uploads" + File.separator;
                    Part fPart = request.getPart("img");
                    String fName = Paths.get(fPart.getSubmittedFileName()).getFileName().toString();
                    InputStream strm = fPart.getInputStream();
                    String lImg = uPath + fName;
                    File f = new File(lImg);
                    try {
                        Files.copy(strm, f.toPath());
                    } catch (FileAlreadyExistsException e) {
                        /* do nothing */
                    }
                    p.setBase64img(fName);
                    prodDao.doChangesImg(p);
                } else prodDao.doChanges(p);
                response.sendRedirect(getServletContext().getContextPath() + "/crm/gProdotti");
                break;
            default:
               // request.getRequestDispatcher("/WEB-INF/views/partials/errors.jsp").forward(request, response);
        }
    }
}
