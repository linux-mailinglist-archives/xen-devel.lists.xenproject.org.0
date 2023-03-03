Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F946A8F67
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 03:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505525.778347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXvTQ-0008CU-Hg; Fri, 03 Mar 2023 02:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505525.778347; Fri, 03 Mar 2023 02:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXvTQ-00089g-EA; Fri, 03 Mar 2023 02:48:44 +0000
Received: by outflank-mailman (input) for mailman id 505525;
 Fri, 03 Mar 2023 02:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXvTO-00089Y-Bi
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 02:48:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ffa7c2-b96d-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 03:48:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A3FEB8163F;
 Fri,  3 Mar 2023 02:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FA8C433EF;
 Fri,  3 Mar 2023 02:48:37 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e6ffa7c2-b96d-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677811717;
	bh=jeCFFFuYgPziLGsiBGVik8P5LKhLPBBfuntr3gfz8ks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cDxc1C94MnCNKuNLsyOKyXub3UzdwSH/u5J4x0u2z1p5HylY2TnbyFD/AOUMbyT/f
	 /xVh2xY9Ahg/uiaIemF0/LyiGrMlVXAbvnaEE3lm8y7OVO8EnDlz5kEFY6QshFWI4l
	 A1YuZoLFmKvlgpqnRZ2JiFOkRUJY7Y8Gq+qO1HmzgMhed+rPLgIqui3rEC4x7y7o66
	 tHsiXZdnC0qLb0ax8fQ59ORhj5Gy5/RjkFUXVuTTRq4XJ8zEliCd96PRe6VOx5OJ+8
	 o+WDDS49NS9ZGG96Mge68aRoLvNo7gMeW6o4SPc6S9Uf/F5YbM2KV0jmSEMs3QuX1z
	 /a+S0d/o15SNA==
Date: Thu, 2 Mar 2023 18:48:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC XEN PATCH 0/7] automation, RFC prototype, Have GitLab CI
 built its own containers
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2303021836450.863724@ubuntu-linux-20-04-desktop>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2023, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-auto-rebuild-v1
> 
> Hi,
> 
> I have done some research to be able to build containers in the CI. This works
> only for x86 containers as I've setup only a single x86 gitlab-runner to be
> able to run docker-in-docker.
> 
> The runner is setup to only accept jobs from a branch that is "protected" in
> gitlab. Also, one need credential to push to the container register, those are
> called "Group deploy tokens", and I've set the variables CI_DEPLOY_USER and
> CI_DEPLOY_PASSWORD in the project "xen-project/xen" (variables only visible on
> a pipeline running on a protected branch).
> 
> These patch introduce quite a lot of redundancies in jobs, 2 new jobs per
> containers which build/push containers, and duplicate most of build.yaml.
> This mean that if we go with this, we have to duplicate and keep in sync many
> jobs.
> 
> To avoid having to do the duplicated jobs by hand, I could look at
> creating a script that use "build.yaml" as input and produce the 3
> stages needed to update a container, but that script would need to be
> run by hand, as gitlab can't really use it, unless ..
> 
> I've look at generated pipeline, and they look like this in gitlab:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/777665738
> But the result of the generated/child pipeline doesn't seems to be taken into
> account in the original pipeline, which make me think that we can't use them to
> generate "build.yaml". But maybe the could be use for generating the pipeline
> that will update a container.
> Doc:
>     https://docs.gitlab.com/ee/ci/pipelines/downstream_pipelines.html#dynamic-child-pipelines
> 
> So, with all of this, is it reasonable to test containers before
> pushing them to production? Or is it to much work? We could simply have jobs
> tacking care of rebuilding a container and pushing them to production without
> testing.

I don't think it is a good idea to duplicate build.yaml, also because
some of the containers are used in the testing stage too, so an updated
container could be OK during the build phase and break the testing
phase. We would need to duplicate both build.yaml and test.yaml, which
is not feasible.

In practice today people either:
1) re-build a container locally & test it locally before pushing
2) re-build a container locally, docker push it, then run a private
   gitlab pipeline, if it passes send out a patch to xen-devel

1) is not affected by this series
2) is also not affected because by the time the pipeline is created, the
container is already updated

However, there are cases where it would definitely be nice to have a
"button" to press to update a container. For instance, when a pipeline
failis due to a Debian unstable apt-get failure, which can be easily fixed
by updating the Debian unstable container.

So I think it would be nice to have jobs that can automatically update
the build containers but I would set them to manually trigger instead of
automatically (when: manual).


Alternatively, we could move the "containers.yaml" stage to be the first
step, rebuild the containers and push them to a "staging" area
(registry.gitlab.com/xen-project/xen/staging), run the build and test
steps fetching from the staging area instead of the regular, if all
tests pass, then push the containers to
registry.gitlab.com/xen-project/xen as last step.


> An example with the variable DO_REBUILD_CONTAINER and PUSH_CONTAINER set (and
> existing build/test jobs disabled):
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/791711467
> 
> Cheers,
> 
> Anthony PERARD (7):
>   automation: Automatically rebuild debian:unstable container
>   automation: Introduce test-containers stage
>   automation: Add a template per container for build jobs.
>   automation: Adding containers build jobs and test of thoses
>   automation: Introduce DO_REBUILD_CONTAINER, to allow to rebuild a
>     container
>   automation: Push container been tested
>   automation: Add some more push containers jobs
> 
>  .gitlab-ci.yml                            |   6 +
>  automation/build/Makefile                 |  14 +-
>  automation/gitlab-ci/build.yaml           | 327 ++++++++------
>  automation/gitlab-ci/containers.yaml      |  98 +++++
>  automation/gitlab-ci/push-containers.yaml |  79 ++++
>  automation/gitlab-ci/test-containers.yaml | 496 ++++++++++++++++++++++
>  6 files changed, 894 insertions(+), 126 deletions(-)
>  create mode 100644 automation/gitlab-ci/containers.yaml
>  create mode 100644 automation/gitlab-ci/push-containers.yaml
>  create mode 100644 automation/gitlab-ci/test-containers.yaml
> 
> -- 
> Anthony PERARD
> 

