import React from 'react';

const MyButton1 = (props) => {
    return (
        <button className={`bg-slate-900 text-white hover:bg-slate-950 py-2 px-6 text-xl font-bold rounded-lg`} onClick={props.onClick} >
            {props.title}
        </button>
    );
}

export default MyButton1;