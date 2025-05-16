package dao;

import model.Billet;
import model.Client;
import model.Trajet;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class BilletDAO {
    private SessionFactory sessionFactory;
    public BilletDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    public Billet findById(long id) {
        Session session = sessionFactory.openSession();
        Billet billet = session.get(Billet.class, id);
        session.close();
        return billet;
    }
    public boolean create(Billet billet) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(billet);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
        return success;
    }

    public List<Billet> findAll() {
        Session session = sessionFactory.openSession();
        List<Billet> result = session.createQuery("from Billet", Billet.class).getResultList();
        session.close();
        return result;
    }
    public boolean update(Long id, float prix, String statut) {
        Session session = sessionFactory.openSession();
        Billet billet = session.get(Billet.class, id);
        boolean success = false;
        if (billet != null) {
            billet.setPrix(prix);
            billet.setStatut(statut);
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.persist(billet);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    // Supprimer un billet
    public boolean delete(long id) {
        Session session = sessionFactory.openSession();
        Billet billet = session.get(Billet.class, id);
        boolean success = false;
        if (billet != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(billet);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    /***************************/
    public List<Billet> findByClient(Client client) {
        Session session = sessionFactory.openSession();
        List<Billet> billets = session.createQuery("from Billet where client = :client", Billet.class)
                .setParameter("client", client)
                .getResultList();
        session.close();
        return billets;
    }

    // Récupérer tous les billets pour un trajet spécifique
    public List<Billet> findByTrajet(Trajet trajet) {
        Session session = sessionFactory.openSession();
        List<Billet> billets = session.createQuery("from Billet where trajet = :trajet", Billet.class)
                .setParameter("trajet", trajet)
                .getResultList();
        session.close();
        return billets;
    }
}
