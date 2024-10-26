/**
 * 
 */function form_check_addProduct() {
	let productId = document.getElementById("newProduct");
	let pName = document.getElementById("pName");
	let unitPrice = document.getElementById("unitPrice ");
	let description = document.getElementById("description");
	let category = document.getElementById("category");
	let pImg = document.getElementById("pImg");

	if (!(productId.value)) {
		alert("제품 아이디를 입력해주세요");
		productId.focus();
		return false;
	}
	if (!(pName.value)) {
		alert("제품명을 입력해주세요");
		pName.focus();
		return false;
	}
	if (!(unitPrice.value.length==0 || isNaN(unitPrice.value))) {
		alert("가격은 숫자만 입력해주세요");
		unitPrice.focus();
		return false;
	}else if(unitPrice.value) {
		alert("가격을 입력해주세요");
		unitPrice.focus();
		return false;
	}
	if (!(description.value)) {
		alert("제품 상세정보를 입력해주세요");
		description.focus();
		return false;
	}
	if (!(category.value)) {
		alert("카테고리를 입력해주세요");
		category.focus();
		return false;
	}
	if (!(pImg.value)) {
		alert("사진을 삽입해주세요");
		pImg.focus();
		return false;
	}

	document.registerNewProduct.submit();
		
}
