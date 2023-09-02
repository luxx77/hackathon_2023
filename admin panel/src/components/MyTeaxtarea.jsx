import React from 'react';

const MyTeaxtarea = (props) => {
    return (
        <>
            <label htmlFor={props.id}>
                {props.title} <span className={`text-red-500`}>*</span>
            </label>
            <textarea 
                id={props.id}
                onChange={props.onChange} 
                className={`peer block min-h-[auto] w-full rounded bg-stone-200 px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear`} />
        </>
    );
}

export default MyTeaxtarea;