class Scholarship {
  String id = '';
  String cgpa = '';
  String department = '';
  String document = '';
  String guardianName = '';
  String guardianContact = '';
  String semester = '';

  Scholarship(this.id, this.cgpa, this.department, this.document,
      this.guardianName, this.guardianContact, this.semester);

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getCgpa() {
    return cgpa;
  }

  void setCgpa(String cgpa) {
    this.cgpa = cgpa;
  }

  String getDepartment() {
    return department;
  }

  void setDepartment(String department) {
    this.department = department;
  }

  String getDocument() {
    return document;
  }

  void setDocument(String document) {
    this.document = document;
  }

  String getGuardianName() {
    return guardianName;
  }

  void setGuardianName(String guardianName) {
    this.guardianName = guardianName;
  }

  String getGuardianContact() {
    return guardianContact;
  }

  void setGuardianContact(String guardianContact) {
    this.guardianContact = guardianContact;
  }

  String getSemester() {
    return semester;
  }

  void setSemester(String semester) {
    this.semester = semester;
  }
}
