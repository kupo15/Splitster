
function scr_receipt_create(desc,amt) {
/// @param [description
/// @param price]

active_receipt = {
	
description: "",
currency: currency_symbol[currency_index],
price: "",

split: {
you: 0,	
	
}

}

if desc == undefined
desc = "";

if amt == undefined
amt = "";

receipt_name = desc;
receipt_price = amt;
receipt_index = ds_list_size(active_expense.receiptList);
}

function scr_receipt_update(ind) {

active_receipt = active_expense.receiptList[| ind];

receipt_name = active_expense.receiptList[| ind].description;
receipt_price = active_expense.receiptList[| ind].price;
currency_index = active_expense.receiptList[| ind].currency;
receipt_index = ind;

screen_change(screen.receiptUpdate);
}

function scr_receipt_add(ind) {
/// @param receiptIndex
	
active_receipt.description = receipt_name;
active_receipt.price = receipt_price;
active_receipt.currency = currency_index;

active_expense.receiptList[| ind] = active_receipt;
receipt_index = undefined;	
active_receipt = undefined;
	
vk_hide();
}