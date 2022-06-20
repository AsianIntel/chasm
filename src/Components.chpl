module Components {
    private use Properties;
    private use Map;

    class TendencyComponent {
        var input_properties: map(string, shared AbstractProperties);
        var tendency_properties: map(string, shared AbstractProperties);
        var diagnostic_properties: map(string, shared AbstractProperties);
        
        proc init(input_properties: map(string, shared AbstractProperties), tendency_properties: map(string, shared AbstractProperties), diagnostic_properties: map(string, shared AbstractProperties)) {
            this.input_properties = input_properties;
            this.tendency_properties = tendency_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }

    class DiagnosticComponent {
        var input_properties: map(string, shared AbstractProperties);
        var diagnostic_properties: map(string, shared AbstractProperties);
        
        proc init(input_properties: map(string, shared AbstractProperties), diagnostic_properties: map(string, shared AbstractProperties)) {
            this.input_properties = input_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }
}