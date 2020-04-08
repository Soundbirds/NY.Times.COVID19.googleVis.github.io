

(rels <- gh(
  "/repos/:owner/:repo/releases",
  owner = "Soundbirds",
  repo = "my-new-repo-for-gh-testing"
))

(rels <- gh(
  "/repos/:owner/:repo",
  owner = "Soundbirds",
  repo = "my-new-repo-for-gh-testing"
))$id



(rel <- gh(
  "/repos/:owner/:repo/releases",
  owner = "Soundbirds",
  repo = "my-new-repo-for-gh-testing",
  id = rels[[1]]$id
))


 


# https://github.com/r-lib/gh/issues/56

http://api.github.com/repos/Soundbirds/my-new-repo-for-gh-testing/contents/test.txt


lib(curl)

## Customize this with your OWNER/REPO, Release ID and binary 
binary <- c("indexTest.htm", "test.json")[1]

# url <- "https://uploads.github.com/repos/Soundbirds/my-new-repo-for-gh-testing/releases/25112171/assets?name=indexTest2.htm"
# url <- "http://github.com/Soundbirds/my-new-repo-for-gh-testing"
url <- "http://api.github.com/repos/Soundbirds/my-new-repo-for-gh-testing/contents"
# url <- "http://uploads.github.com/repos/Soundbirds/my-new-repo-for-gh-testing/assets?name=indexTest2.htm"

persToken <- "d6a1d4949d3ce25c9f761e46f30622326c299684"
  

h <- new_handle()
handle_setopt(h, .list = list(post = TRUE, postfieldsize = file.info(binary)$size, postfields = readBin(binary, raw(), file.info(binary)$size)))
# handle_setopt(h, .list = list(post = TRUE))

handle_setheaders(h, Authorization=paste0("token ", persToken), "Content-Type" = "application/x-dosexec")
handle_setheaders(h, Authorization=paste0("token ", persToken))

# handle_setform(h, test101.txt = form_file("indexTest.htm", type = "text/html"))

resp <- curl_fetch_memory(url, handle = h)

data.frame(Status = resp$status_code, Modified = resp$modified)

read.csv(textConnection((rawToChar(resp$content))))



handle_setopt(h, customrequest = "PUT")

# https://github.com/r-lib/gh/issues/56   # gh issue shows how to upload file to a release

# https://github.community/t5/GitHub-API-Development-and/How-to-upload-a-file-using-GitHub-API/td-p/24221  # PUT's to an existing file

# https://stackoverflow.com/questions/37786539/how-to-upload-github-asset-file-using-curl


https://api.github.com

binary <- "indexTest.htm"
gh(
  "PUT https://api.github.com/repos/Soundbirds/my-new-repo-for-gh-testing/contents/test.txt",
  readBin(binary, raw(), file.info(binary)$size),
  .send_headers = c("Content-Type" = "application/vnd.microsoft.portable-executable")
)



binary <- "indexTest.htm"
gh(
  paste0("POST https://api.github.com/repos/Soundbirds/my-new-repo-for-gh-testing",
         "?name=indexTest4.htm"),
  readBin(binary, raw(), file.info(binary)$size),
  .send_headers = c("Content-Type" = "application/vnd.microsoft.portable-executable")
)


POST('http://api.github.com/repos/Soundbirds/NY.Times.COVID19.googleVis.github.io/contents/indexTest2.htm', config = config(token = github_token), 
            body = list(indexTest2.htm = upload_file('indexTest.htm')), verbose(), handle = h)




# ============================================================================================================================================================

JRWToolBox::lib(curl)
JRWToolBox::lib(gh)
 
relID <- gh::gh("/repos/:owner/:repo/releases", owner = "Soundbirds", repo = "NY.Times.COVID19.googleVis.github.io")[[1]]$id
binary <- "COVID_states.htm"
url <- paste0("https://uploads.github.com/repos/Soundbirds/NY.Times.COVID19.googleVis.github.io/releases/", relID, "/assets?name=", binary)
persToken <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"


h <- curl::new_handle()
curl::handle_setopt(h, .list = list(post = TRUE, postfieldsize = file.info(binary)$size, postfields = readBin(binary, raw(), file.info(binary)$size)))
curl::handle_setheaders(h, Authorization=paste0("token ", persToken), "Content-Type" = "application/x-dosexec")

resp <- curl::curl_fetch_memory(url, handle = h)

data.frame(Status = resp$status_code, Modified = resp$modified)

# read.csv(textConnection((rawToChar(resp$content))))


















