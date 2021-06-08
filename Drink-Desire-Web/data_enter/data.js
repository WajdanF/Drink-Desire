const range = document.querySelector("#strength");
const circle = document.querySelector(".dot");

const color = (e) => {
    if (e === "1") {
        circle.style.backgroundColor = "#D7CCC8";
    } else if (e === "2") {
        circle.style.backgroundColor = "#BCAAA4";
    } else if (e === "3") {
        circle.style.backgroundColor = "#A1887F";
    } else if (e === "4") {
        circle.style.backgroundColor = "#8D6E63";
    } else if (e === "5") {
        circle.style.backgroundColor = "#795548";
    } else if (e === "6") {
        circle.style.backgroundColor = "#6D4C41";
    } else if (e === "7") {
        circle.style.backgroundColor = "#5D4037";
    } else if (e === "8") {
        circle.style.backgroundColor = "#4E342E";
    } else if (e === "9") {
        circle.style.backgroundColor = "#3E2723";
    }
};

const data = document.querySelector("#data");

auth.onAuthStateChanged((user) => {
    db.collection("Restrictions")
        .doc(`${auth.currentUser.uid}`)
        .get()
        .then((doc) => {
            if (doc.exists) {
                data.name.value = doc.data().name;
                data.strength.value = parseInt(doc.data().strength) / 100;
                color((doc.data().strength/100).toString());
                data.sugar.value = doc.data().sugar;
            }
        })
        .catch((error) => {
            console.log("Error getting document:", error);
        });
});

data.addEventListener("submit", (e) => {
    e.preventDefault();
    db.collection("Restrictions")
        .doc(`${auth.currentUser.uid}`)
        .set({
            name: data.name.value,
            strength: parseInt(data.strength.value) * 100,
            sugar: data.sugar.value,
        })
        .then(() => {
            data.reset();
            window.location.href = "../order_page/order.html";
        });
});


const slider = range.addEventListener("input", (e) => {
    console.log(e.target.value);
    color(e.target.value);
});
