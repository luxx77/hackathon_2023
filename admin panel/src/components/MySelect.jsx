import React, {useEffect} from 'react';
import {initTE, Select} from "tw-elements";

const MySelect = (props) => {
    useEffect(() => {
        initTE({ Select });
    }, []);

    return (
        <div>
            <label htmlFor={props.id}>{props.title} <span className={`${props.title ? '' : 'hidden'} text-red-500`}>*</span></label>
            <select
                id={props.id}
                data-te-select-init
                data-te-select-size={props.size}
                data-te-select-filter={props.search}
                defaultValue={props.defaultValue}
                disabled={props.disabled}
                onChange={props.onChange}
                data-theme="light"
            >
                {props.children}
            </select>
        </div>
    );
}

export default MySelect;