Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A905E85A1
	for <lists+xen-devel@lfdr.de>; Sat, 24 Sep 2022 00:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410949.654124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obqtv-0003AL-Jf; Fri, 23 Sep 2022 22:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410949.654124; Fri, 23 Sep 2022 22:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obqtv-00037R-Gs; Fri, 23 Sep 2022 22:12:03 +0000
Received: by outflank-mailman (input) for mailman id 410949;
 Fri, 23 Sep 2022 22:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNmR=Z2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obqtu-000356-KJ
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 22:12:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id becb9674-3b8c-11ed-9647-05401a9f4f97;
 Sat, 24 Sep 2022 00:12:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4B8760FEE;
 Fri, 23 Sep 2022 22:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9787EC433D6;
 Fri, 23 Sep 2022 22:11:58 +0000 (UTC)
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
X-Inumbo-ID: becb9674-3b8c-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663971119;
	bh=O+/jfqgMbs6IbNhItwGyUJuRn1/lHjc2KMA9oEe7BqA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jsodTRrCp1Q2c4K1Mjt9r0vCxoI7okjQDdKJgO4PpKI09+jfaLUEMQnJR3bOBcE2G
	 mAa2pGPdizh6aVotaGqArDFXyUHkF0vtvJEgLkNxPTtvNeVbMfzkLQVelD1tzvq3cL
	 2+T5z2HvayxRGu8yp0WJsINLtWBbGKjcWorCQg+i0lIUwcqjLnwgUJbIQ7G4zeL/Ld
	 KspDT8+RvoZjUKSvB5EXk6q7wkU6MrVXkF0kxevuI1OLEfiHu7TVDOjeOOChdqb6fm
	 OWf92a2xCT8AXuEnJ01Wef/YMqOM/SaETCPovr+bhkRlQf5gQ4SibWgrJgncHPt4iB
	 taLkW4gSyVaVg==
Date: Fri, 23 Sep 2022 15:11:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/9] automation: Add debug versions of Arm tests
In-Reply-To: <2ca7482d-65a9-8ac4-c6ad-2157a5d4f6b6@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209231511310.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-4-michal.orzel@amd.com> <alpine.DEB.2.22.394.2209221444340.65421@ubuntu-linux-20-04-desktop> <2ca7482d-65a9-8ac4-c6ad-2157a5d4f6b6@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Sep 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 22/09/2022 23:53, Stefano Stabellini wrote:
> > 
> > 
> > On Thu, 22 Sep 2022, Michal Orzel wrote:
> >> At the moment, all the tests are executed on non-debug Xen builds.
> >> To improve the coverage (e.g. we might catch some asserts), add new
> >> test jobs using debug Xen builds.
> > 
> > This is interesting. On one hand, I agree it is good to test DEBUG and
> > non-DEBUG builds in runtime tests too, on the other hand I am worried
> > about our test capacity.
> 
> We still have plenty of capacity. We can add many more Arm tests because
> Arm machine is very powerful. I reckon that adding more x86 tests would
> have a performance impact but not the other way around. See below.
> 
> > 
> > I take you have tried a few pipelines -- are the additional tests
> > causing the pipeline to take longer? Do we still have "room" because x86
> > is slower? What's your thinking?
> > 
> 
> With the additional tests introduced by this patch one cannot observe any
> impact for the performance. I ran several tests and the pipeline finishes
> in the same time or faster.
> 
> Performance comparison:
> current master: 92 jobs (82 minutes, 19 seconds)
> master + my series: 103 jobs (79 minutes, 40 seconds)
> 
> That said, let's improve the coverage and add these non-debug tests for Arm.

ahah WOW OK then


> > One idea would be to only do:
> > - qemu-alpine-arm64-gcc-debug
> > - qemu-smoke-arm64-gcc-debug
> > 
> > and not the others
> > 
> > 
> >> Take the opportunity to increase RAM size for QEMU from 1GB to 2GB
> >> in qemu-smoke-arm64.sh as the debug builds take more space and we might
> >> end up in a situation when there is not enough free space (especially
> >> during a static memory test that reserves some region in the middle).
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  automation/gitlab-ci/build.yaml        | 16 +++++
> >>  automation/gitlab-ci/test.yaml         | 93 ++++++++++++++++++++++++++
> >>  automation/scripts/qemu-smoke-arm64.sh |  6 +-
> >>  3 files changed, 112 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> >> index d931441b910a..6ce92531f61f 100644
> >> --- a/automation/gitlab-ci/build.yaml
> >> +++ b/automation/gitlab-ci/build.yaml
> >> @@ -587,6 +587,15 @@ alpine-3.12-gcc-arm64-staticmem:
> >>        CONFIG_UNSUPPORTED=y
> >>        CONFIG_STATIC_MEMORY=y
> >>
> >> +alpine-3.12-gcc-debug-arm64-staticmem:
> >> +  extends: .gcc-arm64-build-debug
> >> +  variables:
> >> +    CONTAINER: alpine:3.12-arm64v8
> >> +    EXTRA_XEN_CONFIG: |
> >> +      CONFIG_EXPERT=y
> >> +      CONFIG_UNSUPPORTED=y
> >> +      CONFIG_STATIC_MEMORY=y
> >> +
> >>  alpine-3.12-gcc-arm64-boot-cpupools:
> >>    extends: .gcc-arm64-build
> >>    variables:
> >> @@ -594,6 +603,13 @@ alpine-3.12-gcc-arm64-boot-cpupools:
> >>      EXTRA_XEN_CONFIG: |
> >>        CONFIG_BOOT_TIME_CPUPOOLS=y
> >>
> >> +alpine-3.12-gcc-debug-arm64-boot-cpupools:
> >> +  extends: .gcc-arm64-build-debug
> >> +  variables:
> >> +    CONTAINER: alpine:3.12-arm64v8
> >> +    EXTRA_XEN_CONFIG: |
> >> +      CONFIG_BOOT_TIME_CPUPOOLS=y
> >> +
> >>  ## Test artifacts common
> >>
> >>  .test-jobs-artifact-common:
> >> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> >> index 4f96e6e322de..1b51030c6175 100644
> >> --- a/automation/gitlab-ci/test.yaml
> >> +++ b/automation/gitlab-ci/test.yaml
> >> @@ -44,6 +44,25 @@ qemu-alpine-arm64-gcc:
> >>    tags:
> >>      - arm64
> >>
> >> +qemu-alpine-arm64-gcc-debug:
> >> +  extends: .test-jobs-common
> >> +  variables:
> >> +    CONTAINER: debian:unstable-arm64v8
> >> +  script:
> >> +    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> >> +  needs:
> >> +    - alpine-3.12-gcc-debug-arm64
> >> +    - alpine-3.12-arm64-rootfs-export
> >> +    - kernel-5.19-arm64-export
> >> +    - qemu-system-aarch64-6.0.0-arm64-export
> >> +  artifacts:
> >> +    paths:
> >> +      - smoke.serial
> >> +      - '*.log'
> >> +    when: always
> >> +  tags:
> >> +    - arm64
> >> +
> >>  qemu-alpine-x86_64-gcc:
> >>    extends: .test-jobs-common
> >>    variables:
> >> @@ -81,6 +100,25 @@ qemu-smoke-arm64-gcc:
> >>    tags:
> >>      - arm64
> >>
> >> +qemu-smoke-arm64-gcc-debug:
> >> +  extends: .test-jobs-common
> >> +  variables:
> >> +    CONTAINER: debian:unstable-arm64v8
> >> +  script:
> >> +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> >> +  needs:
> >> +    - alpine-3.12-gcc-debug-arm64
> >> +    - alpine-3.12-arm64-rootfs-export
> >> +    - kernel-5.19-arm64-export
> >> +    - qemu-system-aarch64-6.0.0-arm64-export
> >> +  artifacts:
> >> +    paths:
> >> +      - smoke.serial
> >> +      - '*.log'
> >> +    when: always
> >> +  tags:
> >> +    - arm64
> >> +
> >>  qemu-smoke-arm64-gcc-staticmem:
> >>    extends: .test-jobs-common
> >>    variables:
> >> @@ -100,6 +138,25 @@ qemu-smoke-arm64-gcc-staticmem:
> >>    tags:
> >>      - arm64
> >>
> >> +qemu-smoke-arm64-gcc-debug-staticmem:
> >> +  extends: .test-jobs-common
> >> +  variables:
> >> +    CONTAINER: debian:unstable-arm64v8
> >> +  script:
> >> +    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> >> +  needs:
> >> +    - alpine-3.12-gcc-debug-arm64-staticmem
> >> +    - alpine-3.12-arm64-rootfs-export
> >> +    - kernel-5.19-arm64-export
> >> +    - qemu-system-aarch64-6.0.0-arm64-export
> >> +  artifacts:
> >> +    paths:
> >> +      - smoke.serial
> >> +      - '*.log'
> >> +    when: always
> >> +  tags:
> >> +    - arm64
> >> +
> >>  qemu-smoke-arm64-gcc-boot-cpupools:
> >>    extends: .test-jobs-common
> >>    variables:
> >> @@ -119,6 +176,25 @@ qemu-smoke-arm64-gcc-boot-cpupools:
> >>    tags:
> >>      - arm64
> >>
> >> +qemu-smoke-arm64-gcc-debug-boot-cpupools:
> >> +  extends: .test-jobs-common
> >> +  variables:
> >> +    CONTAINER: debian:unstable-arm64v8
> >> +  script:
> >> +    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> >> +  needs:
> >> +    - alpine-3.12-gcc-debug-arm64-boot-cpupools
> >> +    - alpine-3.12-arm64-rootfs-export
> >> +    - kernel-5.19-arm64-export
> >> +    - qemu-system-aarch64-6.0.0-arm64-export
> >> +  artifacts:
> >> +    paths:
> >> +      - smoke.serial
> >> +      - '*.log'
> >> +    when: always
> >> +  tags:
> >> +    - arm64
> >> +
> >>  qemu-smoke-arm32-gcc:
> >>    extends: .test-jobs-common
> >>    variables:
> >> @@ -136,6 +212,23 @@ qemu-smoke-arm32-gcc:
> >>    tags:
> >>      - arm64
> >>
> >> +qemu-smoke-arm32-gcc-debug:
> >> +  extends: .test-jobs-common
> >> +  variables:
> >> +    CONTAINER: debian:unstable-arm64v8
> >> +  script:
> >> +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> >> +  needs:
> >> +    - debian-unstable-gcc-arm32-debug
> >> +    - qemu-system-aarch64-6.0.0-arm32-export
> >> +  artifacts:
> >> +    paths:
> >> +      - smoke.serial
> >> +      - '*.log'
> >> +    when: always
> >> +  tags:
> >> +    - arm64
> >> +
> >>  qemu-smoke-x86-64-gcc:
> >>    extends: .test-jobs-common
> >>    variables:
> >> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> >> index f803835779f4..dea26c6c0a8f 100755
> >> --- a/automation/scripts/qemu-smoke-arm64.sh
> >> +++ b/automation/scripts/qemu-smoke-arm64.sh
> >> @@ -52,7 +52,7 @@ curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cf6b0b8fabb02478b009c08da9ce4eac9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994804254367719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=jgGdO93kLoieg6UqajFWYAsufvvv5mZVYHD%2B7fUW7ME%3D&amp;reserved=0
> >>  ./binaries/qemu-system-aarch64 \
> >>     -machine virtualization=true \
> >>     -cpu cortex-a57 -machine type=virt \
> >> -   -m 1024 -smp 2 -display none \
> >> +   -m 2048 -smp 2 -display none \
> >>     -machine dumpdtb=binaries/virt-gicv2.dtb
> >>
> >>  # XXX disable pl061 to avoid Linux crash
> >> @@ -117,7 +117,7 @@ cd ..
> >>
> >>  # ImageBuilder
> >>  echo 'MEMORY_START="0x40000000"
> >> -MEMORY_END="0x80000000"
> >> +MEMORY_END="0xC0000000"
> >>
> >>  DEVICE_TREE="virt-gicv2.dtb"
> >>  XEN="xen"
> >> @@ -158,7 +158,7 @@ timeout -k 1 240 \
> >>  ./binaries/qemu-system-aarch64 \
> >>      -machine virtualization=true \
> >>      -cpu cortex-a57 -machine type=virt \
> >> -    -m 1024 -monitor none -serial stdio \
> >> +    -m 2048 -monitor none -serial stdio \
> >>      -smp 2 \
> >>      -no-reboot \
> >>      -device virtio-net-pci,netdev=n0 \
> > 
> > The changes to qemu-smoke-arm64.sh make sense, but could you move them
> > to a separate patch in case we need to do any backports?
> 
> Ok, I will do a prerequisite patch for that one.
> 
> > 
> > Also I would change MEMORY_END to 0xC0000000 in qemu-alpine-arm64.sh too
> > for uniformity.
> 
> I already did that in patch [6/9] automation: qemu-alpine-arm64: Cleanup and fixes.
> 
> ~Michal
> 

