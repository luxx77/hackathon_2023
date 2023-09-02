import React from 'react';
import MyModal from "./MyModal/MyModal.jsx";

function CardImage(props) {
    return (
        <>
            <div
                className={`bg-center bg-cover h-[14rem]  w-full rounded-2xl rounded-b-none`}
                style={{backgroundImage: `url(${props.img})`}}
                data-te-toggle="modal"
                data-te-target="#exampleModal"
                data-te-ripple-init
            ></div>
            <MyModal imgSrc={props.img} />
        </>
    );
}

export default CardImage;