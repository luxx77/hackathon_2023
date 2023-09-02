import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faAngleLeft, faAngleRight} from "@fortawesome/free-solid-svg-icons";

const MyPaginate = () => {
    return (
        <div>
            <button className={`w-10 lg:w-10 h-10 lg:h-10 bg-slate-900 hover:bg-slate-800 rounded-tl-md`}>
                <FontAwesomeIcon icon={faAngleLeft} />
            </button>
            <button className={`w-10 lg:w-10 h-10 lg:h-10 bg-slate-800 hover:bg-slate-700`}>
                1
            </button>
            <button className={`w-10 lg:w-10 h-10 lg:h-10 bg-slate-800 hover:bg-slate-700`}>
                2
            </button>
            <button className={`w-10 lg:w-10 h-10 lg:h-10 bg-slate-700 hover:bg-slate-600`}>
                3
            </button>
            <button className={`w-10 lg:w-10 h-10 lg:h-10 bg-slate-900 hover:bg-slate-800 rounded-tr-md`}>
                <FontAwesomeIcon icon={faAngleRight} />
            </button>
        </div>
    );
}

export default MyPaginate;