let cnbing = {
    name: "Bing(CN)",
    baseurl: "https://cn.bing.com/search",
    version: "1.0.0",
    description: "Bing(CN) Search Plugin, created by `conclusion.ai`.",
    minappversion: "1.0.0",
    settings: {
        "DeepSearch": "Try to get the text from the search result page, it may degrade the performance.",
    },

    get: async function (keyword, numbers) {
        const response = await Http.get(this.baseurl + "?q=" + encodeURIComponent(keyword));
        const data = JSON.parse(response);




    }



}