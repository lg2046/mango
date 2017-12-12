let ajaxHandler = (e) => {
    let form = $(e.target);
    e.preventDefault();
    let post_url = form.attr("action");
    let form_data = form.serialize();
    $.post(post_url, form_data, (response) => {
        $.bootstrapGrowl(response.message, {
                offset: {from: "top", amount: 60},
                type: "success"
            }
        );
        $(".cart-count").text(response.cart_count);
    });
};

let ajaxCart = {
    init: () => {
        $(() => $(".cart-form").on("submit", ajaxHandler));
    }
};

export default ajaxCart