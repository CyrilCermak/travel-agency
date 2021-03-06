package cz.ucl.fa.ui.model;

import java.util.List;

import javax.persistence.Query;
import javax.swing.table.AbstractTableModel;

import cz.ucl.fa.model.Service;
import cz.ucl.fa.model.types.ServiceType;
import cz.ucl.fa.model.util.JPAUtil;

public class FilteredServicesTableModel extends AbstractTableModel {
	private static final int COLUMN_COUNT = 4;

	private List<Service> filteredServices;
	private ServiceType filterType;
	private String filterLocation;

	public int getColumnCount() {
		return COLUMN_COUNT;
	}

	public int getRowCount() {
		return (filteredServices != null ? filteredServices.size() : 0);
	}

	public Object getValueAt(int row, int col) {
		Object result = null;
		switch (col) {
		case 0:
			result = filteredServices.get(row).getType();
			break;
		case 1:
			result = filteredServices.get(row).getName();
			break;
		case 2:
			result = filteredServices.get(row).getLocation();
			break;
		case 3:
			result = filteredServices.get(row).getHotel();
			break;
		}

		return result;
	}

	@Override
	public String getColumnName(int col) {
		String result = null;
		switch (col) {
		case 0:
			result = "Type";
			break;
		case 1:
			result = "Name";
			break;
		case 2:
			result = "Location";
			break;
		case 3:
			result = "Hotel";
			break;
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	public void setFilter(ServiceType type, String location) {
		if (location != null && (!location.equals(filterLocation) || type!=filterType)) {
			filterLocation = location;
			String qString = "SELECT s FROM Service s WHERE s.location = :location ";
			if(type!=null) {
				qString+= " AND s.type = :type";
				filterType = type;
			}
			Query q = JPAUtil.getEntityManager().createQuery(qString);
			q.setParameter("location", filterLocation);
			if(type!=null) qString+= q.setParameter("type",filterType);
			filteredServices = q.getResultList();
			fireTableDataChanged();
		}
	}

	public Service getService(int index) {
		return filteredServices.get(index);
	}

}
