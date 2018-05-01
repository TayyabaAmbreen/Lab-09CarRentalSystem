/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrent;

import static carrent.HibernateUtil.getSessionFactory;
import java.util.List;
import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Amal
 */
public class CarHelper {
    Session session = null;

    public CarHelper() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
        
    }
    
    public List getCarTitles(int startID, int endID) {
    List<Cars> carList = null;
    try {
        
        org.hibernate.Transaction tx = session.beginTransaction();
       Session session2 = getSessionFactory().openSession();
    session2.setCacheMode(CacheMode.REFRESH);
    
        Query q = session.createQuery ("from Cars as car where car.reg between '"+startID+"' and '"+endID+"''");
        
        carList = (List<Cars>) q.list();

        session2.close();
          
        //session.refresh(q.list());
    } catch (Exception e) {
        e.printStackTrace();
    }
    return carList;
}
}
