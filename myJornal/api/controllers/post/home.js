
module.exports = async function(req, res) {
    console.log('This route shows home page of posts')

    const allPost = await Post.find()

    res.view('pages/home',
     {allPost}
    )
}