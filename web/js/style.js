window.onscroll = function () { scrollFunction20(); scrollFunction600(); scrollFunction2300(); };
function scrollFunction20() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("navbar").style.backgroundColor = "white";
        document.getElementById("navbar").style.color = "black";
        document.getElementById("navbar").style.height = "70px";
        document.getElementById("navbar").style.fontSize = "13px";
        document.getElementById("dark").style.display = "block"; //hiện lên
        document.getElementById("white").style.display = "none";// ẩn
        document.getElementById("yc").style.color = "black";
        document.getElementById("tm").style.color = "black";
        document.getElementById("home").style.color = "black";
        document.getElementById("sale").style.color = "black";
        document.getElementById("bl").style.color = "black";

        

    } else {
        document.getElementById("navbar").style.backgroundColor = "unset";
        document.getElementById("navbar").style.color = "white";
        document.getElementById("navbar").style.height = "105px";
        document.getElementById("navbar").style.fontSize = "15px";
        
        document.getElementById("dark").style.display = "none";
        document.getElementById("white").style.display = "block";
        
        document.getElementById("yc").style.color = "white";
        document.getElementById("tm").style.color = "white";
        document.getElementById("home").style.color = "white";
        document.getElementById("sale").style.color = "white";
        document.getElementById("bl").style.color = "white";
    }
}
// signIn
let email = document.querySelector("input[type='email']");
		let first_Name = document.querySelector("input[name='first-name']");
		let last_Name = document.querySelector("input[name='last-name']");
		let email_regular_expression = /^[a-zA-Z0-9.-_%+]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$/;
		let name_regular_expression = /^[a-zA-Z]{2,30}$/;
		let submit_Btn = document.querySelector("button[type='submit']");
		submit_Btn.addEventListener("click", () => {
			if ((!name_regular_expression.test(first_Name.value)) || (!name_regular_expression.test(
				last_Name.value))) {
				alert("Họ và tên chỉ chứa các chữ cái hoa, thường và không chứa kí tự đặc biệt!!");
			} else if (!email_regular_expression.test(email.value)) {
				alert("Bạn cần nhập chính xác định dạng email!!");
			} else {
				alert("Submit thành công!!");
			}
		});