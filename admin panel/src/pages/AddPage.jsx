import { Map, Marker } from "pigeon-maps"
import { useState } from "react"
import MyHeader from "../components/MyHeader/MyHeader"
import MySelect from "../components/MySelect";
import MyTeaxtarea from "../components/MyTeaxtarea";
import { useGetEventTypesQuery } from "../store/slices/eventType";

const AddPage = () => {
    const [eventTypeId, setEventTypeId] = useState()
    const [text, setText] = useState()
    const {data = []} = useGetEventTypesQuery();
    const [center, setCenter] = useState()

    // const initialForm = {
    //     location: '',
    //     text: '',
    //     event_type: '',
    // }
    
    // const [formValues, setFormValues] = useState(initialForm);
    
    // //===================== Add =====================\\
    
    // const [addEventType, {}] = useAddEventsMutation();

    // const handleAddEventType = async () => {
    //     await addEventType(formValues).unwrap();
    //     setFormValues(initialForm);
    // }

    // //================================================\\

    return(
        <div>
            <MyHeader title='Add Events' search={true} />
            <div className={`m-5 text-md space-y-4`}>
                <div className={`flex items-center justify-center`}>
                    <Map 
                        defaultCenter={[37.8928622, 58.3687405]}
                        defaultZoom={11}
                        height={400}
                        onClick={({ latLng }) => { 
                            setCenter(latLng)}} 
                    >
                        <Marker
                            width={20}
                            anchor={center}
                            color={'#e31c0e'}
                        />
                    </Map>
                </div>
                <div>
                    <MySelect
                        id='event_type'
                        title='Event Type'
                        size='lg'
                        search={true}
                        disabled={false}
                        onChange={(event) => setEventTypeId(event.target.value)}
                    >
                        {data.map((category) => (
                            <option key={category.id} value={category.id} >{category.title}</option>
                        ))}
                    </MySelect>
                    <MyTeaxtarea id='Text' title='text' onChange={(event) => setText(event.target.value)} />
                </div>
            </div>
        </div>
    )
}
export {AddPage};