package cz.ucl.fa.ui.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.table.AbstractTableModel;

import cz.ucl.fa.model.Holiday;
import cz.ucl.fa.model.util.JPAUtil;

public class TripTableModel extends AbstractTableModel {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private static final int COLUMN_NAME = 0;
	private static final int COLUMN_STARTS = 1;
	private static final int COLUMN_ENDS = 2;
	private static final int COLUMN_PRICE = 3;

	private List<Holiday> allTrips;

	public TripTableModel() {
		refreshTrips();
	}

	public int getColumnCount() {
		return 4;
	}

	public int getRowCount() {
		return allTrips.size();
	}

	public Object getValueAt(int tripNo, int column) {
		Object result = null;

		switch (column) {
//		case COLUMN_NAME:
//			result = allTrips.get(tripNo).getName();
//			break;
//		case COLUMN_STARTS:
//			result = allTrips.get(tripNo).getStarts();
//			break;
//		case COLUMN_ENDS:
//			result = allTrips.get(tripNo).getEnds();
//			break;
//		case COLUMN_PRICE:
//			result = allTrips.get(tripNo).getPrice();
//			break;
		}

		return result;
	}

	@Override
	public Class<?> getColumnClass(int column) {
		Class<?> result = null;
		switch (column) {
		case COLUMN_NAME:
			result = String.class;
			break;
		case COLUMN_STARTS:
			result = Date.class;
			break;
		case COLUMN_ENDS:
			result = Date.class;
			break;
		case COLUMN_PRICE:
			result = Double.class;
			break;
		}
		return result;
	}

	@Override
	public String getColumnName(int column) {
		String result = null;
		switch (column) {
		case COLUMN_NAME:
			result = "Name";
			break;
		case COLUMN_STARTS:
			result = "Starts on";
			break;
		case COLUMN_ENDS:
			result = "Ends on";
			break;
		case COLUMN_PRICE:
			result = "Price";
			break;
		}
		return result;
	}

	public Holiday getTrip(int firstIndex) {
		if (firstIndex>=0 && firstIndex<allTrips.size()) return allTrips.get(firstIndex);
		else return null;
	}

	@SuppressWarnings("unchecked")
	public void refreshTrips() {
		allTrips = new ArrayList<Holiday>();
		//TODO: Doplnit dotaz do třídy Holiday
		//allTrips = (List<Holiday>) JPAUtil.getEntityManager()
		//			.createNamedQuery("Trip.getFixed").getResultList()
		fireTableDataChanged();
	}

	public void removeTrip(Holiday selectedTrip) {
		JPAUtil.getEntityManager().getTransaction().begin();
		//JPAUtil.getEntityManager().remove(selectedTrip);
		JPAUtil.getEntityManager().getTransaction().commit();
		fireTableDataChanged();
	}

}
