// dummy database
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

const postThree = {
    id: 3, 
    title: "POST TITLE 3", 
    body: "HERE IS MY BODY 3"
}

const allPost = [postOne, postTwo, postThree]

module.exports = {
    posts: function(req, res) {
        res.send(allPost)
    },

    findById: function(req, res) {
        const postId = req.param('postId')

        const filteredPost = allPost
        .filter( post => { return post.id == postId})

        if (filteredPost.length > 0) {
            res.send(filteredPost[0])
        } else {
            res.send("Failed to find post by id: " + postId)
        }
    }
}