package ssm.domain;

public class Paper {
    private String id;
    private String title;
    private String authors;
    private String pc_name;
    private String year;
    private String category;
    private String inclusion;
    private String impact;
    private String sci;
    private String volume;
    private String issue;
    private String page;
    private String firstAuthor;
    private String corAuthor;
    private String rank;
    private String paperFile;

    public String getPaperFile() {
        return paperFile;
    }

    public void setPaperFile(String paperFile) {
        this.paperFile = paperFile;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", authors='" + authors + '\'' +
                ", pc_name='" + pc_name + '\'' +
                ", year='" + year + '\'' +
                ", category='" + category + '\'' +
                ", inclusion='" + inclusion + '\'' +
                ", impact='" + impact + '\'' +
                ", sci='" + sci + '\'' +
                ", volume='" + volume + '\'' +
                ", issue='" + issue + '\'' +
                ", page='" + page + '\'' +
                ", firstAuthor='" + firstAuthor + '\'' +
                ", corAuthor='" + corAuthor + '\'' +
                ", rank='" + rank + '\'' +
                '}';
    }

    public String getCorAuthor() {
        return corAuthor;
    }

    public void setCorAuthor(String corAuthor) {
        this.corAuthor = corAuthor;
    }

    public String getFirstAuthor() {
        return firstAuthor;
    }

    public void setFirstAuthor(String firstAuthor) {
        this.firstAuthor = firstAuthor;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public String getPc_name() {
        return pc_name;
    }

    public void setPc_name(String pc_name) {
        this.pc_name = pc_name;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }



    public String getInclusion() {
        return inclusion;
    }

    public void setInclusion(String inclusion) {
        this.inclusion = inclusion;
    }

    public String getImpact() {
        return impact;
    }

    public void setImpact(String impact) {
        this.impact = impact;
    }

    public String getSci() {
        return sci;
    }

    public void setSci(String sci) {
        this.sci = sci;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }
}
