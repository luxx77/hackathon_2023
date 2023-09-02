import MySidebarItems from "../MySidebarItems.jsx";
import MySearchInput from "../MySearchInput.jsx";

const MyNavbar = ({title, menuItems}) => {
    return (
        <nav>
            <ul className={`flex w-screen overflow-y-auto p-1.5 space-x-4 bg-slate-950 lg:hidden`}>
                <MySidebarItems menuItems={menuItems} open={false} />
            </ul>
        </nav>
    );
}

export default MyNavbar;