Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EAA87586C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 21:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690029.1075648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riKOa-0004be-EG; Thu, 07 Mar 2024 20:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690029.1075648; Thu, 07 Mar 2024 20:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riKOa-0004Zj-BU; Thu, 07 Mar 2024 20:31:16 +0000
Received: by outflank-mailman (input) for mailman id 690029;
 Thu, 07 Mar 2024 20:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1riKOZ-0004Zd-7Y
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 20:31:15 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a197a177-dcc1-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 21:31:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2D1A3CE1F19;
 Thu,  7 Mar 2024 20:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B851DC43390;
 Thu,  7 Mar 2024 20:31:02 +0000 (UTC)
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
X-Inumbo-ID: a197a177-dcc1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709843463;
	bh=mUVcCyTLj0kXyQP9uUsYNjA19PfEYI17uNl1Kv1jVVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gBu3vI9BxBP3g3bhI4yxTBaYAvPtV5UXh4YtK4t7N4L1NIg5cqdUnZoQI+rRhboky
	 h/VQL/eHFUKrbTcoRlde1u22jKEXTZwidowjvmsuWmdF5xqRZxspQU+jnQfhpcUiTG
	 lV1PT9FKcE8MXUmr2oJknSLrMgqqxPD7QxqL/rV+2ML6px5Uu6ldfSsIFQdc5XLS88
	 BbvlZZmMjt22Mpn7Z8f1CzZuH/qu4ZY76fBuHvUcV2KqNO5FIFVzTHTh0+zFqhgWnI
	 ZpOlqzAiHHwiq9iiaDKabk1oHsQinfQMkg028A0zlVpa2wf4zKn2kXryGMgjKt9vpB
	 0drhPm2Gmv3Qg==
Date: Thu, 7 Mar 2024 12:31:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v9 1/7] automation: introduce fixed randconfig for
 RISC-V
In-Reply-To: <563cbcbf1bb4b540b858c187618969b75bd37481.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403071230420.853156@ubuntu-linux-20-04-desktop>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>  <d8e330c26394d9415a0d76b2d951bf57b0b6dd4b.1708086092.git.oleksii.kurochko@gmail.com> <563cbcbf1bb4b540b858c187618969b75bd37481.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-90541720-1709843451=:853156"
Content-ID: <alpine.DEB.2.22.394.2403071231000.853156@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-90541720-1709843451=:853156
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2403071231001.853156@ubuntu-linux-20-04-desktop>

On Thu, 7 Mar 2024, Oleksii wrote:
> Hello Doug and Stefano,
> 
> While Michal has reviewed this patch, I understand that I still need
> your Acked-by.
> 
> Could you please take a moment to review the patch?
> 
> Thanks in advance.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ~ Oleksii
> 
> On Fri, 2024-02-16 at 13:39 +0100, Oleksii Kurochko wrote:
> > This patch introduces the anchor riscv-fixed-randconfig,
> > which includes all configurations that should be disabled for
> > randconfig builds.
> > 
> > Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > The patch were introduced after discussion in a topic:
> >  
> > https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko@gmail.com
> > /
> > ---
> > Changes in V9:
> >  - add '|' symbol after EXTRA_FIXED_RANDCONFIG to make variables in
> > EXTRA_FIXED_RANDCONFIG
> >    be separated by new line.
> >  - instead of introduction of new file for riscv-fixed-randconfig,
> > introduce an anchor
> >    inside build.yaml
> > ---
> > Changes in V8:
> >  - Nothing changed. Only rebase
> > ---
> > Changes in V7:
> >  - Nothing changed. Only rebase
> > ---
> > Changes in V6:
> >  - The patch was introduced in this version of patch series.
> > ---
> >  automation/gitlab-ci/build.yaml | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-
> > ci/build.yaml
> > index 6d2cb18b88..aac29ee13a 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -512,6 +512,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
> >        CONFIG_BOOT_TIME_CPUPOOLS=y
> >  
> >  # RISC-V 64 cross-build
> > +.riscv-fixed-randconfig:
> > +  variables: &riscv-fixed-randconfig
> > +    EXTRA_FIXED_RANDCONFIG: |
> > +      CONFIG_COVERAGE=n
> > +      CONFIG_EXPERT=y
> > +      CONFIG_GRANT_TABLE=n
> > +      CONFIG_MEM_ACCESS=n
> > +
> >  archlinux-current-gcc-riscv64:
> >    extends: .gcc-riscv64-cross-build
> >    variables:
> > @@ -532,8 +540,7 @@ archlinux-current-gcc-riscv64-randconfig:
> >      CONTAINER: archlinux:current-riscv64
> >      KBUILD_DEFCONFIG: tiny64_defconfig
> >      RANDCONFIG: y
> > -    EXTRA_FIXED_RANDCONFIG:
> > -      CONFIG_COVERAGE=n
> > +    <<: *riscv-fixed-randconfig
> >  
> >  archlinux-current-gcc-riscv64-debug-randconfig:
> >    extends: .gcc-riscv64-cross-build-debug
> > @@ -541,8 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
> >      CONTAINER: archlinux:current-riscv64
> >      KBUILD_DEFCONFIG: tiny64_defconfig
> >      RANDCONFIG: y
> > -    EXTRA_FIXED_RANDCONFIG:
> > -      CONFIG_COVERAGE=n
> > +    <<: *riscv-fixed-randconfig
> >  
> >  # Power cross-build
> >  debian-bullseye-gcc-ppc64le:
> 
--8323329-90541720-1709843451=:853156--

