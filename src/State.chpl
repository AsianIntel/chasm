module State {
    use DataArray;
    use Map;

    /* A container holding a map of ``DataArray`` indicating the various properties of the state model. */
    class State {
        /* An int value indicating the timestep of the state. */
        var time: int;

        /* The map containing the ``DataArray`` with a string as the key. */
        var data_map: map(string, shared AbstractDataArray);

        /* Method to add a ``(string, DataArray)`` pair to the state. */
        proc add(property: string, array: shared DataArray) {
            this.data_map.add(property, array);
        }

        /* Method to get the `DataArray` associated with the given property */
        proc getValue(property: string) {
            return this.data_map.getValue(property);
        }
    }
}