Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD5624BBE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 21:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442185.696238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otE7H-0000j1-VH; Thu, 10 Nov 2022 20:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442185.696238; Thu, 10 Nov 2022 20:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otE7H-0000fx-SV; Thu, 10 Nov 2022 20:25:39 +0000
Received: by outflank-mailman (input) for mailman id 442185;
 Thu, 10 Nov 2022 20:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otE7G-0000fr-4K
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 20:25:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5498d2d-6135-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 21:25:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 506A961E38;
 Thu, 10 Nov 2022 20:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E377C433D6;
 Thu, 10 Nov 2022 20:25:33 +0000 (UTC)
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
X-Inumbo-ID: d5498d2d-6135-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668111934;
	bh=Dj9JLbk/XgYmb3XuISwvjPsoDAkGQpAnCPw8tAHRoYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=awlsCD8msUaKXo/JjwU06KDw9vgH8akIuASeBUi1KGArcW+cD5f4Bc6oDKuQAedI9
	 8LHGuF510AJJnPQGfbgRsQvskoICm/FSzGR2NHY8eRyQCZ7Vpdi3/4/Mg5g73SJwA9
	 IbaIb4Vv/5RLqpR4oKCc36pYDRwRkITr3MCJTma4mA4tGG2SHGoiPnWsfTTwfTa0WH
	 3KspnrDg7XCmYGFgsqRYbf+NfAeQstOq9kqEF38OZoyzurwdtkVOOnA8+qVqKQH/59
	 Ne0+Jglv77Rj0xJEZyoB0K5rMXaODXW4ka8clq3v6clxOxOTuYbEoBlfhFVF9gdUeB
	 wrGsHO+J80i9A==
Date: Thu, 10 Nov 2022 12:25:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
In-Reply-To: <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211101222230.50442@ubuntu-linux-20-04-desktop>
References: <cover.1667224593.git.bertrand.marquis@arm.com> <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com> <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com> <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com> <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
 <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Nov 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 10/11/2022 01:18, Stefano Stabellini wrote:
> > 
> > 
> > On Mon, 7 Nov 2022, Michal Orzel wrote:
> >> Hi Bertrand and Stefano,
> >>
> >> On 31/10/2022 16:00, Bertrand Marquis wrote:
> >>>
> >>>
> >>> Hi Michal,
> >>>
> >>>> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
> >>>>
> >>>> Hi Bertrand,
> >>>>
> >>>> On 31/10/2022 15:00, Bertrand Marquis wrote:
> >>>>>
> >>>>>
> >>>>> This patch series is a first attempt to check if we could use Yocto in
> >>>>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> >>>>>
> >>>>> The first patch is creating a container with all elements required to
> >>>>> build Yocto, a checkout of the yocto layers required and an helper
> >>>>> script to build and run xen on qemu with yocto.
> >>>>>
> >>>>> The second patch is creating containers with a first build of yocto done
> >>>>> so that susbsequent build with those containers would only rebuild what
> >>>>> was changed and take the rest from the cache.
> >>>>>
> >>>>> The third patch is adding a way to easily clean locally created
> >>>>> containers.
> >>>>>
> >>>>> This is is mainly for discussion and sharing as there are still some
> >>>>> issues/problem to solve:
> >>>>> - building the qemu* containers can take several hours depending on the
> >>>>>  network bandwith and computing power of the machine where those are
> >>>>>  created
> >>>> This is not really an issue as the build of the containers occurs on the local
> >>>> machines before pushing them to registry. Also, building the containers
> >>>> will only be required for new Yocto releases.
> >>>>
> >>>>> - produced containers containing the cache have a size between 8 and
> >>>>>  12GB depending on the architecture. We might need to store the build
> >>>>>  cache somewhere else to reduce the size. If we choose to have one
> >>>>>  single image, the needed size is around 20GB and we need up to 40GB
> >>>>>  during the build, which is why I splitted them.
> >>>>> - during the build and run, we use a bit more then 20GB of disk which is
> >>>>>  over the allowed size in gitlab
> >>>> As we could see during v2 testing, we do not have any space restrictions
> >>>> on the Xen GitLab and I think we already decided to have the Yocto
> >>>> integrated into our CI.
> >>>
> >>> Right, I should have modified this chapter to be coherent with your latest tests.
> >>> Sorry for that.
> >>>
> >>>>
> >>>> I will do some testing and get back to you with results + review.
> >> I did some testing and here are the results:
> >>
> >> In the current form this series will fail when running CI because the Yocto containers
> >> are based on "From ubuntu:22.04" (there is no platform prefix), which means that the containers
> >> are built for the host architecture (in my case and in 99% of the cases of the local build it will
> >> be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means that all the test jobs would need
> >> to specify x86_64 as a tag when keeping the current behavior.
> >> After I built all the containers on my x86 machine, I pushed them to registry and the pipeline was successful:
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F686853939&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C2449f063e67341c3b95a08dac2b112a5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638036363027707274%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=EwTJrW2vuwQIugKc7mnzG9NNbsYLP6tw5UODzBMmPEE%3D&amp;reserved=0
> > 
> > When I tested the previous version of this series I built the
> > containers natively on ARM64, so that is also an option.
> > 
> > 
> >> Here is the diff on patch no. 3 to make the series work (using x86 tag and small improvement to include needs: []):
> >> ```
> >> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> >> index 5c620fefce59..52cccec6f904 100644
> >> --- a/automation/gitlab-ci/test.yaml
> >> +++ b/automation/gitlab-ci/test.yaml
> >> @@ -65,6 +65,9 @@
> >>      paths:
> >>        - 'logs/*'
> >>      when: always
> >> +  needs: []
> >> +  tags:
> >> +    - x86_64
> >>
> >>  # Test jobs
> >>  build-each-commit-gcc:
> >> @@ -206,19 +209,13 @@ yocto-qemuarm64:
> >>    extends: .yocto-test
> >>    variables:
> >>      YOCTO_BOARD: qemuarm64
> >> -  tags:
> >> -    - arm64
> >>
> >>  yocto-qemuarm:
> >>    extends: .yocto-test
> >>    variables:
> >>      YOCTO_BOARD: qemuarm
> >> -  tags:
> >> -    - arm32
> >>
> >>  yocto-qemux86-64:
> >>    extends: .yocto-test
> >>    variables:
> >>      YOCTO_BOARD: qemux86-64
> >> -  tags:
> >> -    - x86_64
> >> ```
> >>
> >> Now, the logical way would be to build x86 yocto container for x86, arm64 for arm64 and arm32 on arm64 or x86.
> >> I tried building the container qemuarm64 specifying target arm64 on x86. After 15h, only 70% of the Yocto build
> >> was completed and there was an error with glibc (the local build of the container for the host arch takes on my machine max 2h).
> >> This enormous amount of time is due to the qemu docker emulation that happens behind the scenes (I checked on 2 different machines).
> >>
> >> So we have 3 solutions:
> >> 1) Build and run these containers for/on x86_64:
> >>  - local users can build the containers on local machines that are almost always x86 based, in short period of time,
> >>  - "everyone" can build/push the containers once there is a new Yocto release
> >>  - slightly slower CI build time
> >> 2) Build and run these containers for specific architectures:
> >>  - almost no go for local users using x86 machine (unless using more than 16 threads (which I used) and willing to wait 2 days for the build)
> >>  - faster CI build time (arm64 runner is faster than x86 one)
> >>  - someone with arm64 based machine (not that common) would have to build and push the containers
> >> 3) Try to use CI to build and push the containers to registry
> >>  - it could be possible but what about local users
> > 
> > From a gitlab-ci perspective, given the runners we currently have, we
> > have to go with option 2). We don't have enough resources available on
> > the x86 runner to run the Yocto jobs on x86.
> > 
> That is what I reckon too. Running the Yocto build/test on CI using x86 runner will always be slower.
> So, if we go with this solution, then the following is needed:
> 1. Modify test jobs so that yocto-qemu{arm64/arm} uses arm64 tag to be taken by arm64 runner and use tag x86_64 for yocto-qemux86-64.
> 2. Come up with a solution to build the yocto containers automatically for the above platforms + possibility to specify the platform for local users.
>    Right now, these containers are being always build for the host machine platform, so without doing tricks like adding --platform or prefix to image name,
>    one cannot build the Yocto containers that would be ready to be pushed to registry. We need to have a clean solution without requiring user to do tricks.
> 
> The only drawback of this solution is that the person building the yocto-qemu{arm64/arm} container and willing to push it to registry,
> needs to have access to arm64 machine.

I am fine with this drawback for now.

Due to resource constraints, we might want to avoid adding
yocto-qemux86-64 (if yocto-qemux86-64 has to run on x86) for now, I
worry it might choke the x86 ci-loop. Or we could add it but keep it
disabled. We'll enable it when we get better x86 runners. 

