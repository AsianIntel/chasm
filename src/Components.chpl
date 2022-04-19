module Components {
    private use Properties;
    private use Map;

    class TendencyComponent {
        var input_properties: map(string, shared Properties);
        var tendency_properties: map(string, shared Properties);
        var diagnostic_properties: map(string, shared Properties);
        
        proc init(input_properties: map(string, shared Properties), tendency_properties: map(string, shared Properties), diagnostic_properties: map(string, shared Properties)) {
            this.input_properties = input_properties;
            this.tendency_properties = tendency_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }

    class DiagnosticComponent {
        var input_properties: map(string, shared Properties);
        var diagnostic_properties: map(string, shared Properties);
        
        proc init(input_properties: map(string, shared Properties), diagnostic_properties: map(string, shared Properties)) {
            this.input_properties = input_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }
}