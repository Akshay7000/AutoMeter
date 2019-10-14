
class Note {

	int _id;
	String _title;
	String _description;
	String _date;
	int _priority;
	String _phone;

	Note(this._title, this._date, this._priority, this._phone, [this._description]);

	Note.withId(this._id, this._title, this._date, this._priority, this._phone, [this._description]);

	int get id => _id;

	String get title => _title;

	String get description => _description;

	int get priority => _priority;

	String get date => _date;

	String get phone => _phone;

	set title(String newTitle) {
		if (newTitle.length <= 255) {
			this._title = newTitle;
		}
	}

	set description(String newDescription) {
		if (newDescription.length <= 255) {
			this._description = newDescription;
		}
	}

	set date(String newDate) {
		this._date = newDate;
	}

	set phone(String newPhone) {
		this._phone = newPhone;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['description'] = _description;
		map['priority'] = _priority;
		map['date'] = _date;
		map['phone'] = _phone;
		return map;
	}

	// Extract a Note object from a Map object
	Note.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._description = map['description'];
		this._date = map['date'];
		this._phone = map['phone'];
	}
}









