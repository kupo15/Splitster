
function scr_receipt_create(desc,amt) {
/// @param [description
/// @param price]

if argument[0] == undefined
desc = "";

if argument[1] == undefined
amt = "";

// create struct
active_receipt = {
	
description: "",
currency: currency_symbol[currency_index],
price: "",

split: [
		{// auto add yourself
		memberId: profileInfo, 
		paid: true,
		share: 0,
		},	
       ]

}

// assign values
receipt_name = desc;
receipt_price = amt;
receipt_index = array_length(active_expense.receiptList);
}

function scr_receipt_update(ind) {

active_receipt = active_expense.receiptList[ind];

receipt_name = active_expense.receiptList[ind].description;
receipt_price = active_expense.receiptList[ind].price;
currency_index = active_expense.receiptList[ind].currency;
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