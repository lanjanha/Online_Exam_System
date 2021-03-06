package domain;

public class Configuration {
    private int id;
    private int period;
    private int rows;
    private int interval;
    private String lowerLimit;
    private String upperLimit;
    private int teacherAuthority;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getInterval() {
        return interval;
    }

    public void setInterval(int interval) {
        this.interval = interval;
    }

    public String getLowerLimit() {
        return lowerLimit;
    }

    public void setLowerLimit(String lowerLimit) {
        this.lowerLimit = lowerLimit;
    }

    public String getUpperLimit() {
        return upperLimit;
    }

    public void setUpperLimit(String upperLimit) {
        this.upperLimit = upperLimit;
    }

    public int getTeacherAuthority() {
        return teacherAuthority;
    }

    public void setTeacherAuthority(int teacherAuthority) {
        this.teacherAuthority = teacherAuthority;
    }

    @Override
    public String toString() {
        return "Configuration{" +
                "id=" + id +
                ", period=" + period +
                ", rows=" + rows +
                ", interval=" + interval +
                ", lowerLimit='" + lowerLimit + '\'' +
                ", upperLimit='" + upperLimit + '\'' +
                ", teacherAuthority=" + teacherAuthority +
                '}';
    }
}
