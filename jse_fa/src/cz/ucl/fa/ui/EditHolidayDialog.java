/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * EditHolidayDialog.java
 *
 * Created on 05.11.2008, 03:46:12
 */

package cz.ucl.fa.ui;

import java.awt.Dialog;

import cz.ucl.fa.model.Holiday;

/**
 *
 * @author Martin
 */
public class EditHolidayDialog extends javax.swing.JDialog {
	private Holiday holiday;
	private boolean isNew;
    //private cz.ucl.fa.ui.EditHolidayPanel editHolidayPanel;


    public EditHolidayDialog(Dialog owner, Holiday holiday) {
		super(owner, true);
		this.holiday = holiday;
		isNew = false;
		initComponents();
	}

    public EditHolidayDialog(Dialog owner) {
		super(owner, true);
		isNew = true;
		this.holiday = new Holiday();
		initComponents();
	}

    private void initComponents() {
    	setLocationRelativeTo(getParent());
    	setTitle("Edit trip");


        pack();
    }

}
