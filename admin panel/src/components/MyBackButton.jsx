import React from 'react';
import {Link} from "react-router-dom";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faAngleLeft} from "@fortawesome/free-solid-svg-icons";

const MyBackButton = (props) => {
    return (
        <button className={`w-9 h-9 bg-stone-100 hover:bg-stone-200 rounded-lg`} onClick={props.onClick}>
            <FontAwesomeIcon icon={faAngleLeft} />
        </button>
    );
}

export default MyBackButton;