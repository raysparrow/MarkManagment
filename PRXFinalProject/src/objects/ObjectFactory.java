//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2018.10.30 at 11:55:08 PM ICT 
//


package objects;

import java.math.BigInteger;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the objects package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _StudentName_QNAME = new QName("", "StudentName");
    private final static QName _StudentID_QNAME = new QName("", "StudentID");
    private final static QName _Password_QNAME = new QName("", "Password");
    private final static QName _StudentMail_QNAME = new QName("", "StudentMail");
    private final static QName _StudentPhone_QNAME = new QName("", "StudentPhone");
    private final static QName _StudentDOB_QNAME = new QName("", "StudentDOB");
    private final static QName _StudentSex_QNAME = new QName("", "StudentSex");
    private final static QName _StudentCourse_QNAME = new QName("", "StudentCourse");
    private final static QName _StudentGPA_QNAME = new QName("", "StudentGPA");
    private final static QName _ClassID_QNAME = new QName("", "ClassID");
    private final static QName _ClassName_QNAME = new QName("", "ClassName");
    private final static QName _CreateDate_QNAME = new QName("", "CreateDate");
    private final static QName _SubjectID_QNAME = new QName("", "SubjectID");
    private final static QName _ShortName_QNAME = new QName("", "ShortName");
    private final static QName _SubjectName_QNAME = new QName("", "SubjectName");
    private final static QName _Semester_QNAME = new QName("", "semester");
    private final static QName _NumberOfCredit_QNAME = new QName("", "NumberOfCredit");
    private final static QName _TeacherID_QNAME = new QName("", "TeacherID");
    private final static QName _TeacherName_QNAME = new QName("", "TeacherName");
    private final static QName _Phone_QNAME = new QName("", "Phone");
    private final static QName _Mail_QNAME = new QName("", "Mail");
    private final static QName _DOB_QNAME = new QName("", "DOB");
    private final static QName _Sex_QNAME = new QName("", "Sex");
    private final static QName _PT1_QNAME = new QName("", "PT1");
    private final static QName _PT2_QNAME = new QName("", "PT2");
    private final static QName _ASS1_QNAME = new QName("", "ASS1");
    private final static QName _Ass2_QNAME = new QName("", "Ass2");
    private final static QName _FinalExam_QNAME = new QName("", "FinalExam");
    private final static QName _TotalMark_QNAME = new QName("", "TotalMark");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: objects
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Infomation }
     * 
     */
    public Infomation createInfomation() {
        return new Infomation();
    }

    /**
     * Create an instance of {@link Students }
     * 
     */
    public Students createStudents() {
        return new Students();
    }

    /**
     * Create an instance of {@link Student }
     * 
     */
    public Student createStudent() {
        return new Student();
    }

    /**
     * Create an instance of {@link Classes }
     * 
     */
    public Classes createClasses() {
        return new Classes();
    }

    /**
     * Create an instance of {@link Class }
     * 
     */
    public Class createClass() {
        return new Class();
    }

    /**
     * Create an instance of {@link Subjects }
     * 
     */
    public Subjects createSubjects() {
        return new Subjects();
    }

    /**
     * Create an instance of {@link Subject }
     * 
     */
    public Subject createSubject() {
        return new Subject();
    }

    /**
     * Create an instance of {@link Teachers }
     * 
     */
    public Teachers createTeachers() {
        return new Teachers();
    }

    /**
     * Create an instance of {@link Teacher }
     * 
     */
    public Teacher createTeacher() {
        return new Teacher();
    }

    /**
     * Create an instance of {@link StudentSubjects }
     * 
     */
    public StudentSubjects createStudentSubjects() {
        return new StudentSubjects();
    }

    /**
     * Create an instance of {@link StudentSubject }
     * 
     */
    public StudentSubject createStudentSubject() {
        return new StudentSubject();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentName")
    public JAXBElement<String> createStudentName(String value) {
        return new JAXBElement<String>(_StudentName_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentID")
    public JAXBElement<String> createStudentID(String value) {
        return new JAXBElement<String>(_StudentID_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Password")
    public JAXBElement<String> createPassword(String value) {
        return new JAXBElement<String>(_Password_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentMail")
    public JAXBElement<String> createStudentMail(String value) {
        return new JAXBElement<String>(_StudentMail_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentPhone")
    public JAXBElement<String> createStudentPhone(String value) {
        return new JAXBElement<String>(_StudentPhone_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentDOB")
    public JAXBElement<String> createStudentDOB(String value) {
        return new JAXBElement<String>(_StudentDOB_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentSex")
    public JAXBElement<String> createStudentSex(String value) {
        return new JAXBElement<String>(_StudentSex_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentCourse")
    public JAXBElement<String> createStudentCourse(String value) {
        return new JAXBElement<String>(_StudentCourse_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "StudentGPA")
    public JAXBElement<Double> createStudentGPA(Double value) {
        return new JAXBElement<Double>(_StudentGPA_QNAME, Double.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BigInteger }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "ClassID")
    public JAXBElement<BigInteger> createClassID(BigInteger value) {
        return new JAXBElement<BigInteger>(_ClassID_QNAME, BigInteger.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "ClassName")
    public JAXBElement<String> createClassName(String value) {
        return new JAXBElement<String>(_ClassName_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "CreateDate")
    public JAXBElement<String> createCreateDate(String value) {
        return new JAXBElement<String>(_CreateDate_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BigInteger }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "SubjectID")
    public JAXBElement<BigInteger> createSubjectID(BigInteger value) {
        return new JAXBElement<BigInteger>(_SubjectID_QNAME, BigInteger.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "ShortName")
    public JAXBElement<String> createShortName(String value) {
        return new JAXBElement<String>(_ShortName_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "SubjectName")
    public JAXBElement<String> createSubjectName(String value) {
        return new JAXBElement<String>(_SubjectName_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "semester")
    public JAXBElement<String> createSemester(String value) {
        return new JAXBElement<String>(_Semester_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BigInteger }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "NumberOfCredit")
    public JAXBElement<BigInteger> createNumberOfCredit(BigInteger value) {
        return new JAXBElement<BigInteger>(_NumberOfCredit_QNAME, BigInteger.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "TeacherID")
    public JAXBElement<String> createTeacherID(String value) {
        return new JAXBElement<String>(_TeacherID_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "TeacherName")
    public JAXBElement<String> createTeacherName(String value) {
        return new JAXBElement<String>(_TeacherName_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Phone")
    public JAXBElement<String> createPhone(String value) {
        return new JAXBElement<String>(_Phone_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Mail")
    public JAXBElement<String> createMail(String value) {
        return new JAXBElement<String>(_Mail_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "DOB")
    public JAXBElement<String> createDOB(String value) {
        return new JAXBElement<String>(_DOB_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Sex")
    public JAXBElement<String> createSex(String value) {
        return new JAXBElement<String>(_Sex_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "PT1")
    public JAXBElement<Double> createPT1(Double value) {
        return new JAXBElement<Double>(_PT1_QNAME, Double.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "PT2")
    public JAXBElement<Double> createPT2(Double value) {
        return new JAXBElement<Double>(_PT2_QNAME, Double.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "ASS1")
    public JAXBElement<Double> createASS1(Double value) {
        return new JAXBElement<Double>(_ASS1_QNAME, Double.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Ass2")
    public JAXBElement<Double> createAss2(Double value) {
        return new JAXBElement<Double>(_Ass2_QNAME, Double.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "FinalExam")
    public JAXBElement<Double> createFinalExam(Double value) {
        return new JAXBElement<Double>(_FinalExam_QNAME, Double.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Double }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "TotalMark")
    public JAXBElement<Double> createTotalMark(Double value) {
        return new JAXBElement<Double>(_TotalMark_QNAME, Double.class, null, value);
    }

}