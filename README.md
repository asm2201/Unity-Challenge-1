# Unity-Unit Converter
A unit converter app made using swiftUI. 

## Variables Used:
1. input: User enters the value to be converted
2. result: Stores and displays the result computed using getter function which uses the Measurement library of Apple.
3. inputUnit: Stores the unit to be converted from
4. outputUnit: Stores the unit to be converted to
5. selectedType: An integer corresponding to the category such as Temp, Length, Volume, Time
6. conversionTypes: an array to store the types - ["Length", "Temperature", "Volume", "Time"]
7. UnitsOfMeasurement: a 2D array of type 'Dimension' which uses getter function to store units of measurement for length, temp, etc

## Flow Of Program Explained:
1. We have created a navigation stack and declared a form within it.
2. The form has a TextField for providing value to 'input' var
3. The form has two Picker elements whose views are generated using 'unitPicker' function.
4. unitPicker has two parameters -> Title (String) and selectedUnit (returns value to inputUnit/outputUnit using Double Binding on Dimension)
5. The conversion is carried out using in-built Apple converter which can read using documentation. The statements for calculation are  carefully declared in getter function of result.
6. What does formatted do -> get the most relevant string representation over that data type
7. One can select the category to be measured using 'picker wheel' whose value is sent to selectedType.
8. Based on selectedType, the units of measurement are displayed in picker navigation sheet.
