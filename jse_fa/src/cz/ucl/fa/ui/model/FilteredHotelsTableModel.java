package cz.ucl.fa.ui.model;

import java.util.List;

import javax.persistence.Query;
import javax.swing.table.AbstractTableModel;

import cz.ucl.fa.model.Accommodation;
import cz.ucl.fa.model.util.JPAUtil;

public class FilteredHotelsTableModel extends AbstractTableModel {
	private static final int COLUMN_COUNT = 2;

	private List<Accommodation> filteredHotels;
	private String filter;

	public int getColumnCount() {
		return COLUMN_COUNT;
	}

	public int getRowCount() {
		return (filteredHotels != null ? filteredHotels.size() : 0);
	}

	public Object getValueAt(int row, int col) {
		Object result = null;
		switch (col) {
		case 0:
			result = filteredHotels.get(row).getName();
			break;
		case 1:
			result = filteredHotels.get(row).getLocation();
			break;
		}

		return result;
	}

	@Override
	public String getColumnName(int col) {
		String result = null;
		switch (col) {
		case 0:
			result = "Name";
			break;
		case 1:
			result = "Location";
			break;
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	public void setFilter(String location) {
		if (location != null && !location.equals(filter)) {
			filter = location;
			String qString = "SELECT h FROM Accommodation h WHERE h.location = :location";
			Query q = JPAUtil.getEntityManager().createQuery(qString);
			q.setParameter("location", filter);
			filteredHotels = q.getResultList();
			fireTableDataChanged();
		}
	}

	public Accommodation getHotel(int index) {
		return filteredHotels.get(index);
	}

}
