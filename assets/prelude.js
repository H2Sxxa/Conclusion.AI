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

let Configure = {
    get: async function (plugin_name, config_key) {
        return await sendMessage("config", JSON.stringify(plugin_name + "." + config_key));
    },
}




let TextExtractor = {
    xpath: function (text, expr) {

    },
}

function build_reference_data(url, title, body) {
    return {
        url: url,
        title: title,
        body: body
    };
}

