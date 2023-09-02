import React, {useState} from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faImage} from "@fortawesome/free-solid-svg-icons";

const MyImageInput = (props) => {

    return (
        <>
            <label htmlFor='img'>
                <div className={`flex items-center justify-center h-16 bg-slate-900 rounded-t-lg text-gray-100 hover:bg-dark-800 hover:text-gray-100`}>
                    <p>Click to add image</p>
                </div>
                <div className={`flex items-center justify-center bg-stone-200 p-10 rounded-b-lg`}>
                    <div className={`flex items-center justify-center h-72 ${props.img && 'hidden'}`}>
                        <FontAwesomeIcon icon={faImage} size='2xl' />
                    </div>
                    {props.img && (
                        <img
                            alt=""
                            src={URL.createObjectURL(props.img)}
                        />
                    )}
                </div>
            </label>
            <input
                name='img'
                id='img'
                type="file"
                className={`hidden`}
                onChange={props.onChange}
            />
        </>
    );
}

export default MyImageInput;