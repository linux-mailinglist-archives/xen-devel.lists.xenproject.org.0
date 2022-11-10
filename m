Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9162380F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 01:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441171.695508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osvGy-0000oK-6U; Thu, 10 Nov 2022 00:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441171.695508; Thu, 10 Nov 2022 00:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osvGy-0000li-3i; Thu, 10 Nov 2022 00:18:24 +0000
Received: by outflank-mailman (input) for mailman id 441171;
 Thu, 10 Nov 2022 00:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1osvGx-0000lc-75
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 00:18:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e858215-608d-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 01:18:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DB64615C2;
 Thu, 10 Nov 2022 00:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02D0C433C1;
 Thu, 10 Nov 2022 00:18:18 +0000 (UTC)
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
X-Inumbo-ID: 2e858215-608d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668039499;
	bh=I0LwEOAxJdce79XqClkPp/TO9IptgplIdaHd8nsIStU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZUQNF86cwqhApgSgCq7SGxj6j9EzLt7A1ArSvjmZgySCUWhulN3H75bWZFbxRB6xd
	 g+d7y+tn0+hvGse0Tez+ogrr4QDl/pLKpbqbFimn4rtGx7mcQHTiEU2nL3tTHhMNmR
	 i1GEP73C2ueEGkSU+0nMbW2K2TG9cLPvZoae7qd88/+dNh0uOwpozRO0+VNJHTgpEM
	 hSN4ysleUtUsfpD9VhF6E/bPzH/58U7OkVL0cdWjMSCC1Eg/qaa+TIHFHumGsJdes/
	 XlTe1sNaAL+zwoM8YNxHJlskXY01ZwreME9eyQ7vOLXgWDAEHjbE1/eE/7XCBvj721
	 mWHVZB0Z/HV2A==
Date: Wed, 9 Nov 2022 16:18:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
In-Reply-To: <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
References: <cover.1667224593.git.bertrand.marquis@arm.com> <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com> <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com> <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Nov 2022, Michal Orzel wrote:
> Hi Bertrand and Stefano,
> 
> On 31/10/2022 16:00, Bertrand Marquis wrote:
> > 
> > 
> > Hi Michal,
> > 
> >> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
> >>
> >> Hi Bertrand,
> >>
> >> On 31/10/2022 15:00, Bertrand Marquis wrote:
> >>>
> >>>
> >>> This patch series is a first attempt to check if we could use Yocto in
> >>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> >>>
> >>> The first patch is creating a container with all elements required to
> >>> build Yocto, a checkout of the yocto layers required and an helper
> >>> script to build and run xen on qemu with yocto.
> >>>
> >>> The second patch is creating containers with a first build of yocto done
> >>> so that susbsequent build with those containers would only rebuild what
> >>> was changed and take the rest from the cache.
> >>>
> >>> The third patch is adding a way to easily clean locally created
> >>> containers.
> >>>
> >>> This is is mainly for discussion and sharing as there are still some
> >>> issues/problem to solve:
> >>> - building the qemu* containers can take several hours depending on the
> >>>  network bandwith and computing power of the machine where those are
> >>>  created
> >> This is not really an issue as the build of the containers occurs on the local
> >> machines before pushing them to registry. Also, building the containers
> >> will only be required for new Yocto releases.
> >>
> >>> - produced containers containing the cache have a size between 8 and
> >>>  12GB depending on the architecture. We might need to store the build
> >>>  cache somewhere else to reduce the size. If we choose to have one
> >>>  single image, the needed size is around 20GB and we need up to 40GB
> >>>  during the build, which is why I splitted them.
> >>> - during the build and run, we use a bit more then 20GB of disk which is
> >>>  over the allowed size in gitlab
> >> As we could see during v2 testing, we do not have any space restrictions
> >> on the Xen GitLab and I think we already decided to have the Yocto
> >> integrated into our CI.
> > 
> > Right, I should have modified this chapter to be coherent with your latest tests.
> > Sorry for that.
> > 
> >>
> >> I will do some testing and get back to you with results + review.
> I did some testing and here are the results:
> 
> In the current form this series will fail when running CI because the Yocto containers
> are based on "From ubuntu:22.04" (there is no platform prefix), which means that the containers
> are built for the host architecture (in my case and in 99% of the cases of the local build it will
> be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means that all the test jobs would need
> to specify x86_64 as a tag when keeping the current behavior.
> After I built all the containers on my x86 machine, I pushed them to registry and the pipeline was successful:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/686853939

When I tested the previous version of this series I built the
containers natively on ARM64, so that is also an option.


> Here is the diff on patch no. 3 to make the series work (using x86 tag and small improvement to include needs: []):
> ```
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 5c620fefce59..52cccec6f904 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -65,6 +65,9 @@
>      paths:
>        - 'logs/*'
>      when: always
> +  needs: []
> +  tags:
> +    - x86_64
>  
>  # Test jobs
>  build-each-commit-gcc:
> @@ -206,19 +209,13 @@ yocto-qemuarm64:
>    extends: .yocto-test
>    variables:
>      YOCTO_BOARD: qemuarm64
> -  tags:
> -    - arm64
>  
>  yocto-qemuarm:
>    extends: .yocto-test
>    variables:
>      YOCTO_BOARD: qemuarm
> -  tags:
> -    - arm32
>  
>  yocto-qemux86-64:
>    extends: .yocto-test
>    variables:
>      YOCTO_BOARD: qemux86-64
> -  tags:
> -    - x86_64
> ```
> 
> Now, the logical way would be to build x86 yocto container for x86, arm64 for arm64 and arm32 on arm64 or x86.
> I tried building the container qemuarm64 specifying target arm64 on x86. After 15h, only 70% of the Yocto build
> was completed and there was an error with glibc (the local build of the container for the host arch takes on my machine max 2h).
> This enormous amount of time is due to the qemu docker emulation that happens behind the scenes (I checked on 2 different machines).
> 
> So we have 3 solutions:
> 1) Build and run these containers for/on x86_64:
>  - local users can build the containers on local machines that are almost always x86 based, in short period of time,
>  - "everyone" can build/push the containers once there is a new Yocto release
>  - slightly slower CI build time
> 2) Build and run these containers for specific architectures:
>  - almost no go for local users using x86 machine (unless using more than 16 threads (which I used) and willing to wait 2 days for the build)
>  - faster CI build time (arm64 runner is faster than x86 one)
>  - someone with arm64 based machine (not that common) would have to build and push the containers
> 3) Try to use CI to build and push the containers to registry
>  - it could be possible but what about local users

From a gitlab-ci perspective, given the runners we currently have, we
have to go with option 2). We don't have enough resources available on
the x86 runner to run the Yocto jobs on x86.


> Regardless of what we chose, we need to keep in mind that the biggest advantage to the Yocto build/run is that
> it allows/should allow local users to perform basic testing for all the Xen supported architectures. This is because
> everything happens in one place with one command.

That's right, but it should be possible to allow the Yocto containers to
also build and run correctly locally on x86, right? The arm/x86 tag in
test.yaml doesn't matter when running the containers locally anyway.

