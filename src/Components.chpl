module Components {
    private use Properties;
    private use Map;
    private use State;

    class AbstractComponent {}

    class TendencyComponent: AbstractComponent {
        var input_properties: map(string, shared AbstractProperties);
        var tendency_properties: map(string, shared AbstractProperties);
        var diagnostic_properties: map(string, shared AbstractProperties);
        
        proc init(input_properties: map(string, shared AbstractProperties), tendency_properties: map(string, shared AbstractProperties), diagnostic_properties: map(string, shared AbstractProperties)) {
            this.input_properties = input_properties;
            this.tendency_properties = tendency_properties;
            this.diagnostic_properties = diagnostic_properties;
        }

        proc array_call(state: State) {
            halt("Tendency Component does not auto implement array_call");
        }       
    }

    class DiagnosticComponent: AbstractComponent {
        var input_properties: map(string, shared AbstractProperties);
        var diagnostic_properties: map(string, shared AbstractProperties);
        
        proc init(input_properties: map(string, shared AbstractProperties), diagnostic_properties: map(string, shared AbstractProperties)) {
            this.input_properties = input_properties;
            this.diagnostic_properties = diagnostic_properties;
        }       
    }

    class ImplicitTendencyComponent: AbstractComponent {
        var input_properties: map(string, shared AbstractProperties);
        var tendency_properties: map(string, shared AbstractProperties);
        var diagnostic_properties: map(string, shared AbstractProperties);
        
        proc init(input_properties: map(string, shared AbstractProperties), tendency_properties: map(string, shared AbstractProperties), diagnostic_properties: map(string, shared AbstractProperties)) {
            this.input_properties = input_properties;
            this.tendency_properties = tendency_properties;
            this.diagnostic_properties = diagnostic_properties;
        }

        proc array_call(state: State, timestep: real) {
            halt("Implicit Tendency Component does not auto implement array_call");
        }
    }
}