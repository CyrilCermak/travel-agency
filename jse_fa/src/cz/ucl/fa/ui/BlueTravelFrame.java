package cz.ucl.fa.ui;

import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

public class BlueTravelFrame extends JFrame {

	private static final long serialVersionUID = 1L;

	private static BlueTravelFrame mainFrame;

	private JPanel jContentPane = null;

	private JButton bConfigureTrip;
	private JButton bSellTrip;
	private JButton bCustomerOverview;

	private SellTripWizard dSellTripWizard;
	private CustomerListDialog dCustomerList;
	private TripListDialog dTripList;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//nastav vzhled "Windows"
		try {
			UIManager
					.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}

		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				mainFrame = new BlueTravelFrame();
				mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				mainFrame.setVisible(true);
			}

		});

	}

	/**
	 * This is the default constructor
	 */
	public BlueTravelFrame() {
		super();
		initialize();
	}

	/**
	 * This method initializes this
	 *
	 * @return void
	 */
	private void initialize() {
		this.setSize(300, 200);
		setLocationRelativeTo(null);
		this.setContentPane(getJContentPane());
		this.setTitle("Blue Travel");

		dTripList = new TripListDialog(this, true);
		bConfigureTrip = new JButton("Pre-defined trips");
		bConfigureTrip.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
				dTripList.refreshTrips();
				dTripList.setVisible(true);
			}
		});
		this.getJContentPane().add(bConfigureTrip);

		bSellTrip = new JButton("Sell a trip");
		bSellTrip.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) {
				dSellTripWizard = new SellTripWizard(mainFrame, true);
				dSellTripWizard.setVisible(true);
			}
		});
		this.getJContentPane().add(bSellTrip);

		bCustomerOverview = new JButton("Customer list");
		bCustomerOverview
				.addActionListener(new java.awt.event.ActionListener() {
					public void actionPerformed(java.awt.event.ActionEvent e) {
						dCustomerList = new CustomerListDialog(mainFrame, true);
						dCustomerList.setVisible(true);
					}
				});
		this.getJContentPane().add(bCustomerOverview);
	}

	/**
	 * This method initializes jContentPane
	 *
	 * @return javax.swing.JPanel
	 */
	private JPanel getJContentPane() {
		if (jContentPane == null) {
			GridLayout gridLayout = new GridLayout();
			gridLayout.setRows(3);
			gridLayout.setColumns(1);
			jContentPane = new JPanel();
			jContentPane.setLayout(gridLayout);
		}
		return jContentPane;
	}

	public static BlueTravelFrame getMainFrame() {
		return mainFrame;
	}
}
