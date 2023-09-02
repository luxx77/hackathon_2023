import { Map, Marker } from 'pigeon-maps';
import React, { useState } from 'react'
import CardItems from '../components/CardItems';
import MyHeader from '../components/MyHeader/MyHeader';
import {useGetEventsQuery} from "../store/slices/eventsApi";
import {useGetEventQuery} from "../store/slices/eventsApi";
import { useGetSOSDetailQuery, useGetSOSQuery } from '../store/slices/sosSliceApi';

function SOSMapPage() {
    const [selectSOS, setSelectSOS] = useState(1);
    const {data = []} = useGetSOSQuery();
    const {data: detail} = useGetSOSDetailQuery(selectSOS);
    const [items, setItems] =   useState([
        {col: 'col-span-3 md:col-span-6', name: 'ID', value: ""},
        {col: 'col-span-3 md:col-span-2', name: 'Injured', value: ""},
        {col: 'col-span-3 md:col-span-2', name: 'Text', value: ""},
        {col: 'col-span-3 md:col-span-2', name: 'Event', value: ""},
    ]);

    const onClickSOS = (id) => {
        setSelectSOS(id)
        setItems([
            {col: 'col-span-3 md:col-span-6', name: 'ID', value: detail.id},
            {col: 'col-span-3 md:col-span-2', name: 'Injured', value: detail.user},
            {col: 'col-span-3 md:col-span-2', name: 'Time', value: detail.created_at},
            {col: 'col-span-3 md:col-span-2', name: 'Location', value: detail.loaction},
        ])
    }

    return (
        <div>
            <MyHeader title='SOS Map' search={true} />
            <div className={`m-5 text-md`}>
                <div className={`flex items-center justify-center`}>
                    <Map 
                        defaultCenter={[37.8928622, 58.3687405]}
                        defaultZoom={11}
                        height={400}
                    >
                        {data.map((event) => {
                            let location = event.location.split(',')
                            let l = location.map(Number)

                            return( 
                                <Marker
                                    width={20}
                                    anchor={l}
                                    color={'#e31c0e'}
                                    onClick={() => onClickSOS(event.id)}
                                /> 
                            );
                        })}
                    </Map>
                </div>
                <CardItems items={items} />
            </div>
        </div>
    )
}

export {SOSMapPage};