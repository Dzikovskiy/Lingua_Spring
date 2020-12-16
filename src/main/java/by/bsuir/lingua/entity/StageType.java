package by.bsuir.lingua.entity;


public enum StageType {
    ACQUAINTED("acquainted"), TESTED("tested"), MATCHED("matched");
    private final String stage;

    StageType(String stage) {
        this.stage = stage;
    }

    public String getStage() {
        return stage;
    }
}
