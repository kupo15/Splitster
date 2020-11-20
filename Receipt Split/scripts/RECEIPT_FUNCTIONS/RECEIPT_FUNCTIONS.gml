
function scr_receipt_create(userStruct,desc,amt) {
/// @param userStruct
/// @param [description
/// @param price]

if argument[1] == undefined
desc = "";

if argument[2] == undefined
amt = "0";

// create struct
active_receipt = {
	
description: "",
currency: currency_symbol[currency_index],
price: "0",
split: [],
}

// add initial member
scr_receipt_member_add(active_receipt,userStruct,true);

// assign values
receipt_name = desc;
receipt_price = amt;
receipt_index = array_length(active_expense.receiptList);
}

function scr_receipt_update(ind) {

active_receipt = active_expense.receiptList[ind];

receipt_name = active_receipt.description;
receipt_price = active_receipt.price;
currency_index = active_receipt.currency;
receipt_index = ind;

screen_change(screen.receiptUpdate);
click_textbox_set(receipt_price,0,kbv_type_numbers);
}

function scr_receipt_add(ind) {
/// @param receiptIndex

// debug
if receipt_name == ""
receipt_name = choose("Pizza","Beer","Ice Cream","Drinks");
	
// set variables
active_receipt.description = receipt_name;
active_receipt.price = receipt_price;
active_receipt.currency = currency_index;

// add receipt to active expense receiptList
active_expense.receiptList[ind] = active_receipt;

// total up receipt costs
active_expense.total_cost = 0;

var num = array_length(active_expense.receiptList);
for(var i=0;i<num;i++)
	{
	var receipt_pointer = active_expense.receiptList[i];
	var receipt_amount = real(receipt_pointer.price);
	
	active_expense.total_cost += receipt_amount;
	}
	
// no more active receipts
receipt_name = "";
receipt_price = "";
receipt_index = undefined;	
active_receipt = undefined;
	
vk_hide();
}
	
function scr_receipt_member_add(receiptPointer,userStruct,defaultPaid) {
	
var ind = array_length(receiptPointer.split);
receiptPointer.split[ind] = {// auto add yourself
	
	memberId: userStruct, 
	paid: defaultPaid,
	share: 0,
	}
 
}
