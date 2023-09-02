import React from 'react';
import {Link} from "react-router-dom";

const MyAddButton = (props) => {
    return (
        <Link to={props.addLink}>
            <button className={`px-4 lg:px-5 h-10 lg:h-10 text-md lg:text-lg bg-slate-900 hover:bg-slate-800 rounded-md rounded-b-none`}>
                Add
            </button>
        </Link>
    );
}

export default MyAddButton;