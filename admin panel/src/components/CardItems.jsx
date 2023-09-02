import React from 'react';

const CardItems = (props) => {
    return (
        <div className={`grid grid-cols-6 gap-5 p-5 bg-stone-50 rounded-2xl rounded-t-none shadow-lg`}>
            {props.items.map((item) => (
                <ul key={item.name} className={`flex ${item.col}`}>
                    <li className={`space-x-2`}>
                        <p className={`whitespace-nowrap text-gray-400 text-sm`}> {item.name}</p>
                        {item.value}
                    </li>
                </ul>
            ))}
        </div>
    );
}

export default CardItems;