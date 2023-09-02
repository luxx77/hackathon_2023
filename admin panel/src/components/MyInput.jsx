import React from 'react';

const MyInput = (props) => {
    return (
        <>
            <label htmlFor={props.id} className={`after:content-['*'] after:ml-0.5 after:text-red-500 text-slate-600`}>
                {props.title}
            </label>
            <input
                id={props.id}
                name={props.name}
                type={props.type}
                step={props.step}
                min={props.min}
                max={props.max}
                onChange={props.onChange}
                required={props.required}
                className={`block h-12 w-full px-4 border border-slate-400 bg-transparent border-2xl rounded-lg appearance-none hover:bg-stone-200 focus:outline-none focus:ring-2 focus:ring-blue-400 `}
            />
        </>
    );
}

export default MyInput;