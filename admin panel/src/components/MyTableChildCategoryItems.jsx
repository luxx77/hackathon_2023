import React, {useEffect} from 'react';
import {initTE, Modal, Ripple} from "tw-elements";
import MyModal from "./MyModal/MyModal.jsx";
import {Link} from "react-router-dom";
import MyButton2 from "./MyButton2.jsx";
import {faEdit, faEye, faTrash} from "@fortawesome/free-solid-svg-icons";

const MyTableChildCategoryItems = (props) => {
    useEffect(() => {
        initTE({ Modal, Ripple });
    }, []);

    return (
        <tr className={`bg-stone-50 hover:bg-stone-100`}>
            <td scope="row" className={`whitespace-nowrap p-3`}>
                {props.category.id}
            </td>
            <td scope="row" className={`flex justify-center items-center p-0 py-3 lg:p-1 lg:py-3`}>
                <img
                    src={`public/img/${props.category.img}`}
                    alt="salam"
                    className={`w-36 h-auto rounded-md md:rounded-xl hover:scale-[1.05] duration-200 shadow-lg cursor-pointer active:scale-[0.95]`}
                    data-te-toggle="modal"
                    data-te-target="#exampleModal"
                    data-te-ripple-init />
                <MyModal imgSrc={`public/img/${props.category.img}`} />
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.category.parent_category}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.category.name_tm}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.category.name_ru}
            </td>
            <td scope="row" className={`whitespace-nowrap`}>
                {props.category.name_en}
            </td>
            <td className={`w-20 p-1`}>
                <Link to={props.showLink}>
                    <MyButton2 btnColor='bg-slate-900 text-white' icon={faEye} />
                </Link>
            </td>
            <td className={`w-20 p-1`}>
                <Link to={props.editLink}>
                    <MyButton2 btnColor='bg-slate-900 text-white' icon={faEdit} />
                </Link>
            </td>
            <td className={`w-20 p-1 pr-3`}>
                <MyButton2 btnColor='bg-slate-900 text-white' icon={faTrash} />
            </td>
        </tr>
    );
}

export default MyTableChildCategoryItems;