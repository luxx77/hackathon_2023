import React from 'react';
import MySearchInput from "../MySearchInput.jsx";
import MyBackButton from "../MyBackButton.jsx";

const MyHeader = (props) => {
    return (
        <header className={`flex items-center justify-between sticky top-0 h-20 p-3 lg:p-5 bg-zinc-100 z-1`}>
            <div className={`flex space-x-4`}>
                {!props.search ? <MyBackButton onClick={props.onClick} /> : ''}
                <h1 className={`whitespace-nowrap text-xl lg:text-3xl font-bold`}>{props.title}</h1>
            </div>
            {props.search ? <MySearchInput /> : ''}
        </header>
    );
}

export default MyHeader;