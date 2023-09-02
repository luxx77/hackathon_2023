import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faCaretDown} from "@fortawesome/free-solid-svg-icons";

const MyTableHeadItems = (props) => {
    return (
        <th  scope='col' className={`whitespace-nowrap p-3`}>
            <div className={`flex items-center justify-center space-x-2`}>
                <p>{props.TableHeader.title}</p>
                {props.TableHeader.sort ?
                    <button className={`flex justify-center items-center w-5 h-5`}>
                        <FontAwesomeIcon icon={faCaretDown} />
                    </button> : ''}
            </div>
        </th>
    );
}

export default MyTableHeadItems;