public class FoodData {
    public class ConfidenceRange {
        @auraenabled
     public Double min;
        @auraenabled
     public Double max;
 }
 @auraenabled
 public Integer recipesUsed;
 @auraenabled
 public Calories calories;
 @auraenabled
 public Calories fat;
 @auraenabled
 public Calories protein;
 @auraenabled
 public Calories carbs;

 public class Calories {
     @auraenabled
     public Double value;
     @auraenabled
     public String unit;
     @auraenabled
     public ConfidenceRange confidenceRange95Percent;
     @auraenabled
     public Double standardDeviation;
 }
 public static FoodData parse(String json){
     return (FoodData) System.JSON.deserialize(json, FoodData.class);
 }
}