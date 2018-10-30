//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2018.10.30 at 11:55:08 PM ICT 
//


package objects;

import java.math.BigInteger;
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
 *         &lt;element ref="{}StudentID"/&gt;
 *         &lt;element ref="{}SubjectID"/&gt;
 *         &lt;element ref="{}PT1"/&gt;
 *         &lt;element ref="{}PT2"/&gt;
 *         &lt;element ref="{}ASS1"/&gt;
 *         &lt;element ref="{}Ass2"/&gt;
 *         &lt;element ref="{}FinalExam"/&gt;
 *         &lt;element ref="{}TotalMark"/&gt;
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
    "studentID",
    "subjectID",
    "pt1",
    "pt2",
    "ass1",
    "ass2",
    "finalExam",
    "totalMark"
})
@XmlRootElement(name = "StudentSubject")
public class StudentSubject {

    @XmlElement(name = "StudentID", required = true)
    protected String studentID;
    @XmlElement(name = "SubjectID", required = true)
    protected BigInteger subjectID;
    @XmlElement(name = "PT1")
    protected double pt1;
    @XmlElement(name = "PT2")
    protected double pt2;
    @XmlElement(name = "ASS1")
    protected double ass1;
    @XmlElement(name = "Ass2")
    protected double ass2;
    @XmlElement(name = "FinalExam")
    protected double finalExam;
    @XmlElement(name = "TotalMark")
    protected double totalMark;

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
     * Gets the value of the subjectID property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getSubjectID() {
        return subjectID;
    }

    /**
     * Sets the value of the subjectID property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setSubjectID(BigInteger value) {
        this.subjectID = value;
    }

    /**
     * Gets the value of the pt1 property.
     * 
     */
    public double getPT1() {
        return pt1;
    }

    /**
     * Sets the value of the pt1 property.
     * 
     */
    public void setPT1(double value) {
        this.pt1 = value;
    }

    /**
     * Gets the value of the pt2 property.
     * 
     */
    public double getPT2() {
        return pt2;
    }

    /**
     * Sets the value of the pt2 property.
     * 
     */
    public void setPT2(double value) {
        this.pt2 = value;
    }

    /**
     * Gets the value of the ass1 property.
     * 
     */
    public double getASS1() {
        return ass1;
    }

    /**
     * Sets the value of the ass1 property.
     * 
     */
    public void setASS1(double value) {
        this.ass1 = value;
    }

    /**
     * Gets the value of the ass2 property.
     * 
     */
    public double getAss2() {
        return ass2;
    }

    /**
     * Sets the value of the ass2 property.
     * 
     */
    public void setAss2(double value) {
        this.ass2 = value;
    }

    /**
     * Gets the value of the finalExam property.
     * 
     */
    public double getFinalExam() {
        return finalExam;
    }

    /**
     * Sets the value of the finalExam property.
     * 
     */
    public void setFinalExam(double value) {
        this.finalExam = value;
    }

    /**
     * Gets the value of the totalMark property.
     * 
     */
    public double getTotalMark() {
        return totalMark;
    }

    /**
     * Sets the value of the totalMark property.
     * 
     */
    public void setTotalMark(double value) {
        this.totalMark = value;
    }

}
