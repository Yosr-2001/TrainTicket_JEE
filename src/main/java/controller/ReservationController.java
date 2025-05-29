package controller;
 
import dao.BilletDAO;
import dao.ReservationDAO;
import dao.UtilisateurDAO;
import dao.VoyageDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import model.Billet;
import model.Reservation;
import model.Utilisateur;
import model.Voyage;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
@WebServlet("/ReservationController")
public class ReservationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO = new ReservationDAO();
    private VoyageDAO voyageDAO = new VoyageDAO();
    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("form".equals(action)) {
        	int voyageId = Integer.parseInt(request.getParameter("voyageId"));
        	Voyage voyage = voyageDAO.findByIdd(voyageId);


            // Simuler un utilisateur connecté (à remplacer par session)
            Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("utilisateur");

            request.setAttribute("voyage", voyage);
            request.setAttribute("utilisateur", utilisateur);
            request.setAttribute("dateReservation", new java.util.Date());

            RequestDispatcher rd = request.getRequestDispatcher("ViewsClient/formReservation.jsp");
            rd.forward(request, response);
        } else if ("mesReservations".equals(action)) {
            Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("utilisateur");

            if (utilisateur != null) {
                List<Reservation> reservations = reservationDAO.findByUtilisateur(utilisateur);
                request.setAttribute("mesReservations", reservations);
                RequestDispatcher rd = request.getRequestDispatcher("ViewsClient/mesReservations.jsp");
                rd.forward(request, response);
            } 
        }
        
        
        if ("byUser".equals(request.getParameter("action"))) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            
            Utilisateur utilisateur = utilisateurDAO.getById(userId);  
            List<Reservation> reservations = reservationDAO.findByUtilisateur(utilisateur);
            
            request.setAttribute("reservations", reservations);
            request.setAttribute("utilisateur", utilisateur);
            request.getRequestDispatcher("ViewsAdmin/userReservations.jsp").forward(request, response);
        }


    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //int voyageId = Integer.parseInt(request.getParameter("voyageId"));
        int nbPersonnes = Integer.parseInt(request.getParameter("nbPersonnes"));

       // Voyage voyage = voyageDAO.findById(voyageId);
        
        
        int voyageId = Integer.parseInt(request.getParameter("voyageId"));
        Voyage voyage = voyageDAO.findByIdd(voyageId);

        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("utilisateur");
        
        
        
        if (voyage.getNbPlacesDispo() < nbPersonnes) {
            response.sendRedirect("ReservationController?action=mesReservations&error=notEnoughPlaces");
            return;
        }
        
        int prixTotal = (int) (voyage.getPrixVoyage() * nbPersonnes);


        voyage.setNbPlacesDispo(voyage.getNbPlacesDispo() - nbPersonnes);
        voyageDAO.update(voyage); 

        Reservation res = new Reservation();
        res.setVoyage(voyage);
        res.setUtilisateur(utilisateur);
        res.setNbPersonnes(nbPersonnes);
        res.setDateReservation(new Date());
        res.setPrixTotal(prixTotal);
        reservationDAO.create(res);

        BilletDAO billetDAO = new BilletDAO();
        for (int i = 0; i < nbPersonnes; i++) {
            Billet billet = new Billet(new Date(), res);
            billetDAO.create(billet);
        }

        //response.sendRedirect("ReservationController");
        //response.sendRedirect("ReservationController?success=true");
        response.sendRedirect("ReservationController?action=mesReservations&success=true");


    }



}