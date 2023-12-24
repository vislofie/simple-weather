struct WeatherParameterModel
{
	let parameterName: String
	let parameterValue: String
	let additionalValue: String
	let parameterUnit: String
	
	init(name: String, value: String, additionalValue: String, unit: String)
	{
		self.parameterName = name
		self.parameterValue = value
		self.additionalValue = additionalValue == "" ? additionalValue : additionalValue + " "
		self.parameterUnit = unit
	}
	
	init()
	{
		self.parameterName = "NON"
		self.parameterValue = "NON"
		self.additionalValue = ""
		self.parameterUnit = "NON"
	}
}
