package cz.ucl.fa.ui.model;

import java.util.ArrayList;
import java.util.List;

import javax.swing.AbstractListModel;

/**
 *
 * This class provides an implementation of a simple static
 * data model for lists, based on java.util.List (This could have
 * been implemented in DefaultListModel but isn't)
 *
 * @author Martin Jelen
 *
 */
public class ListListModel extends AbstractListModel {
	@SuppressWarnings("unchecked")
	private List data = new ArrayList();

	public ListListModel() {
		super();
	}

	public Object getElementAt(int index) {
		return data.get(index);
	}

	public int getSize() {
		return data.size();
	}

	@SuppressWarnings("unchecked")
	public List getData() {
		return data;
	}

	@SuppressWarnings("unchecked")
	public void setData(List data) {
		if (data!=null) fireIntervalRemoved(this, 0, data.size());
		this.data = data;
		if (data!=null) fireIntervalAdded(this, 0, data.size());
	}

	public void remove(int selectedIndex) {
		data.remove(selectedIndex);
		fireIntervalRemoved(this, selectedIndex, selectedIndex);
	}

}
