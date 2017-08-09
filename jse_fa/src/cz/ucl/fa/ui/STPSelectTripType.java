package cz.ucl.fa.ui;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.JPanel;

/**
 *
 * @author Martin
 */
public class STPSelectTripType extends SellTripPanel {
	private javax.swing.ButtonGroup bgTripType;
	private javax.swing.JButton btNext;
	private javax.swing.JButton btCancel;
	private javax.swing.JLabel lblSelectTripType;
	javax.swing.JRadioButton rbPredefinedTrip;
	private javax.swing.JRadioButton rbCustomTrip;

	/** Creates new form SellTripPanel1
	 * @param sellTripWizard */
	public STPSelectTripType(SellTripWizard sellTripWizard) {
		super(sellTripWizard);
		initComponents();
		restoreDefaults();
	}

	private void initComponents() {
		this.setLayout(new GridBagLayout());

		lblSelectTripType = new javax.swing.JLabel();
		lblSelectTripType.setFont(new java.awt.Font("Tahoma", 1, 11));
		lblSelectTripType.setText("Choose trip type:");

		rbPredefinedTrip = new javax.swing.JRadioButton();
		rbPredefinedTrip.setText("Pre-defined");

		rbCustomTrip = new javax.swing.JRadioButton();
		rbCustomTrip.setText("Custom");

		bgTripType = new javax.swing.ButtonGroup();
		bgTripType.add(rbPredefinedTrip);
		bgTripType.add(rbCustomTrip);

		btNext = new javax.swing.JButton();
		btNext.setText("Next >>");
		btNext.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
				getWizard().panel1Next();
			}
		});

		btCancel = new javax.swing.JButton();
		btCancel.setText("Cancel");
		btCancel.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
				getWizard().cancel();
			}
		});

		JPanel buttonPanel = new JPanel();
		buttonPanel.add(btCancel);
		buttonPanel.add(btNext);

		GridBagConstraints c = new GridBagConstraints();
		c.gridx = 0;
		c.gridy = 0;
		c.weightx = 0.0;
		c.weighty = 0.0;
		c.insets = new Insets(10,10,0,0);
		c.anchor = GridBagConstraints.SOUTHEAST;
		this.add(lblSelectTripType, c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridy = 1;
		c.weightx = 0.9;
		c.weighty = 0.0;
		c.insets = new Insets(10,10,0,10);
		c.anchor = GridBagConstraints.SOUTHWEST;
		this.add(rbPredefinedTrip, c);

		c = new GridBagConstraints();
		c.gridx = 1;
		c.gridy = 2;
		c.weightx = 0.9;
		c.weighty = 0.0;
		c.insets = new Insets(0,10,0,10);
		c.anchor = GridBagConstraints.NORTHWEST;
		this.add(rbCustomTrip, c);

		c = new GridBagConstraints();
		c.gridx = 0;
		c.gridwidth = 2;
		c.gridy = 3;
		c.weightx = 1.0;
		c.weighty = 1.0;
		c.anchor = GridBagConstraints.SOUTH;
		c.fill = GridBagConstraints.HORIZONTAL;
		this.add(buttonPanel, c);
	}

	public boolean isPredefinedSelected() {
		return rbPredefinedTrip.isSelected();
	}

	public boolean isCustomSelected() {
		return rbCustomTrip.isSelected();
	}

	@Override
	public void restoreDefaults() {
		rbPredefinedTrip.setSelected(true);
	}
}
