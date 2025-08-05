
let Http = {
    http: async function (data) {
        return await sendMessage("http", JSON.stringify(data));
    },
    get: async function (url) {
        return await this.http({ method: "GET", url: url });
    },
    post: async function (url, text) {
        return await this.http({ method: "POST", url: url, data: text });
    }
}


let TextExtractor = {
    xpath: function (text, expr) {

    },
}

function build_reference_data(url, title, body) {
    return JSON.stringify({
        url: url,
        title: title,
        body: body
    });
}