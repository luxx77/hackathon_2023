import React from 'react';
import {Link} from "react-router-dom";
import MyButton2 from "../MyButton2.jsx";
import {faEdit, faTrash} from "@fortawesome/free-solid-svg-icons";
import CardImage from "../CardImage.jsx";
import CardItems from "../CardItems.jsx";

const MyCard = (props) => {
    return (
        <>
            <div className={`flex justify-between items-end`}>
                <CardImage img={props.img} />
                <div className={`absolute flex space-x-2 m-2`}>
                    {props.children}
                    <Link to={props.editLink}>
                        <MyButton2 btnColor='bg-slate-50 text-slate-900' icon={faEdit} />
                    </Link>
                    <MyButton2 btnColor='bg-slate-50 text-slate-900' icon={faTrash} />
                </div>
            </div>
            <CardItems items={props.items} />
        </>
    );
}

export default MyCard;