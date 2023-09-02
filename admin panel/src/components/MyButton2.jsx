import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";

const MyButton2 = (props) => {
    return (
        <button className={`flex items-center justify-center w-8 h-8 lg:w-8 lg:h-8 ${props.btnColor} hover:${props.btnColorOnHover} rounded-md hover:scale-105 duration-100`}>
            <FontAwesomeIcon icon={props.icon} size="sm"/>
        </button>
    );
}

export default MyButton2;