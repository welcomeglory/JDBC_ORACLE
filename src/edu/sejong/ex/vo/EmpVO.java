package edu.sejong.ex.vo;
//이름     널?       유형           
//-------- -------- ------------ 
//EMPNO    NOT NULL NUMBER(4)    
//ENAME             VARCHAR2(10) 
//JOB               VARCHAR2(9)  
//MGR               NUMBER(4)    
//HIREDATE          DATE         
//SAL               NUMBER(7,2)  
//COMM              NUMBER(7,2)  
//DEPTNO            NUMBER(2) 
public class EmpVO {
	private int EMPNO;
	private String ENAME;
	private String JOB;
	private int MGR;
	private String HIREDATE;
	private int SAL;
	private int COMM;
	private int DEPTNO;
	
	public EmpVO() {
		
	}

	public EmpVO(int EMPNO, String ENAME, String JOB, int MGR, String HIREDATE, int SAL, int COMM, int DEPTNO) {
		this.EMPNO =EMPNO;
		this.ENAME =ENAME;
		this.JOB=JOB;
		this.MGR=MGR;
		this.HIREDATE=HIREDATE;
		this.SAL=SAL;
		this.COMM=COMM;
		this.DEPTNO=DEPTNO;
	}

	public int getEMPNO() {
		return EMPNO;
	}

	public void setEMPNO(int eMPNO) {
		EMPNO = eMPNO;
	}

	public String getENAME() {
		return ENAME;
	}

	public void setENAME(String eNAME) {
		ENAME = eNAME;
	}

	public String getJOB() {
		return JOB;
	}

	public void setJOB(String jOB) {
		JOB = jOB;
	}

	public int getMGR() {
		return MGR;
	}

	public void setMGR(int mGR) {
		MGR = mGR;
	}

	public String getHIREDATE() {
		return HIREDATE;
	}

	public void setHIREDATE(String hIREDATE) {
		HIREDATE = hIREDATE;
	}

	public int getSAL() {
		return SAL;
	}

	public void setSAL(int sAL) {
		SAL = sAL;
	}

	public int getCOMM() {
		return COMM;
	}

	public void setCOMM(int cOMM) {
		COMM = cOMM;
	}

	public int getDEPTNO() {
		return DEPTNO;
	}

	public void setDEPTNO(int dEPTNO) {
		DEPTNO = dEPTNO;
	}

}
