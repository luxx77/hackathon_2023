import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faSearch} from "@fortawesome/free-solid-svg-icons";

const MySearchInput = () => {
    return (
        <label className={`flex space-x-3`}>
            <input className={`w-28 md:w-40 lg:w-80 h-10 lg:h-12 px-3 appearance-none text-md lg:text-lg bg-stone-200 rounded-lg focus:border focus:outline-none peer focus:ring-2 focus:ring-blue-500`}/>
            <button className={`flex justify-center items-center w-10 lg:w-12 h-10 lg:h-12 bg-slate-900 rounded-lg hover:bg-slate-800 text-white active:border`}>
                <FontAwesomeIcon icon={faSearch} />
            </button>
        </label>
    );
}

export default MySearchInput;