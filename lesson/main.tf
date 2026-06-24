/* `local_file` is resource type, with local as a "provider" which is a plugin.

   `my-file` is name/identifier of the resource. We can change it to whatever we want.

   `filename` and `content` are arguments (input attribute)
*/

resource "local_file" "my-file" {
    filename = "terrafile.txt"
    content = "Hello, Yash!"
}
