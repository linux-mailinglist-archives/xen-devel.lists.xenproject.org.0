Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB56AA096
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 21:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506207.779304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYC0J-0006aj-EB; Fri, 03 Mar 2023 20:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506207.779304; Fri, 03 Mar 2023 20:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYC0J-0006YI-B2; Fri, 03 Mar 2023 20:27:47 +0000
Received: by outflank-mailman (input) for mailman id 506207;
 Fri, 03 Mar 2023 20:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pYC0H-0006YB-ER
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 20:27:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da22360f-ba01-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 21:27:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA6626185C;
 Fri,  3 Mar 2023 20:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFA1C433EF;
 Fri,  3 Mar 2023 20:27:41 +0000 (UTC)
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
X-Inumbo-ID: da22360f-ba01-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677875262;
	bh=WYj1mn/QFLSAHMXcUhqepuvhkvu+QKfmUvgsXjfFubU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OJhnKaUjuGFuzxuuu5irL0/mT9U1z27vi5PWGKyrwWCEkGFxEBBpxtyHIjnDwCcVn
	 csseuNVfM8csJ83Lm6B8YkFCF8DhnLmI4oHq379m6hHLxLi95K61hLeaQEEBGes3kl
	 XatdZ/rJ5aJF/4tvAYfUSRSECwEFPjUkan51KkNHRs44r/S1bYWzhc6L1ZkkG9TkMz
	 3vHTgE6nunYhT3l+bLe/x4tjN8N/E3y/4JgwTygN5Z9Se/CKgtNZiTLtTqQb7GP+jq
	 KmaySuSQ3q88WgU79GqmJpxzmC3LJntgVdHxu9Eau2djaP/bcVrfnW8I0o3T1sFJmy
	 DEhyFdj3TWqLg==
Date: Fri, 3 Mar 2023 12:27:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC XEN PATCH 0/7] automation, RFC prototype, Have GitLab CI
 built its own containers
In-Reply-To: <ZAItWIy7oUqRmulW@perard>
Message-ID: <alpine.DEB.2.22.394.2303031223160.863724@ubuntu-linux-20-04-desktop>
References: <20230302175332.56052-1-anthony.perard@citrix.com> <alpine.DEB.2.22.394.2303021836450.863724@ubuntu-linux-20-04-desktop> <ZAItWIy7oUqRmulW@perard>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Mar 2023, Anthony PERARD wrote:
> On Thu, Mar 02, 2023 at 06:48:35PM -0800, Stefano Stabellini wrote:
> > On Thu, 2 Mar 2023, Anthony PERARD wrote:
> > > Patch series available in this git branch:
> > > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-auto-rebuild-v1
> > > 
> > > Hi,
> > > 
> > > I have done some research to be able to build containers in the CI. This works
> > > only for x86 containers as I've setup only a single x86 gitlab-runner to be
> > > able to run docker-in-docker.
> > > 
> > > The runner is setup to only accept jobs from a branch that is "protected" in
> > > gitlab. Also, one need credential to push to the container register, those are
> > > called "Group deploy tokens", and I've set the variables CI_DEPLOY_USER and
> > > CI_DEPLOY_PASSWORD in the project "xen-project/xen" (variables only visible on
> > > a pipeline running on a protected branch).
> > > 
> > > These patch introduce quite a lot of redundancies in jobs, 2 new jobs per
> > > containers which build/push containers, and duplicate most of build.yaml.
> > > This mean that if we go with this, we have to duplicate and keep in sync many
> > > jobs.
> > > 
> > > To avoid having to do the duplicated jobs by hand, I could look at
> > > creating a script that use "build.yaml" as input and produce the 3
> > > stages needed to update a container, but that script would need to be
> > > run by hand, as gitlab can't really use it, unless ..
> > > 
> > > I've look at generated pipeline, and they look like this in gitlab:
> > >     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/777665738
> > > But the result of the generated/child pipeline doesn't seems to be taken into
> > > account in the original pipeline, which make me think that we can't use them to
> > > generate "build.yaml". But maybe the could be use for generating the pipeline
> > > that will update a container.
> > > Doc:
> > >     https://docs.gitlab.com/ee/ci/pipelines/downstream_pipelines.html#dynamic-child-pipelines
> > > 
> > > So, with all of this, is it reasonable to test containers before
> > > pushing them to production? Or is it to much work? We could simply have jobs
> > > tacking care of rebuilding a container and pushing them to production without
> > > testing.
> > 
> > I don't think it is a good idea to duplicate build.yaml, also because
> > some of the containers are used in the testing stage too, so an updated
> > container could be OK during the build phase and break the testing
> > phase. We would need to duplicate both build.yaml and test.yaml, which
> > is not feasible.
> > 
> > In practice today people either:
> > 1) re-build a container locally & test it locally before pushing
> > 2) re-build a container locally, docker push it, then run a private
> >    gitlab pipeline, if it passes send out a patch to xen-devel
> > 
> > 1) is not affected by this series
> > 2) is also not affected because by the time the pipeline is created, the
> > container is already updated
> > 
> > However, there are cases where it would definitely be nice to have a
> > "button" to press to update a container. For instance, when a pipeline
> > failis due to a Debian unstable apt-get failure, which can be easily fixed
> > by updating the Debian unstable container.
> > 
> > So I think it would be nice to have jobs that can automatically update
> > the build containers but I would set them to manually trigger instead of
> > automatically (when: manual).
> 
> What I was looking at with this work was to be able to have container
> been rebuild automatically on a schedule. We have/had containers that
> were 3yr old, and when it's a container that supposed to test the lasted
> version of a distro, or a rolling release distro, they are kind of
> useless if they aren't rebuild regularly. So I was looking to take the
> human out of the loop and have computers the tedious work of rebuilding a
> container every month or two.
> 
> Containers that needs to be rebuilt regularly to stay relevant are
> archlinux, debian/unstable, fedora/latest, propably opensuse/leap and
> opensuse/tumbleweed. I don't know if they are others.
 
OK. This use-case is very different from 1) and 2) below. In this case
the need to rebuild the container does not come from a change in the
Dockerfile made by a human (e.g. a contributor adding a package to
apt-get) but it comes from the fact that the underlying distro is
updated continuously so the containers should also be updated
continuously.

For this use-case specifically, I think it would be better to trigger
the jobs to do the containers update based on schedule, rather than a
change to the Dockerfile?

And also, given that there are supposed to be no breaking changes, it
would be more acceptable to do the containers update without testing it.
But it would still be nicer to run the tests as suggested below of
course.

 
> > Alternatively, we could move the "containers.yaml" stage to be the first
> > step, rebuild the containers and push them to a "staging" area
> > (registry.gitlab.com/xen-project/xen/staging), run the build and test
> > steps fetching from the staging area instead of the regular, if all
> > tests pass, then push the containers to
> > registry.gitlab.com/xen-project/xen as last step.
> 
> Sounds good, I can look into how easily it would be to use a different
> registry to run a pipeline.

Thanks!

