module.exports = function(req, res) {
    console.log('This route shows home page of posts')
    res.view('pages/home')
}