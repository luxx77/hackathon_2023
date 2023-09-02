import MyHeader from "../components/MyHeader/MyHeader.jsx";
import React, { useState } from "react";
import {useTranslation} from "react-i18next";
import MyButton1 from "../components/MyButton1.jsx";

const DashboardPage = () => {
    const { t } = useTranslation()

    return(
        <div className={`w-full`}>
            <MyHeader search={true} title={t("dashboard")} />
        </div>
    );
}

export {DashboardPage};