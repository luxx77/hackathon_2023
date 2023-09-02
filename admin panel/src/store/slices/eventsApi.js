import {createApi, fetchBaseQuery} from "@reduxjs/toolkit/query/react";
import { api } from "../../constants/api";

export const eventsApi = createApi({
    reducerPath: 'eventsApi',
    mode: "no-cors",
    baseQuery: fetchBaseQuery({
        baseUrl: `${api}`,
        mode: "cors"
    }),
    endpoints: (build) => ({
        getEvents: build.query({
            query: () => 'event/list/'
        }),
        getEvent: build.query({
            query: postId => `event/detail/${postId}`,
        }),
        addEvents: build.mutation({
            query: (body) => ({
                url: 'event',
                method: 'POST',
                body
            })
        })
    })
});

export const {useGetEventsQuery, useGetEventQuery, useAddEventsMutation} = eventsApi;