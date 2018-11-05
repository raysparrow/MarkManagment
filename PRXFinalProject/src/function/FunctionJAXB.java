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
	
	//get subject by shortName and semester
			public Subject getSubjectByName(String shortName, String semester, int classId) {
				List<Subject> subjects = getAllSubjects();
				Subject result = new Subject();
				for (int i = 0; i < subjects.size(); i++) {
					if (subjects.get(i).getShortName().equals(shortName) && subjects.get(i).getSemester().equals(semester) && subjects.get(i).getClassID() == classId) {
						result = subjects.get(i);
					}
				}
				return result;
			}
}
