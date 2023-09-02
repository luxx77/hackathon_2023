import React, {useEffect, useRef} from "react";
import { animate } from "framer-motion";

function Counter({ from, to }) {
    const nodeRef = useRef();

    useEffect(() => {
        const node = nodeRef.current;

        const controls = animate(from, to, {
            duration: 0.6,
            onUpdate(value) {
                node.textContent = value.toFixed();
            }
        });

        return () => controls.stop();
    }, [from, to]);

    return <span ref={nodeRef} />;
}

export default Counter;