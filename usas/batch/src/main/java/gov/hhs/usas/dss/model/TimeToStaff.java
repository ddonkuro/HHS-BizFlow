package gov.hhs.usas.dss.model;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:report.properties")
public class TimeToStaff extends Report {
	
	@Value("${staff.search.path}") private String searchPath;
	@Value("${staff.intg.type}") private String intgType;
	@Value("${staff.file.name}") private String fileName;
	@Value("${staff.parm.num}") private int parmNum;
	@Value("${staff.rvp.name}") private String rvpName;
	@Value("${staff.rpt.iteration}") private int rptIteration; 
	@Value("${staff.date.increment}") private int dateIncrement;
	@Value("${staff.end.date}") private String endDate;
	@Value("${staff.truncate}") private String spTruncate;
	@Value("${staff.run.report}") private boolean runReport;

	public TimeToStaff() {

	}
	
	@PostConstruct
	public void construct() {
		super.setSearchPath(searchPath);
		super.setIntgType(intgType);
		super.setFileName(fileName);
		super.setParmNum(parmNum);
		super.setRvpName(rvpName);
		super.setRptIteration(rptIteration);
		super.setDateIncrement(dateIncrement);
		super.setEndDate(endDate);
		super.setSpTruncate(spTruncate);
		super.setRunReport(runReport);
	}
	
}
