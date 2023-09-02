import {useState} from "react";
import MySidebarItems from "../MySidebarItems.jsx";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import { faEllipsisVertical, faListUl } from "@fortawesome/free-solid-svg-icons";

const MySidebar = ({ menuItems }) => {
    const [open, setOpen] = useState(true);

    return (
        <aside
            className={`${open ? 'w-20 px-3' : 'w-96 px-5'} sticky top-0 py-3 bg-slate-900 text-white text-lg h-screen hidden lg:block duration-100 shadow-lg z-10`}
        >
            <section className={`flex ${open ? 'justify-center space-x-0' : 'justify-between space-x-6'} items-center mb-3 p-3`}>
                <h1 className={`${open ? 'hidden' : 'hidden-none'} text-3xl font-black whitespace-nowrap`}>
                    Admin Panel
                </h1>
                <FontAwesomeIcon
                    icon={open ? faListUl : faEllipsisVertical}
                    className={`cursor-pointer ${open ? 'p-3 pb-0' : 'pl-3 pr-0'}`}
                    onClick={() => setOpen(!open)}
                />
            </section>
            <ul className={`space-y-4`}>
                <MySidebarItems menuItems={menuItems} open={open} />
            </ul>
        </aside>
    );
}

export default MySidebar;