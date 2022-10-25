Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AC360C0C3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 03:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429454.680438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8Xq-0007H7-6T; Tue, 25 Oct 2022 01:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429454.680438; Tue, 25 Oct 2022 01:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8Xq-0007Dx-3m; Tue, 25 Oct 2022 01:15:54 +0000
Received: by outflank-mailman (input) for mailman id 429454;
 Tue, 25 Oct 2022 01:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1on8Xo-0007Dl-L1
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 01:15:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fe1c092-5402-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 03:15:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97A97616FE;
 Tue, 25 Oct 2022 01:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6987DC433D7;
 Tue, 25 Oct 2022 01:15:48 +0000 (UTC)
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
X-Inumbo-ID: 8fe1c092-5402-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666660549;
	bh=O4HwmCgTJmsMYtBlL/vTbq/qpgGlH+zi7yjo6BeKI8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oKhM41tPo4F7+06N0g0Ub8dC5hQuAt2+aSx7AcEo+m8NdQRCSSJCvD8OC/SploX47
	 MMqFzjXIpuz18gItGnQ3VIscA2mvpDaDcn/MIeB5s4HIVT36ASiJ55xoV3WhjmzI9y
	 zn8ruheq2WjzTJ+mB9YgoIp191SwYHqyDt1gq2x2sxIk+CCCgWcAfakZGPV2vJ4A/E
	 rr+ZGfVM7NtW4WQYauXWj/4R85Wyv8+X10q/b9N2TnQnWHB4UyUacl4NYqb6/UmnVa
	 pJjXMa3unIUZfBWWl7XutGW9VAG1IATEcuhOIOfS8Zdxe/X/VdOwrq3fPZE/veeHxW
	 keQOJwDdl57KA==
Date: Mon, 24 Oct 2022 18:15:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: test.yaml: Introduce templates to reduce
 the overhead
In-Reply-To: <b9da39df-8ec0-9255-1345-445f2a5b56e6@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210241815010.1151068@ubuntu-linux-20-04-desktop>
References: <20221019164246.5487-1-michal.orzel@amd.com> <alpine.DEB.2.22.394.2210211423560.3873@ubuntu-linux-20-04-desktop> <b9da39df-8ec0-9255-1345-445f2a5b56e6@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Oct 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 21/10/2022 23:42, Stefano Stabellini wrote:
> > 
> > 
> > On Wed, 19 Oct 2022, Michal Orzel wrote:
> >> At the moment, we define lots of test jobs in test.yaml, that make use
> >> of the same configuration sections like variables, tags, artifacts.
> >> Introduce templates (hidden jobs whose names start with a dot) to
> >> reduce the overhead and simplify the file (more than 100 lines saved).
> >> This way, the actual jobs can only specify sections that are unique
> >> to them.
> >>
> >> Most of the test jobs specify the same set of prerequisite jobs under needs
> >> property with just one additional being unique to the job itself. Introduce
> >> YAML anchors for that purpose, because when using extends, the needs property
> >> is not being merged (the parent property overwrites the child one).
> > 
> > I like the patch. Replying here on top because the diff below is not
> > very helpful.
> > 
> > When you say that "extends" overwrites the properties, do you mean that
> > "needs" in qemu-smoke-dom0-arm64-gcc overwrites "needs" in .qemu-arm64,
> > when qemu-smoke-dom0-arm64-gcc includes .qemu-arm64?
> Yes, exactly. The behavior depends on the property. For example, the variables
> section is merged but needs end up being overwritten. This is because the extends
> does not merge the keys (variables uses key: value, whereas needs does not).
> 
> > 
> > 
> > If there is no way to solve the overwrite problem then it is OK to use
> > YAML achors but is it possible to define the anchors outside of
> > .qemu-arm64/.qemu-arm32 ? It would make things a lot clearer in the
> > code. Maybe under a top level "definitions" key? The point is that
> > .qemu-arm64 and .qemu-arm32 should use the anchor rather than define the
> > anchor.
> It is possible to define anchors outside qemu-arm64/arm32. I decided to
> define them in these jobs because for me it looked cleaner (less lines of code).
> But I'm ok to carve them out if that is what you prefer. This would
> require dropping the needs property from the extend jobs, as they cannot make use
> of the anchors (overwrite issue), and using the anchors from real jobs (just like I did in this patch).

Yes that makes sense


> So we would have:
> 
> .arm64-test-needs: &arm64-test-needs
>   - alpine-3.12-arm64-rootfs-export
>   - kernel-5.19-arm64-export
>   - qemu-system-aarch64-6.0.0-arm64-export
> 
> .qemu-arm64:
>   extends: .test-jobs-common
>   variables:
>     CONTAINER: debian:unstable-arm64v8
>     LOGFILE: qemu-smoke-arm64.log
>   artifacts:
>     paths:
>       - smoke.serial
>       - '*.log'
>     when: always
>   tags:
>     - arm64
> 
> qemu-smoke-dom0-arm64-gcc:
>   extends: .qemu-arm64
>   script:
>     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
>   needs:
>     - *arm64-test-needs
>     - alpine-3.12-gcc-arm64

This looks better, thanks!

 
> > 
> > I wouldn't call it qemu-arm64-needs because it has things
> > like alpine-3.12-arm64-rootfs-export and kernel-5.19-arm64-export that
> > are not required by qemu-system-aarch64-6.0.0-arm64-export. If anything
> > qemu-system-aarch64-6.0.0-arm64-export needs CONTAINER:
> > debian:unstable-arm64v8.
> > 
> > So I would call the anchor something like "arm64-test-needs". Same
> > comment for the arm32 anchor.
> Ok, this naming sounds good to me.
> 
> > 
> > 
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >> This patch is based on the CI next branch where we already have several
> >> patches (already acked) to be merged into staging after the release:
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Ftree%2Fnext&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ca83af11b062b431b4f0908dab3ad2162%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019853419768862%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TZxie442G%2Bm6SP%2FemyPuv8dwCDXAv1Wxwe22yGQZaB4%3D&amp;reserved=0
> >>
> >> Tested pipeline:
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F671114820&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ca83af11b062b431b4f0908dab3ad2162%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019853419768862%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=tMwGAZUKyvDp%2BxmVdxUD1kg3uMagWdO2P1DjF5O3b2M%3D&amp;reserved=0
> >> ---
> >>  automation/gitlab-ci/test.yaml | 266 ++++++++++-----------------------
> >>  1 file changed, 80 insertions(+), 186 deletions(-)
> >>
> >> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> >> index 92e0a1f7c510..fc0884b12082 100644
> >> --- a/automation/gitlab-ci/test.yaml
> >> +++ b/automation/gitlab-ci/test.yaml
> >> @@ -7,32 +7,12 @@
> >>      - /^coverity-tested\/.*/
> >>      - /^stable-.*/
> >>
> >> -# Test jobs
> >> -build-each-commit-gcc:
> >> -  extends: .test-jobs-common
> >> -  variables:
> >> -    CONTAINER: debian:stretch
> >> -    XEN_TARGET_ARCH: x86_64
> >> -    CC: gcc
> >> -  script:
> >> -    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> >> -    - mv ../build-each-commit-gcc.log .
> >> -  artifacts:
> >> -    paths:
> >> -      - '*.log'
> >> -    when: always
> >> -  needs: []
> >> -  tags:
> >> -    - x86_64
> >> -
> >> -qemu-smoke-dom0-arm64-gcc:
> >> +.qemu-arm64:
> >>    extends: .test-jobs-common
> >>    variables:
> >>      CONTAINER: debian:unstable-arm64v8
> >> -  script:
> >> -    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> >> -  needs:
> >> -    - alpine-3.12-gcc-arm64
> >> +    LOGFILE: qemu-smoke-arm64.log
> >> +  needs: &qemu-arm64-needs
> >>      - alpine-3.12-arm64-rootfs-export
> >>      - kernel-5.19-arm64-export
> >>      - qemu-system-aarch64-6.0.0-arm64-export
> > 
> > LOGFILE should be listed among the artifacts (and maybe we can remove
> > *.log if it has become redundant?)
> *.log is not redundant because we have 4 logs to be stored, e.g.:
> - smoke.serial
> - config.log
> - build.log
> - qemu-smoke-arm64.log aka LOGFILE
> 
> So we can either have this:
> artifacts:
>   paths:
>     - smoke.serial
>     - '*.log'
> 
> or this:
> artifacts:
>   paths:
>     - smoke.serial
>     - ${LOGFILE}
>     - '*.log'
> 
> I would prefer the former (just as it is now) but if you prefer the latter, it is ok.

I agree with the former

