package cz.ucl.fa.ui;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.persistence.Query;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.SwingUtilities;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import cz.ucl.fa.model.Accommodation;
import cz.ucl.fa.model.util.JPAUtil;
import cz.ucl.fa.ui.model.FilteredHotelsTableModel;

public class SelectAccommodationDialog extends javax.swing.JDialog {
	private HotelDetailDialog dHotelDetail;

	private FilteredHotelsTableModel hotelTableModel;
	private boolean wasCancelled;

	private javax.swing.JButton btChoose;
	private javax.swing.JButton btCancel;
	private javax.swing.JButton btShowDetail;
	private javax.swing.JComboBox cbLocation;
	private javax.swing.JLabel lblLocation;
	private javax.swing.JLabel lblFrom;
	private javax.swing.JLabel lblTo;
	private javax.swing.JScrollPane spHotels;
	private javax.swing.JTable hotelTable;
	private javax.swing.JTextField tfFrom;
	private javax.swing.JTextField tfTo;

	public SelectAccommodationDialog(JDialog parent, boolean modal) {
		super(parent, modal);
		initComponents();
	}

	private void initComponents() {
		setTitle("Select accommodation");
		setLayout(new GridBagLayout());

		lblLocation = new javax.swing.JLabel();
		lblLocation.setFont(new java.awt.Font("Tahoma", 1, 11));
		lblLocation.setText("Location:");

		hotelTable = new javax.swing.JTable();


		tfFrom = new javax.swing.JTextField();
		tfFrom.setText("");

		tfTo = new javax.swing.JTextField();
		tfTo.setText("");

		btChoose = new javax.swing.JButton();
		btChoose.setText("Choose selected");
		btChoose.setEnabled(false);
		btChoose.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
				wasCancelled = false;
				setVisible(false);
			}
		});

		btCancel = new javax.swing.JButton();
		btCancel.setText("Cancel");
		btCancel.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
				wasCancelled = true;
				setVisible(false);
			}
		});

		btShowDetail = new javax.swing.JButton();
		btShowDetail.setText("Show detail");
		btShowDetail.setEnabled(false);
		btShowDetail.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
			    dHotelDetail = new HotelDetailDialog(BlueTravelFrame.getMainFrame(),true,getSelectedHotel());
				dHotelDetail.setVisible(true);
			}
		});

		lblFrom = new javax.swing.JLabel();
		lblFrom.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
		lblFrom.setText("From:");

		lblTo = new javax.swing.JLabel();
		lblTo.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
		lblTo.setText("To:");

		setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

		cbLocation = new javax.swing.JComboBox();
		cbLocation.setModel(new javax.swing.DefaultComboBoxModel(getAllLocations()));
		cbLocation.setSelectedItem(null);
		cbLocation.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				hotelTableModel.setFilter((String)cbLocation.getSelectedItem());
			}
		});

		hotelTable.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		hotelTableModel = new FilteredHotelsTableModel();
		hotelTable.setModel(hotelTableModel);
		hotelTable.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent e) {
				if (!e.getValueIsAdjusting()) {
					if (hotelTable.getSelectedRow()>=0) {
						btChoose.setEnabled(true);
						btShowDetail.setEnabled(true);
					} else {
						btChoose.setEnabled(false);
						btShowDetail.setEnabled(false);
					}
				}

			}
		});
		spHotels= new JScrollPane(hotelTable);

		GridBagConstraints c;

		JPanel buttonPanel = new JPanel();
		buttonPanel.add(btShowDetail);
		buttonPanel.add(btChoose);
		buttonPanel.add(btCancel);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 0;
		c.insets = new Insets(7,7,7,7);
		add(lblLocation,c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridwidth = 3;
		c.gridy = 0;
		c.fill = GridBagConstraints.HORIZONTAL;
		c.insets = new Insets(7,7,7,7);
		add(cbLocation,c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridwidth = 5;
		c.gridy = 1;
		c.fill = GridBagConstraints.BOTH;
		c.weightx = 1.0;
		c.weighty = 1.0;
		c.insets = new Insets(7,7,7,7);
		add(spHotels,c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 2;
		c.insets = new Insets(7,7,7,7);
		add(lblFrom,c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridy = 2;
		c.weightx = 0.2;
		c.fill = GridBagConstraints.HORIZONTAL;
		c.insets = new Insets(7,7,7,7);
		add(tfFrom,c);

		c = new GridBagConstraints();
		c.gridx = 2;
		c.gridy = 2;
		c.insets = new Insets(7,7,7,7);
		add(lblTo,c);

		c = new GridBagConstraints();
		c.gridx = 3;
		c.gridy = 2;
		c.weightx = 0.2;
		c.fill = GridBagConstraints.HORIZONTAL;
		c.insets = new Insets(7,7,7,7);
		add(tfTo,c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 3;
		c.anchor = GridBagConstraints.SOUTHEAST;
		c.gridwidth = 5;
		c.insets = new Insets(7,7,7,7);
		add(buttonPanel,c);

		pack();
	}

	protected Accommodation getSelectedHotel() {
		return hotelTableModel.getHotel(hotelTable.getSelectedRow());
	}

	@SuppressWarnings("unchecked")
	private Object[] getAllLocations() {
		Query q = JPAUtil.getEntityManager().createQuery(
				"SELECT DISTINCT h.location FROM Accommodation h");
		List<String> allLocations = (List<String>) q.getResultList();
		String[] result = new String[allLocations.size()];
		for(int i = 0; i< allLocations.size(); i++) result[i] = allLocations.get(i);

		return result;
	}

	/*public Stay getSelectedAccommodation() {
		Stay result = new Stay();

		result.setHotel(getSelectedHotel());
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
			result.setDayFrom(sdf.parse(tfFrom.getText()));
			result.setDayTo(sdf.parse(tfTo.getText()));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}*/

	public boolean wasCancelled() {
		return wasCancelled;
	}

	public static void main(String[] argv) {
		SwingUtilities.invokeLater(new Runnable() {

			public void run() {
				SelectAccommodationDialog instance = new SelectAccommodationDialog(
						null, true);
				instance.setVisible(true);
				//if(!instance.wasCancelled()) System.out.println("Selected accommodation: " + instance.getSelectedAccommodation());
				System.exit(0);
			}

		});
	}
}