import React, {useEffect} from 'react';
import {Link} from "react-router-dom";
import MyButton2 from "./MyButton2.jsx";
import {faEdit, faEye, faEyeSlash, faTrash} from "@fortawesome/free-solid-svg-icons";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import MyModal from "./MyModal/MyModal.jsx";
import {initTE, Modal, Ripple} from "tw-elements";

function MyTableMealsItems(props) {
    useEffect(() => {
        initTE({ Modal, Ripple });
    }, []);

    return (
        <tr className={`bg-stone-50 hover:bg-stone-100`}>
            <td scope="row" className={`w-20 p-1`}>
                <button className={`text-sm ${props.meal.show ? 'text-gray-500' : 'text-gray-900'} p-2`}>
                    <FontAwesomeIcon icon={faEyeSlash}/>
                </button>
            </td>
            <td scope="row" className={`whitespace-nowrap py-3`}>
                {props.meal.id}
            </td>
            <td scope="row" className={`flex justify-center items-center py-3`}>
                <img
                    src={`public/img/${props.meal.img}`}
                    alt="salam"
                    className={`w-36 h-auto rounded-md md:rounded-xl hover:scale-[1.05] duration-200 shadow-lg cursor-pointer active:scale-[0.95]`}
                    data-te-toggle="modal"
                    data-te-target="#exampleModal"
                    data-te-ripple-init />
                <MyModal imgSrc={`public/img/${props.meal.img}`} />
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.meal.child_category}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.meal.name_tm}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.meal.name_ru}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.meal.name_en}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.meal.price} tmt
            </td>
            <td className={`w-20 p-1`}>
                <Link to={props.showLink}>
                    <MyButton2 btnColor='bg-slate-900 text-white' btnColorOnHover='bg-blue-500' icon={faEye} />
                </Link>
            </td>
            <td className={`w-20 p-1`}>
                <Link to={props.editLink}>
                    <MyButton2 btnColor='bg-slate-900 text-white' btnColorOnHover='bg-yellow-500' icon={faEdit} />
                </Link>
            </td>
            <td className={`w-20 p-1`}>
                <MyButton2 btnColor='bg-slate-900 text-white' btnColorOnHover='bg-red-600' icon={faTrash} />
            </td>
        </tr>
    );
}

export default MyTableMealsItems;