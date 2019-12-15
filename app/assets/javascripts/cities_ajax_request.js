document.addEventListener("turbolinks:load", function(){
    let country = document.getElementById("country_id");

    country.addEventListener("change", function(){
        Rails.ajax({
            url: "/cities?country_id=" + country.value,
            type: "GET"
        })
    });
});

