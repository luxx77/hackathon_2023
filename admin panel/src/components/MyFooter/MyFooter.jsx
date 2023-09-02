import React from 'react';
import {LANGUAGES} from "../../constants/index.js";
import MySelect from "../MySelect.jsx";

const MyFooter = (props) => {
    return (
        <footer className="bg-stone-100 text-sm sticky bottom-0">
            <div className="flex justify-between items-center p-2">
                <div className={`space-x-2`}>
                    by: byteTeam
                </div>
                <div className={`space-x-2`}>
                    <MySelect
                        id='languages'
                        title=''
                        size='sm'
                        search={false}
                        onChange={props.onChange}
                        defaultValue={props.defaultValue}
                        disabled={false}
                    >
                        {LANGUAGES.map(({ code, label }) => (
                            <option key={code} value={code}>
                                {label}
                            </option>
                        ))}
                    </MySelect>
                </div>
            </div>
        </footer>
    );
}

export default MyFooter;