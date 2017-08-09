package cz.ucl.fa.ui;

import java.awt.Frame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.util.ArrayList;

import javax.swing.JScrollPane;

import cz.ucl.fa.model.Accommodation;
import cz.ucl.fa.model.Service;
import cz.ucl.fa.ui.model.ListListModel;

public class HotelDetailDialog extends javax.swing.JDialog {
	private Accommodation hotel;
	ListListModel servicesModel;

	private javax.swing.JButton btClose;
	private javax.swing.JLabel lblName;
	private javax.swing.JLabel lblImage;
	private javax.swing.JLabel lblLocation;
	private javax.swing.JLabel lblLocationValue;
	private javax.swing.JLabel lblDescription;
	private javax.swing.JLabel lblServices;
	private javax.swing.JList servicesList;
	private javax.swing.JScrollPane spServices;
	private javax.swing.JScrollPane spDescription;
	private javax.swing.JTextPane tpDescription;

	public HotelDetailDialog(Frame parent, boolean modal, Accommodation hotel) {
		super(parent, modal);
		this.hotel = hotel;
		initComponents();
	}

	@SuppressWarnings("unused")
	private void setHotel(Accommodation aHotel) {
		this.hotel = aHotel;

		lblName.setText(hotel.getName());
		lblLocationValue.setText(hotel.getLocation());
		tpDescription.setText(hotel.getDescription());
		if (hotel.getImagePath()!=null) lblImage.setIcon(new javax.swing.ImageIcon(hotel.getImagePath()));
		else lblImage.setText("No image available");
	}

	private void initComponents() {
		setTitle("Accommodation detail");
		setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
		setLayout(new GridBagLayout());

		lblName = new javax.swing.JLabel();
		lblName.setFont(new java.awt.Font("Tahoma", 0, 18));
		lblName.setText(hotel.getName());

		lblImage = new javax.swing.JLabel();
		if (hotel.getImagePath()!=null) lblImage.setIcon(new javax.swing.ImageIcon(hotel.getImagePath()));
		else lblImage.setText("No image available");

		lblLocation = new javax.swing.JLabel();
		lblLocation.setFont(new java.awt.Font("Tahoma", 1, 11));
		lblLocation.setText("Location:");

		lblLocationValue = new javax.swing.JLabel();
		lblLocationValue.setText(hotel.getLocation());

		lblDescription = new javax.swing.JLabel();
		lblDescription.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
		lblDescription.setText("Description:");

		lblServices = new javax.swing.JLabel();
		lblServices.setFont(new java.awt.Font("Tahoma", 1, 11));
		lblServices.setText("Services:");

		tpDescription = new javax.swing.JTextPane();
		tpDescription.setEditable(false);
		tpDescription.setText(hotel.getDescription());
		spDescription = new javax.swing.JScrollPane(tpDescription);

		servicesModel = new ListListModel();
		servicesModel.setData(new ArrayList<Service>(hotel.getServices()));
		servicesList = new javax.swing.JList();
		servicesList.setModel(servicesModel);
		spServices = new javax.swing.JScrollPane(servicesList);


		btClose = new javax.swing.JButton();
		btClose.setText("Close");
		btClose.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				setVisible(false);
			}
		});

		GridBagConstraints c;

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridwidth = 2;
		c.gridy = 0;
		c.insets = new Insets(7,7,7,7);
		add(lblName,c);

		c = new GridBagConstraints();
		c.gridx = 2;
		c.gridy = 0;
		c.gridheight = 3;
		c.weightx = 0.7;
		c.fill = GridBagConstraints.BOTH;
		c.insets = new Insets(7,7,7,7);
		add(new JScrollPane(lblImage),c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 1;
		c.insets = new Insets(7,7,7,7);
		c.anchor = GridBagConstraints.WEST;
		add(lblLocation,c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridy = 1;
		c.weightx = 0.3;
		c.fill = GridBagConstraints.HORIZONTAL;
		c.insets = new Insets(7,7,7,7);
		add(lblLocationValue,c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 2;
		c.anchor = GridBagConstraints.NORTHWEST;
		c.insets = new Insets(7,7,7,7);
		add(lblServices,c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridy = 2;
		c.weighty = 0.4;
		c.fill = GridBagConstraints.BOTH;
		c.insets = new Insets(7,7,7,7);
		add(spServices,c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 3;
		c.gridwidth = 2;
		c.weightx = 1.0;
		c.anchor = GridBagConstraints.NORTHWEST;
		c.insets = new Insets(7,7,7,7);
		add(lblDescription,c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridwidth = 2;
		c.gridy = 3;
		c.weighty = 0.4;
		c.fill = GridBagConstraints.BOTH;
		c.insets = new Insets(7,7,7,7);
		add(spDescription,c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridwidth = 3;
		c.gridy = 4;
		c.anchor = GridBagConstraints.SOUTHEAST;
		c.insets = new Insets(7,7,7,7);
		add(btClose,c);

		pack();
	}


}
