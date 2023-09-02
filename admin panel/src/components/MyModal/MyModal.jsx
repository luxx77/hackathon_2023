import React from 'react';

const MyModal = (props) => {
    return (
        <div
            data-te-modal-init
            className="fixed left-0 top-0 z-[1055] hidden h-screen w-screen"
            id="exampleModal"
            tabIndex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
        >
            <div data-te-modal-dialog-ref className="pointer-events-none">
                <div className="flex items-center justify-center h-screen" data-te-modal-body-ref>
                    <img
                        src={props.imgSrc}
                        alt="salam"
                        className={`w-[50rem] h-auto`}
                    />
                </div>
            </div>
        </div>
    );
}

export default MyModal;