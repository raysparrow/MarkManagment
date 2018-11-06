package function;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import objects.*;
import objects.Class;

public class FunctionJAXB {
	Infomation infomation = null;

	public FunctionJAXB() {
		// TODO Auto-generated constructor stub
		try {
			String path = this.getClass().getClassLoader().getResource("")
					.getPath();
			String fullPath = URLDecoder.decode(path, "UTF-8");
			String pathArr[] = fullPath.split("/WEB-INF/classes/");
			fullPath = pathArr[0] + File.separator + "data" + File.separator
					+ "Info.xml";
			File file = new File(fullPath);
			JAXBContext jaxbContext = JAXBContext.newInstance(Infomation.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			this.infomation = (Infomation) jaxbUnmarshaller.unmarshal(file);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// Get all Students
	public List<Student> getAllStudents() {
		Students students = this.infomation.getStudents();
		return students.getStudent();
	}

	// Get Student by id
	public Student getStudentByID(String studentId) {
		List<Student> listStudent = getAllStudents();
		for (int i = 0; i < listStudent.size(); i++) {
			if (listStudent.get(i).getStudentID().equals(studentId)) {
				return listStudent.get(i);
			}
		}
		return null;
	}

	// get all subjects
	public List<Subject> getAllSubjects() {
		Subjects subjects = this.infomation.getSubjects();
		return subjects.getSubject();
	}

	// get all Student-Subject relationship
	public List<StudentSubject> getAllStudentSubjects() {
		StudentSubjects studentSubjects = this.infomation.getStudentSubjects();
		return studentSubjects.getStudentSubject();
	}

	// get student-subject by studentID
	public List<StudentSubject> getStudentSubjectsByStudentId(String studentId) {
		List<StudentSubject> allStudentSubjects = getAllStudentSubjects();
		List<StudentSubject> result = new ArrayList<StudentSubject>();
		for (int i = 0; i < allStudentSubjects.size(); i++) {
			if (allStudentSubjects.get(i).getStudentID().equals(studentId)) {
				result.add(allStudentSubjects.get(i));
			}
		}
		return result;
	}

	// get student-subject by subjectID
	public List<StudentSubject> getStudentSubjectsBySubjectId(int subjectId) {
		List<StudentSubject> allStudentSubjects = getAllStudentSubjects();
		List<StudentSubject> result = new ArrayList<StudentSubject>();
		for (int i = 0; i < allStudentSubjects.size(); i++) {
			if (allStudentSubjects.get(i).getSubjectID() == subjectId) {
				result.add(allStudentSubjects.get(i));
			}
		}
		return result;
	}

	// get Subject by subjectID
	public Subject getSubjectById(int subjectId) {
		List<Subject> subjects = getAllSubjects();
		Subject result = new Subject();
		for (int i = 0; i < subjects.size(); i++) {
			if (subjects.get(i).getSubjectID() == subjectId) {
				result = subjects.get(i);
			}
		}
		return result;
	}

	// get All Teachers
	public List<Teacher> getAllTeachers() {
		Teachers teachers = infomation.getTeachers();
		return teachers.getTeacher();
	}

	// get Teacher by ID
	public Teacher getTeacherById(String teacherId) {
		List<Teacher> listTeacher = getAllTeachers();
		for (int i = 0; i < listTeacher.size(); i++) {
			if (listTeacher.get(i).getTeacherID().equals(teacherId)) {
				return listTeacher.get(i);
			}
		}
		return null;
	}

	// get All Class
	public List<Class> getAllClass() {
		Classes classes = this.infomation.getClasses();
		return classes.getClazz();
	}

	// get Class by classId
	public Class getClassById(int classId) {
		List<Class> listClass = getAllClass();
		for (int i = 0; i < listClass.size(); i++) {
			if (listClass.get(i).getClassID() == classId) {
				return listClass.get(i);
			}
		}
		return null;
	}

	// Get Classes by teacherId
	public List<Class> getClassByTeacherId(String teacherId) {
		List<Subject> listSubject = getAllSubjects();
		List<Class> listClass = null;
		for (int i = 0; i < listSubject.size(); i++) {
			if (listSubject.get(i).getTeacherID().equals(teacherId)) {
				Class clazz = getClassById(listSubject.get(i).getClassID());
				listClass.add(clazz);
			}
		}
		return listClass;
	}

	// get subject by classID
	public List<Subject> getSubjectByClassId(int classId) {
		List<Subject> allSubject = getAllSubjects();
		List<Subject> result = new ArrayList<Subject>();
		for (int i = 0; i < allSubject.size(); i++) {
			if (allSubject.get(i).getClassID() == classId) {
				result.add(allSubject.get(i));
			}
		}
		return result;
	}

	// get subject by teacherID
	public List<Subject> getSubjectByTeacherId(String teacherId) {
		List<Subject> allSubject = getAllSubjects();
		List<Subject> result = new ArrayList<Subject>();
		for (int i = 0; i < allSubject.size(); i++) {
			if (allSubject.get(i).getTeacherID().equals(teacherId)) {
				result.add(allSubject.get(i));
			}
		}
		return result;
	}

	// Get Student by subjectId
	public List<Student> getStudentBySubjectId(int subjectId) {
		List<Student> result = new ArrayList<Student>();
		List<StudentSubject> lisStudentSubjects = getStudentSubjectsBySubjectId(subjectId);
		for (int i = 0; i < lisStudentSubjects.size(); i++) {
			Student student = getStudentByID(lisStudentSubjects.get(i)
					.getStudentID());
			result.add(student);
		}
		return result;

	}

	// Group subject by shortName and teacherId
	public List<Subject> groupSubjectByShortNameTeacherId(String shortName,
			String teacherId) {
		List<Subject> listSubject = getSubjectByTeacherId(teacherId);
		List<Subject> result = new ArrayList<Subject>();
		for (int i = 0; i < listSubject.size(); i++) {
			if (listSubject.get(i).getShortName().equals(shortName)) {
				result.add(listSubject.get(i));
			}
		}
		return result;
	}

	// get classes by subject's shortName and teacherId
	public List<Class> groupClassByShortName(String shortName, String teacherId) {
		List<Subject> listSubject = groupSubjectByShortNameTeacherId(shortName,
				teacherId);
		List<Class> result = new ArrayList<Class>();
		for (int i = 0; i < listSubject.size(); i++) {
			Class clazz = getClassById(listSubject.get(i).getClassID());
			result.add(clazz);
		}
		return result;
	}

	// Get list short name from list subject
	public List<String> getListShortName(List<Subject> listSubject) {
		List<String> result = new ArrayList<String>();
		if (listSubject != null) {
			result.add(listSubject.get(0).getShortName());
			for (int i = 0; i < listSubject.size(); i++) {
				boolean check = true;
				for (int j = 0; j < result.size(); j++) {
					if (listSubject.get(i).getShortName()
							.equals(result.get(j).toString())) {
						check = false;
					}
				}
				if (check == true) {
					result.add(listSubject.get(i).getShortName());
				}
			}
		}
		return result;
	}

	// Get Student by Student Email
	public Student getStudentByEmail(String studentMail) {
		List<Student> listStudent = getAllStudents();
		for (int i = 0; i < listStudent.size(); i++) {
			if (listStudent.get(i).getStudentMail().equals(studentMail)) {
				return listStudent.get(i);
			}
		}
		return null;
	}

	// Get teacher by teacher Email
	// Khanh chi them duy nhat Function nay
	public Teacher getTeacherByEmail(String teacherMail) {
		List<Teacher> listTeacher = getAllTeachers();
		for (int i = 0; i < listTeacher.size(); i++) {
			if (listTeacher.get(i).getMail().equals(teacherMail)) {
				return listTeacher.get(i);
			}
		}
		return null;
	}

	// get subject by shortName and semester
	public Subject getSubjectByName(String shortName, String semester,
			int classId) {
		List<Subject> subjects = getAllSubjects();
		Subject result = new Subject();
		for (int i = 0; i < subjects.size(); i++) {
			if (subjects.get(i).getShortName().equals(shortName)
					&& subjects.get(i).getSemester().equals(semester)
					&& subjects.get(i).getClassID() == classId) {
				result = subjects.get(i);
			}
		}
		return result;
	}
	
	//get list semester by teacherId
	public List<String> getSemestersByTeacherId(String teacherId){
		List<Subject> subjects = getSubjectByTeacherId(teacherId);
		List<String> semesters = new ArrayList<String>();
		for(int i=0;i<subjects.size();i++){
			boolean check = false;
			if(semesters.size()==0){
				semesters.add(subjects.get(i).getSemester());
			}else{
				for(int j = 0 ; j< semesters.size();j++){
					if(semesters.get(j).equals(subjects.get(i).getSemester())){
						check = true;
						break;
					}
				}
				if(check==false){
					semesters.add(subjects.get(i).getSemester());
				}
			}
		}
		return semesters;
	}
	
	// edit Mark
	public void editMark(String type, String studentId, int subjectId,
			double markEdit) throws Exception {
		try {
			JAXBContext jc = JAXBContext.newInstance(Infomation.class);

			String path = this.getClass().getClassLoader().getResource("")
					.getPath();
			String fullPath = URLDecoder.decode(path, "UTF-8");
			String pathArr[] = fullPath.split("/WEB-INF/classes/");
			fullPath = pathArr[0] + File.separator + "data" + File.separator
					+ "Info.xml";
			File file = new File(fullPath);

			Infomation infomation = (Infomation) jc.createUnmarshaller()
					.unmarshal(file);
			StudentSubjects studentSubjects = infomation.getStudentSubjects();
			Students students = infomation.getStudents();
			List<StudentSubject> studentSubject = studentSubjects
					.getStudentSubject();
			List<Student> studentList = students
					.getStudent();
			for (int i = 0; i < studentSubject.size(); i++) {
				if (studentSubject.get(i).getStudentID().equals(studentId)
						&& studentSubject.get(i).getSubjectID() == subjectId) {
					Student student = getStudentByID(studentSubject.get(i).getStudentID());
					if (type.equals("pt1")) {
						studentSubject.get(i).setPT1(markEdit);
						studentSubject.get(i).setTotalMark(caculaterTotalMark(studentSubject.get(i)));
						student.setStudentGPA(caculaterGPA(studentSubject.get(i)));
						studentList = editStudent(studentList, student);
						System.out.println(student.getStudentGPA());
						
					} else if (type.equals("pt2")) {
						studentSubject.get(i).setPT2(markEdit);
						studentSubject.get(i).setTotalMark(caculaterTotalMark(studentSubject.get(i)));
						student.setStudentGPA(caculaterGPA(studentSubject.get(i)));
						System.out.println(student.getStudentGPA());
					} else if (type.equals("ass1")) {
						studentSubject.get(i).setASS1(markEdit);
						studentSubject.get(i).setTotalMark(caculaterTotalMark(studentSubject.get(i)));
						student.setStudentGPA(caculaterGPA(studentSubject.get(i)));
						System.out.println(student.getStudentGPA());
					} else {
						studentSubject.get(i).setAss2(markEdit);
						studentSubject.get(i).setTotalMark(caculaterTotalMark(studentSubject.get(i)));
						student.setStudentGPA(caculaterGPA(studentSubject.get(i)));
						System.out.println(student.getStudentGPA());
					}
				}
			}

			Marshaller m = jc.createMarshaller();
			m.marshal(infomation, file);
		} catch (Exception e) {

		}
	}
		
	//get list subjects by semester and teacherId
	public List<Subject> getSubjectsBySemesterAndTeacherId(String semester, String teacherId){
		List<Subject> subjects = getSubjectByTeacherId(teacherId);
		List<Subject> result = new ArrayList<Subject>();
		for(int i = 0; i<subjects.size();i++){
			if(subjects.get(i).getSemester().equals(semester)){
				result.add(subjects.get(i));
			}
		}
		return result;
	}
	
	// Caculater TotalMark Again
	public double caculaterTotalMark(StudentSubject studentSub){
		double totalMark = 0;
		if(studentSub.toString() != null){
			double avgAss = studentSub.getASS1()* 0.15 + studentSub.getAss2()* 0.15;
			double avgPt = studentSub.getPT1()* 0.15 + studentSub.getPT2()* 0.15;
			totalMark = avgAss + avgPt + studentSub.getFinalExam()* 0.4;
			return totalMark;
		}
		return 0;
	}
	
	//Caculater GPA again
	public double caculaterGPA(StudentSubject studentSub){
		double GPA = 0;
		double total = 0;
		if(studentSub.toString() != null){
			List<StudentSubject> studentSubList = getStudentSubjectsByStudentId(studentSub.getStudentID());
			int count = 0;
			for(StudentSubject list : studentSubList){
				Subject subject = getSubjectById(list.getSubjectID());
				if(list.getStudentID().equals(studentSub.getStudentID())
						&& list.getSubjectID() == studentSub.getSubjectID()){
					total += subject.getNumberOfCredit() * studentSub.getTotalMark();
				}else{
					total += subject.getNumberOfCredit() * list.getTotalMark();
				}
				count+=subject.getNumberOfCredit();
			}
			GPA = total/count;
			System.out.println(GPA);
			return GPA;
		}
		return 0;
	}
	//Edit GPA in Student When Change GPA
	public List<Student> editStudent(List<Student> listStudent, Student student){
		for(Student list : listStudent){
			if(list.getStudentID().equals(student.getStudentID())){
				list = student;
				break;
			}
		}
		return listStudent;
	}
}
