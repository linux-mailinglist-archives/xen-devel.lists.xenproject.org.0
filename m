Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812C6052D9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 00:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426049.674255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olHIN-0000KA-5u; Wed, 19 Oct 2022 22:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426049.674255; Wed, 19 Oct 2022 22:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olHIN-0000H3-23; Wed, 19 Oct 2022 22:12:15 +0000
Received: by outflank-mailman (input) for mailman id 426049;
 Wed, 19 Oct 2022 22:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PkOC=2U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olHIK-0000EC-Sr
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 22:12:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1443f764-4ffb-11ed-91b4-6bf2151ebd3b;
 Thu, 20 Oct 2022 00:12:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4817B825C4;
 Wed, 19 Oct 2022 22:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7180C433C1;
 Wed, 19 Oct 2022 22:12:08 +0000 (UTC)
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
X-Inumbo-ID: 1443f764-4ffb-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666217529;
	bh=GiCDD+yazSW/EflQT8JGbHTRXOwFuJcsOdaLcFeOPmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VmlNlQoTNDZLygd+1D0FU55cQoJoIt8t0u8l+ytM/VK3n/m7n6Mcmb5H/wSMWuJ+F
	 l8nIItmRcnCahf1dcJPNhAA1RZG3X5B8QyHG9Ezlg3+QRFAQaUndKhZaoXUxv201Ez
	 qBQ7CzZxFMUYZMK9wVcQu20W4DgjFB9ogcnYaoLcu1GM8tRCWy9AG10NdA2qUcSHdB
	 OiUCvDgcgOL1OPBhIsZsGaIGMO1LES/jDhos6+NwhiH4LvgswikakqV71fwwQi+mIN
	 Jr2lQKyW1pvMQlwzP6EAAJqOjWNU18KR4ucwhZN4fBY/1QfhZjecNbBjhF3VmVucVc
	 YUCXN6q9ff+kQ==
Date: Wed, 19 Oct 2022 15:12:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
In-Reply-To: <a1d2ab41-0d30-5d34-5a42-fb74b68d30f4@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210191511260.3873@ubuntu-linux-20-04-desktop>
References: <cover.1665561024.git.bertrand.marquis@arm.com> <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop> <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com> <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop> <56155bff-6229-05a4-7221-cd6aa5a1de8b@amd.com> <0070D1D1-F579-4E11-8A27-62D3D92DE896@arm.com> <a1d2ab41-0d30-5d34-5a42-fb74b68d30f4@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Oct 2022, Michal Orzel wrote:
> Hi Bertrand,
> 
> On 19/10/2022 12:40, Bertrand Marquis wrote:
> > 
> > 
> > Hi Michal,
> > 
> >> On 19 Oct 2022, at 10:06, Michal Orzel <michal.orzel@amd.com> wrote:
> >>
> >> Hi Stefano,
> >>
> >> On 19/10/2022 02:02, Stefano Stabellini wrote:
> >>>
> >>>
> >>> On Mon, 17 Oct 2022, Stefano Stabellini wrote:
> >>>> It should be
> >>>>
> >>>> BB_NUMBER_THREADS="2"
> >>>>
> >>>> but that worked! Let me a couple of more tests.
> >>>
> >>> I could run successfully a Yocto build test with qemuarm64 as target in
> >>> gitlab-ci, hurray! No size issues, no build time issues, everything was
> >>> fine. See:
> >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193051236&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C5f7fc3a161fe44b5954808dab1be5c3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017728406088513%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=2mb3N26wiz39RJNSA4KoIOt%2BG9X7EMDOWIpfKc2ZZOc%3D&amp;reserved=0
> >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193083119&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C5f7fc3a161fe44b5954808dab1be5c3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017728406088513%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=QhTFefS8NU1f7oLemB0Vtn%2BDCD%2BCnq1v1gEmlKCJt84%3D&amp;reserved=0
> >>>
> >>> I made the appended changes in top of this series.
> >>>
> >>> - I pushed registry.gitlab.com/xen-project/xen/yocto:kirkstone and
> >>>  registry.gitlab.com/xen-project/xen/yocto:kirkstone-qemuarm64
> >>> - for the gitlab-ci runs, we need to run build-yocto.sh from the copy in
> >>>  xen.git, not from a copy stored inside a container
> >>> - when building the kirkstone-qemuarm64 container the first time
> >>>  (outside of gitlab-ci) I used COPY and took the script from the local
> >>>  xen.git tree
> >>> - after a number of tests, I settled on: BB_NUMBER_THREADS="8" more than
> >>>  this and it breaks on some workstations, please add it
> >>> - I am running the yocto build on arm64 so that we can use the arm64
> >>>  hardware to do it in gitlab-ci
> >>>
> >>> Please feel free to incorporate these changes in your series, and add
> >>> corresponding changes for the qemuarm32 and qemux86 targets.
> >>>
> >>> I am looking forward to it! Almost there!
> >>>
> >>> Cheers,
> >>>
> >>> Stefano
> >>>
> >>>
> >>> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
> >>> index 0d31dad607..16f1dcc0a5 100755
> >>> --- a/automation/build/yocto/build-yocto.sh
> >>> +++ b/automation/build/yocto/build-yocto.sh
> >>> @@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
> >>> # Save some disk space
> >>> INHERIT += "rm_work"
> >>>
> >>> +# Reduce number of jobs
> >>> +BB_NUMBER_THREADS="8"
> >>> +
> >>> EOF
> >>>
> >>>     if [ "${do_localsrc}" = "y" ]; then
> >>> diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> >>> index f279a7af92..aea3fc1f3e 100644
> >>> --- a/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> >>> +++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> >>> @@ -16,7 +16,8 @@ ARG target=qemuarm64
> >>>
> >>> # This step can take one to several hours depending on your download bandwith
> >>> # and the speed of your computer
> >>> -RUN /home/$USER_NAME/bin/build-yocto.sh --dump-log $target
> >>> +COPY ./build-yocto.sh /
> >>> +RUN /build-yocto.sh --dump-log $target
> >>>
> >>> FROM $from_image
> >>>
> >>> diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/build/yocto/kirkstone.dockerfile
> >>> index 367a7863b6..ffbd91aa90 100644
> >>> --- a/automation/build/yocto/kirkstone.dockerfile
> >>> +++ b/automation/build/yocto/kirkstone.dockerfile
> >>> @@ -84,9 +84,6 @@ RUN mkdir -p /home/$USER_NAME/yocto-layers \
> >>>              /home/$USER_NAME/xen && \
> >>>     chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
> >>>
> >>> -# Copy the build script
> >>> -COPY build-yocto.sh /home/$USER_NAME/bin/
> >>> -
> >>> # clone yocto repositories we need
> >>> ARG yocto_version="kirkstone"
> >>> RUN for rep in \
> >>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> >>> index ddc2234faf..4b8bcde252 100644
> >>> --- a/automation/gitlab-ci/build.yaml
> >>> +++ b/automation/gitlab-ci/build.yaml
> >>> @@ -584,6 +584,22 @@ alpine-3.12-gcc-arm64-boot-cpupools:
> >>>     EXTRA_XEN_CONFIG: |
> >>>       CONFIG_BOOT_TIME_CPUPOOLS=y
> >>>
> >>> +yocto-kirkstone-qemuarm64:
> >>> +  stage: build
> >>> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> >>> +  script:
> >>> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` qemuarm64
> >>> +  variables:
> >>> +    CONTAINER: yocto:kirkstone-qemuarm64
> >>> +  artifacts:
> >>> +    paths:
> >>> +      - '*.log'
> >>> +      - '*/*.log'
> >> The above lines are not needed as the logs/* below will handle them all (logs are only stored in logs/).
> > 
> > Ack
> > 
> >>
> >>> +      - 'logs/*'
> >>> +    when: always
> >>> +  tags:
> >>> +    - arm64
> >>> +
> >> build-yocto.sh performs both build and run actions. I think it'd be better to move this into test.yaml in that case.
> >> The best would be to create one build job (specifying --no-run) in build.yaml and one test job (specifying --no-build) in test.yaml.
> >> This however would probably require marking path build/tmp/deploy/***/qemuarm64 as an build artifact. The question then is
> >> whether having this path would be enough for runqemu (Bertrand's opinion needed).
> > 
> > This will not be enough to run qemu as the qemu binary and its dependencies are in the build artifacts and not in deploy.
> > Splitting the build and run is not a good idea because the size of the artifact between the 2 will be huge.
> > 
> >>
> >> Apart from that there is an aspect of Yocto releases and the containers/tests names.
> >> Yocto needs to be up-to-date in order to properly build Xen+tools.
> >> This basically means that we will need to update the containers once
> >> per Yocto release. The old containers would still need to be stored in our CI container registry
> >> so that we can use CI for older versions of Xen. However, updating the containers would also require
> >> modifying the existing tests (for now we have e.g. yocto-kirkstone-qemuarm64 but in a month we will have
> >> to change them to yocto-langdale-qemuarm64). In a few years time this will result in several CI jobs
> >> that are the same but differ only in name/container. I would thus suggest to name the CI jobs like this:
> >> yocto-qemuarm64 (without yocto release name) and define the top-level YOCTO_CONTAINER variable to store
> >> the current yocto release container. This will solve the issue I described above.
> > 
> > I think we have no other way around this and we will need to have one Yocto release supported by Xen officially so
> > we will have to keep old docker images for old releases of Xen and move to newer versions of Yocto in staging when
> > it is needed.
> > 
> > We have to find a way for gitlab-ci to use the build.yaml contained inside the tree that is to be tested somehow so that gitlab would automatically take the right one.
> > Which means that build.yaml will be different between branches and contain the right version for the current branch.
> > 
> 
> What I suggest is that with each new yocto release, we add new docker container files and push them to registry.
> So we will end up in a registry having e.g. (arm64 as an example):
> - kirkstone-qemuarm64
> - langdale-qemuarm64
> We maintain only the one group of CI jobs whose names are generic (yocto-qemuarm64).
> After adding new containers for a new Yocto release, we modify the YOCTO_RELEASE variable
> to point to the latest yocto release containers.
> 
> test.yaml:
> ...
> # Yocto test jobs
> variables:
>   YOCTO_RELEASE: "kirkstone"
> 
> yocto-qemuarm64:
>   extends: .test-jobs-common
>   script:
>     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` qemuarm64
>   variables:
>     CONTAINER: yocto:${YOCTO_RELEASE}-qemuarm64
>   artifacts:
>     paths:
>       - 'logs/*'
>     when: always
>   tags:
>     - arm64
> 
> This means that:
> - on the current staging branch the YOCTO_RELEASE points to the latest containers (for the latest yocto release)
> - on the old stable branches the YOCTO_RELEASE points to the old containers (for the old yocto release).
 
I think that's a good idea

