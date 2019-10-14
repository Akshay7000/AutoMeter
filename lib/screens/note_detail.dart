import 'dart:async';
import 'package:flutter/material.dart';
import 'package:auto_meter/utils/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:auto_meter/models/note.dart';

class NoteDetail extends StatefulWidget {

	final String appBarTitle;
	final Note note;

	NoteDetail(this. note, this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {


	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
	Note note;

	TextEditingController titleController = TextEditingController();
	TextEditingController descriptionController = TextEditingController();
	TextEditingController phoneController = TextEditingController();

	NoteDetailState(this.note, this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.title;

		titleController.text = note.title;
		descriptionController.text = note.description;
		phoneController.text = note.phone;

    return WillPopScope(

	    onWillPop: () {
	    	// Write some code to control things, when user press Back navigation button in device navigationBar
		    moveToLastScreen();
	    },

	    child: Scaffold(
	    appBar: AppBar(
		    title: Text(appBarTitle),
		    leading: IconButton(icon: Icon(
				    Icons.arrow_back),
				    onPressed: () {
		    	    // Write some code to control things, when user press back button in AppBar
		    	    moveToLastScreen();
				    }
		    ),
	    ),

	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[

			    	// First element
//				    ListTile(
//					    title: DropdownButton(
//							    items: _priorities.map((String dropDownStringItem) {
//							    	return DropdownMenuItem<String> (
//									    value: dropDownStringItem,
//									    child: Text(dropDownStringItem),
//								    );
//							    }).toList(),
//
//							    style: textStyle,
//
//							    value: getPriorityAsString(note.priority),
//
//							    onChanged: (valueSelectedByUser) {
//							    	setState(() {
//							    	  debugPrint('User selected $valueSelectedByUser');
//							    	  updatePriorityAsInt(valueSelectedByUser);
//							    	});
//							    }
//					    ),
//				    ),
//
				    // Second Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: titleController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
						    	updateTitle();
						    },
						    decoration: InputDecoration(
							    labelText: 'Name',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),


						Padding(
							padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
							child: TextField(
								controller: phoneController,
								style: textStyle,
								onChanged: (value) {
									debugPrint('Something changed in Mobile number Text Field');
									updatePhone();
								},
								decoration: InputDecoration(
										labelText: 'Mobile Number',
										labelStyle: textStyle,
										border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(5.0)
										)
								),
							),
						),


				    // Third Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: descriptionController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateDescription();
						    },
						    decoration: InputDecoration(
								    labelText: 'Room',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),

				    // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Data Saved");
									    	  _save();
									    	});
									    },
								    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Delete',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
										    setState(() {
											    debugPrint("Delete button clicked");
											    _delete();
										    });
									    },
								    ),
							    ),
						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    ));
  }

  void moveToLastScreen() {
		Navigator.pop(context, true);
  }

  void updateTitle(){
    note.title = titleController.text;
  }

	// Update the description of Note object
	void updateDescription() {
		note.description = descriptionController.text;
	}

	void updatePhone() {
		note.phone = phoneController.text;
	}

	// Convert the String priority in the form of integer before saving it to Database
//	void updatePriorityAsInt(String value) {
//		switch (value) {
//			case 'High':
//				note.priority = 1;
//				break;
//			case 'Low':
//				note.priority = 2;
//				break;
//		}
//	}
//
//	// Convert int priority to String priority and display it to user in DropDown
//	String getPriorityAsString(int value) {
//		String priority;
//		switch (value) {
//			case 1:
//				priority = _priorities[0];  // 'High'
//				break;
//			case 2:
//				priority = _priorities[1];  // 'Low'
//				break;
//		}
//		return priority;
//	}

	// Update the title of Note object
	// Save data to database

	void _save() async {
		moveToLastScreen();
		note.date = DateFormat.yMMMd().format(DateTime.now());
		int result;
		if (note.id != null) {  // Case 1: Update operation
			result = await helper.updateNote(note);
		} else { // Case 2: Insert Operation
			result = await helper.insertNote(note);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Room Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Room');
		}

	}

	void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
		// the detail page by pressing the FAB of NoteList page.
		if (note.id == null) {
			_showAlertDialog('Status', 'No ROOM was deleted');
			return;
		}

		// Case 2: User is trying to delete the old note that already has a valid ID.
		int result = await helper.deleteNote(note.id);
		if (result != 0) {
			_showAlertDialog('Status', 'Room Deleted Successfully');
		} else {
			_showAlertDialog('Status', 'Error Occured while Deleting Room');
		}
	}

	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}










