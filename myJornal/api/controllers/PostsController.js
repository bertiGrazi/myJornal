module.exports = {
    posts: function(req, res) {
        const postOne = {id: 1, title: "POST TITLE 1", body: "HERE IS MY BODY"}
        res.send(postOne)
    }
}