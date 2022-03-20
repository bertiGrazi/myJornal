module.exports = {
    posts: function(req, res) {
        const postOne = {
            id: 1, 
            title: "POST TITLE 1", 
            body: "HERE IS MY BODY"
        }

        const postTwo = {
            id: 2, 
            title: "POST TITLE 2", 
            body: "HERE IS MY BODY 2"
        }

        res.send([postOne, postTwo])
    }
}