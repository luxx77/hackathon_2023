import {configureStore} from "@reduxjs/toolkit";
import { eventsApi } from "./slices/eventsApi.js";
import { eventTypesApi } from "./slices/eventType.js";
import { SOSApi } from "./slices/sosSliceApi.js";

export default configureStore({
    reducer: {
        [eventsApi.reducerPath] : eventsApi.reducer,
        [eventTypesApi.reducerPath] : eventTypesApi.reducer,
        [SOSApi.reducerPath] : SOSApi.reducer,
    },
    middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat(eventsApi.middleware).concat(SOSApi.middleware).concat(eventTypesApi.middleware)
})