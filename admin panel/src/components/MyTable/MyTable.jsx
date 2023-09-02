import React from 'react';
import MyPaginate from "../MyPaginate.jsx";
import MyTableHeadItems from "../MyTableHeadItems.jsx";
import MyAddButton from "../MyAddButton.jsx";

const MyTable = (props) => {
    return (
        <>
            <div className={`flex justify-between text-white`}>
                <MyAddButton addLink={props.addLink} />
                <MyPaginate />
            </div>
            <div className={`h-[30rem] overflow-x-auto rounded-lg rounded-t-none bg-slate-50 shadow-lg`}>
                <table className={`w-full font-light table-auto`}>
                    <thead>
                        <tr className={`sticky top-0 bg-slate-900 z-10 text-center text-white shadow-lg`}>
                            {props.TableHeaders.map((TableHeader) => (
                                <MyTableHeadItems key={TableHeader.id} TableHeader={TableHeader} />
                            ))}
                        </tr>
                    </thead>
                    <tbody className={`text-center`}>
                        {props.children}
                    </tbody>
                </table>
            </div>
        </>
    );
}

export default MyTable;