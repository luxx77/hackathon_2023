import React from 'react';
import {useNavigate} from "react-router-dom";
import {useTranslation} from "react-i18next";

function NotFound() {
    const { t } = useTranslation()
    const navigate = useNavigate()

    return (
        <div className={`flex items-center justify-center w-screen h-screen text-slate-950`}>
            <p className={`text-9xl border-r-[3px] pr-5 mr-5 font-light`}>404</p>
            <div className={`space-y-4`}>
                <p className={`text-5xl font-bold`}>{t("not_found")}</p>
                <button className={`text- px-5 py-2 bg-slate-900 rounded-lg text-white hover:bg-slate-950`} onClick={() => navigate(-1)}>Go Back</button>
            </div>
        </div>
    );
}

export default NotFound;