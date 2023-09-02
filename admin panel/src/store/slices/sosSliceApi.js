import {createApi, fetchBaseQuery} from "@reduxjs/toolkit/query/react";
import { api } from "../../constants/api";

export const SOSApi = createApi({
    reducerPath: 'SOSApi',
    mode: "no-cors",
    baseQuery: fetchBaseQuery({
        baseUrl: `${api}`,
        mode: "cors"
    }),
    endpoints: (build) => ({
        getSOS: build.query({
            query: () => 'sos/'
        }),
        getSOSDetail: build.query({
            query: postId => `sos/${postId}`,
        }),
        // addEvents: build.mutation({
        //     query: (body) => ({
        //         url: 'events',
        //         method: 'POST',
        //         body
        //     })
        // })
    })
});

export const {useGetSOSQuery, useGetSOSDetailQuery} = SOSApi;