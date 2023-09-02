import {Link, useMatch} from 'react-router-dom';
import {motion} from "framer-motion";

const MyLink = ({children, to, open, ...props}) => {
    const match = useMatch({
        path: to,
        end: to.length === 1,
    });
    return (
        <Link
            to={to}
            className={`flex items-center whitespace-nowrap ${open ? 'justify-center' : 'justify-start'} 
                w-full p-3 bg-stone-100 text-slate-800 shadow-lg rounded-lg space-x-3 ${
                    !match && "bg-transparent shadow-none text-stone-50 hover:bg-slate-800 "
                }`}
            {...props}
        >
            {children}
        </Link>
    )
}

export {MyLink};