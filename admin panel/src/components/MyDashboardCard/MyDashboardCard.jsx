import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faAngleRight} from "@fortawesome/free-solid-svg-icons";
import {Link} from "react-router-dom";
import Counter from "../Counter.jsx";

const MyDashboardCard = (props) => {
    return (
        <div className={`p-5 text-left bg-slate-900 shadow-xl rounded-2xl text-white`}>
            <Link to={props.to} className={`flex items-center justify-between hover:underline hover:text-blue-500`}>
                <p className={` text-xl font-bold`}>{props.name}</p>
                <button>
                    <FontAwesomeIcon icon={faAngleRight} size='lg' />
                </button>
            </Link>
            <p className={`text-[3rem] font-bold`}>
                <Counter from={0} to={props.count} />
            </p>
        </div>
    );
}

export default MyDashboardCard;