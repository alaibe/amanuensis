module Amanuensis
  module Github
    class Push

      def run(changelog)
        client = Octokit::Client.new(access_token: Github.oauth_token, auto_paginate: true)

        repo_name      = Github.repo
        default_branch = client.repo(repo_name)[:default_branch]
        ref            = "heads/#{default_branch}"

        content = (client.contents repo_name, path: Github.file_name, ref: ref, accept: 'application/vnd.github.V3.raw' rescue '')

        if content.empty?
          client.create_content(repo_name, Github.file_name, 'Creating changelog', changelog, branch: default_branch)
        else
          content.prepend(changelog)
          content_object = client.contents repo_name, path: Github.file_name, ref: ref

          client.update_content(repo_name, Github.file_name, 'Updating changelog', content_object.sha, content, branch: default_branch)
        end
      end

    end

  end
end
