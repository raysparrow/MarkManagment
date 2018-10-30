//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2018.10.30 at 11:55:08 PM ICT 
//


package objects;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element ref="{}StudentName"/&gt;
 *         &lt;element ref="{}StudentID"/&gt;
 *         &lt;element ref="{}Password"/&gt;
 *         &lt;element ref="{}StudentMail"/&gt;
 *         &lt;element ref="{}StudentPhone"/&gt;
 *         &lt;element ref="{}StudentDOB"/&gt;
 *         &lt;element ref="{}StudentSex"/&gt;
 *         &lt;element ref="{}StudentCourse"/&gt;
 *         &lt;element ref="{}StudentGPA"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "studentName",
    "studentID",
    "password",
    "studentMail",
    "studentPhone",
    "studentDOB",
    "studentSex",
    "studentCourse",
    "studentGPA"
})
@XmlRootElement(name = "Student")
public class Student {

    @XmlElement(name = "StudentName", required = true)
    protected String studentName;
    @XmlElement(name = "StudentID", required = true)
    protected String studentID;
    @XmlElement(name = "Password", required = true)
    protected String password;
    @XmlElement(name = "StudentMail", required = true)
    protected String studentMail;
    @XmlElement(name = "StudentPhone", required = true)
    protected String studentPhone;
    @XmlElement(name = "StudentDOB", required = true)
    protected String studentDOB;
    @XmlElement(name = "StudentSex", required = true)
    protected String studentSex;
    @XmlElement(name = "StudentCourse", required = true)
    protected String studentCourse;
    @XmlElement(name = "StudentGPA")
    protected double studentGPA;

    /**
     * Gets the value of the studentName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentName() {
        return studentName;
    }

    /**
     * Sets the value of the studentName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentName(String value) {
        this.studentName = value;
    }

    /**
     * Gets the value of the studentID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentID() {
        return studentID;
    }

    /**
     * Sets the value of the studentID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentID(String value) {
        this.studentID = value;
    }

    /**
     * Gets the value of the password property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the value of the password property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPassword(String value) {
        this.password = value;
    }

    /**
     * Gets the value of the studentMail property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentMail() {
        return studentMail;
    }

    /**
     * Sets the value of the studentMail property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentMail(String value) {
        this.studentMail = value;
    }

    /**
     * Gets the value of the studentPhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentPhone() {
        return studentPhone;
    }

    /**
     * Sets the value of the studentPhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentPhone(String value) {
        this.studentPhone = value;
    }

    /**
     * Gets the value of the studentDOB property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentDOB() {
        return studentDOB;
    }

    /**
     * Sets the value of the studentDOB property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentDOB(String value) {
        this.studentDOB = value;
    }

    /**
     * Gets the value of the studentSex property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentSex() {
        return studentSex;
    }

    /**
     * Sets the value of the studentSex property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentSex(String value) {
        this.studentSex = value;
    }

    /**
     * Gets the value of the studentCourse property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStudentCourse() {
        return studentCourse;
    }

    /**
     * Sets the value of the studentCourse property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStudentCourse(String value) {
        this.studentCourse = value;
    }

    /**
     * Gets the value of the studentGPA property.
     * 
     */
    public double getStudentGPA() {
        return studentGPA;
    }

    /**
     * Sets the value of the studentGPA property.
     * 
     */
    public void setStudentGPA(double value) {
        this.studentGPA = value;
    }

}