public class FoodService {
    @Auraenabled
	public static FoodData getFoodNutrition(string foodName)
    {
        BaseCallout callout=new BaseCallout();
	
        callout.endPointurl='https://api.spoonacular.com/recipes/guessNutrition?'+'apiKey=50b55b2fbaff4aff89fa0995de37adc4'+'&title='+foodName;
        callout.setCalloutHeaders=false;
        HttpResponse response=callout.callExternalAPI('');
        FoodData data=FoodData.parse(response.getBody());
        return data;
    }
}