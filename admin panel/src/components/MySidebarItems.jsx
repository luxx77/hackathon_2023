import {MyLink} from "./MyLink.jsx";
import {motion} from "framer-motion";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";

const MySidebarItems = ({menuItems, open}) => {
    return (
        <>
            {menuItems.map((item, index) => (
                <motion.li key={index}>
                    <MyLink to={item.to} id={item.id} open={open}>
                        <FontAwesomeIcon icon={item.icon} size='lg' />
                        <p className={`${open ? 'hidden' : 'block'} text-md`}>{item.name}</p>
                    </MyLink>
                </motion.li>
            ))}
        </>
    );
}

export default MySidebarItems;