/**
 * 
 */
//alert("test");
function form_check_addProduct(){
	let productId = document.getElementById("newProduct");
	let pName = document.getElementById("pName");
	let unitPrice = document.getElementById("unitPrice");
	let description = document.getElementById("description");
	let category = document.getElementById("category");
	let pImg = document.getElementById("pImg");
	
	if(!(productId.value)){
		alert("상품의 코드를 입력해주세요.");
		productId.focus();
		return false;
	}
	if(!(productId.value)){
			alert("상품명을 입력해주세요.");
			productId.focus();
			return false;
	}
	/*가격은 숫자만 입력하도록 구현*/
	if(!(unitPrice.value.length==0 || unitPrice.value.length>9 || isNaN(unitPrice.value))){
				alert("가격은 천만원 이내의 숫자만 입력해주세요.");
				unitPrice.focus();
				return false;
		}else if(unitPrice.value<0 ){
			alert("가격은 음수를 입력할 수 없습니다.");
			unitPrice.focus();
			return false;
		}
		else if(!(unitPrice.value)){
			    alert("가격을 입력해주세요.");
				unitPrice.focus();
				return false;
		}
		
	
	document.registerNewProduct.submit();
}