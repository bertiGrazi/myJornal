
module.exports = {
    posts: function (req, res) {
        Post.find().exec(function (err, posts) {
            if (err) {
                return res.serverError(err.toString())
            }

            res.send(posts)
        })
    },

    create: function (req, res) {
        const title = req.body.title
        const postBody = req.body.postBody

        sails.log.debug('My title' + title)
        sails.log.debug('Body' + postBody)

        Post.create({ title: title, body: postBody }).exec(function (err) {
            if (err) {
                return res.serverError(err.toString())
            }

            console.log("Finish creating post object")

            return res.redirect('/home')
            //return res.end()
        })
    },

    findById: function (req, res) {
        const postId = req.param('postId')

        const filteredPost = allPost
            .filter(post => { return post.id == postId })

        if (filteredPost.length > 0) {
            res.send(filteredPost[0])
        } else {
            res.send("Failed to find post by id: " + postId)
        }
    },

    delete: async function(req, res) {
        const postId = req.param('postId')

        await Post.destroy({id: postId})

        res.send('Finished deleting post')
    }
}