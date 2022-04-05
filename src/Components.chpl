module Components {
    private use Properties;
    private use Map;

    class TendencyComponent {
        var input_properties: map(string, Properties);
        var tendency_properties: map(string, Properties);
        var diagnostic_properties: map(string, Properties);
        
        proc init(input_properties: map(string, Properties), tendency_properties: map(string, Properties), diagnostic_properties: map(string, Properties)) {
            this.input_properties = input_properties;
            this.tendency_properties = tendency_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }

    class DiagnosticComponent {
        var input_properties: map(string, Properties);
        var diagnostic_properties: map(string, Properties);
        
        proc init(input_properties: map(string, Properties), diagnostic_properties: map(string, Properties)) {
            this.input_properties = input_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }
}