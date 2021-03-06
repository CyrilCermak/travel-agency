package cz.ucl.fa.ui;

import javax.swing.JPanel;

public abstract class SellTripPanel extends JPanel {
    private SellTripWizard wizard;

	public SellTripPanel(SellTripWizard wizard) {
		super();
		this.wizard = wizard;
	}

	protected SellTripWizard getWizard() {
		return wizard;
	}

	public abstract void restoreDefaults() ;

}
