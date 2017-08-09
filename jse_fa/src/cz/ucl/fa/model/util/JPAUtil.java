package cz.ucl.fa.model.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {
	private static EntityManager em;

	public static EntityManager getEntityManager() {
		if (em == null) {
			EntityManagerFactory emf = Persistence
					.createEntityManagerFactory("fa");
			em = emf.createEntityManager();
		}
		return em;
	}

	public static void beginTransaction() {
		em.getTransaction().begin();
	}

	public static void commitTransaction() {
		em.getTransaction().commit();
	}

	public static void rollbackTransaction() {
		em.getTransaction().rollback();
	}
}
