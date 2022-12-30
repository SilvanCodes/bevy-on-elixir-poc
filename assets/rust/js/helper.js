// window.addEventListener("message", (event) => {
//     if (event.origin !== window.origin) {
//         console.warn("Other origin:", event.origin)
//     }

//     console.log("iframe got message:", event.data);

//     // …
// }, false);


export function postParent(message) {
    console.log("postParent:", message);
    parent.postMessage("PING", window.origin);
}

export function help() {
    window.parent.CHANNEL.push("shout", { body: "chatInput.value" })
}

export default help;