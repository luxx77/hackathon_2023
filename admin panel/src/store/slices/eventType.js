import {createApi, fetchBaseQuery} from "@reduxjs/toolkit/query/react";
import { api } from "../../constants/api";

export const eventTypesApi = createApi({
    reducerPath: 'eventTypesApi',
    mode: "no-cors",
    baseQuery: fetchBaseQuery({
        baseUrl: `${api}`,
        mode: "cors"
    }),
    endpoints: (build) => ({
        getEventTypes: build.query({
            query: () => 'news/'
        })
    })
});

export const {useGetEventTypesQuery} = eventTypesApi;