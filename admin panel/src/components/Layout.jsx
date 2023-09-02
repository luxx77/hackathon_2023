import MySidebar from "./MySidebar/MySidebar.jsx";
import {Outlet} from "react-router";
import {faC, faCircleExclamation, faEarth, faGauge, faGear, faM, faMountain, faNoteSticky, faP} from "@fortawesome/free-solid-svg-icons";
import MyNavbar from "./MyNavbar/MyNavbar.jsx";
import MyFooter from "./MyFooter/MyFooter.jsx";
import {useTranslation} from "react-i18next";
import Cookies from 'js-cookie';

const Layout = () => {
    const { i18n, t } = useTranslation();

    const onChangeLang = (e) => {
        const lang_code = e.target.value;
        i18n.changeLanguage(lang_code);

        Cookies.set("lng", lang_code, {
            expires: 7,
        });
    };
    const menuItems = [
        { id: 1, name: t("dashboard"), icon: faGauge , to: "/"},
        { id: 2, name: "Events Page", icon: faEarth , to: "/events"},
        { id: 4, name: "Event Add", icon: faMountain , to: "/events_add"},
        { id: 3, name: "SOS Map Page", icon: faCircleExclamation , to: "/sos_map"},
    ];

    return (
        <div>
            <div className={`flex font-urbanist text-slate-900`}>
                <MySidebar menuItems={menuItems} />
                <section className={`flex flex-col w-screen justify-between`}>
                    <MyNavbar title="Admin Panel" menuItems={menuItems} />
                    <div className={`mb-auto`}>
                        <Outlet />
                    </div>
                    <MyFooter defaultValue={i18n.language} onChange={onChangeLang} />
                </section>
                <div></div>
            </div>
        </div>
    );
}

export {Layout};