Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD8738B1F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552971.863251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0gZ-0004RL-IU; Wed, 21 Jun 2023 16:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552971.863251; Wed, 21 Jun 2023 16:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0gZ-0004Pg-FK; Wed, 21 Jun 2023 16:27:59 +0000
Received: by outflank-mailman (input) for mailman id 552971;
 Wed, 21 Jun 2023 16:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5qy=CJ=kernel.org=luto@srs-se1.protection.inumbo.net>)
 id 1qC0gX-0004Ox-Vt
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:27:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92cae43a-1050-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:27:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAC15615E8;
 Wed, 21 Jun 2023 16:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20E0C433C0;
 Wed, 21 Jun 2023 16:27:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailauth.nyi.internal (Postfix) with ESMTP id AB7BC27C005B;
 Wed, 21 Jun 2023 12:27:51 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Wed, 21 Jun 2023 12:27:51 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 43C5C31A0063; Wed, 21 Jun 2023 12:27:51 -0400 (EDT)
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
X-Inumbo-ID: 92cae43a-1050-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687364873;
	bh=LwsnqI9P+WpJ5PCzUBSCELK7UQa5GydFt4q1g7NlhXY=;
	h=In-Reply-To:References:Date:From:To:Subject:From;
	b=TsGJuS6FJ9lBZ2bAEIJIH9bh5QPAKywM/HhWIInNQNbwKdv1URR5W6yZFFzrX0TAw
	 WWK9X2QZdgb8jyao7Sgj68HfxqrxctEDgMLJ5UWznYsgDhbO1yxBcxw+yUY9J+Xq8y
	 3WXsCWicp9FVVFkU0NGYa9Bo895XRAs/ix6tG7mCr2HWIyfaHscDhbza7JX5ZMS/kU
	 g5NVhFnbM9RWCEnp4MAepOcpW/q+c9c6Mpa//hrOrrADpj2R/ykUR7j+dam4wx+ZxM
	 L1AqnNy806+GNKTdu30liB1VyTAS5s9mptcXmLxL7pS20BRj/1YcVoVuwopk5zrmzd
	 BoElvjqT6ZZDA==
X-ME-Sender: <xms:ByWTZEK_YBa8I2yeFLHYdjQoh4GOvlr97_oYeuLufU58qRWMgwQ8yQ>
    <xme:ByWTZELX1EcYlX-57AG2IP2oqFOpKR0Fely_PKq6URqNsuai24rVHDrmTIL_2tjm7
    81vq0lTQaSsT5kU8gc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefledgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    hicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedthfehtedtvdetvdetudfgueeuhfdtudegvdelveelfedvteelfffg
    fedvkeegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeeh
    ieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugi
    drlhhuthhordhush
X-ME-Proxy: <xmx:ByWTZEtLPXPM9U57U9RFyCeKbN9MYbaVqMBJuk5vDxPIpVHa3nQJ1w>
    <xmx:ByWTZBbdxdo-19m-hlIkBLRAbIZTC78-jg7iLxDHF2Acdf2bTjF9Fg>
    <xmx:ByWTZLaqbAuiEvD6KaUsRgviYJtWue-6YWQKmOxB9Hw_ZUw8zCDaDw>
    <xmx:ByWTZFlvBKNb2MvShC6H7caNYCA0W_FwuBbm0Q8_6q0fU1Nxxd8Kpw>
Feedback-ID: ieff94742:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <7fbad052-4c4a-4a49-913d-ea836c180dc2@app.fastmail.com>
In-Reply-To: <20230621151442.2152425-1-per.bilse@citrix.com>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
Date: Wed, 21 Jun 2023 09:27:31 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Per Bilse" <per.bilse@citrix.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Updates to Xen hypercall preemption
Content-Type: text/plain

On Wed, Jun 21, 2023, at 8:14 AM, Per Bilse wrote:
> Some Xen hypercalls issued by dom0 guests may run for many 10s of
> seconds, potentially causing watchdog timeouts and other problems.
> It's rare for this to happen, but it does in extreme circumstances,
> for instance when shutting down VMs with very large memory allocations
> (> 0.5 - 1TB).  These hypercalls are preemptible, but the fixes in the
> kernel to ensure preemption have fallen into a state of disrepair, and
> are currently ineffective.  This patch brings things up to date by way of:
>
> 1) Update general feature selection from XEN_PV to XEN_DOM0.
> The issue is unique to dom0 Xen guests, but isn't unique to PV dom0s,
> and will occur in future PVH dom0s.  XEN_DOM0 depends on either PV or PVH,
> as well as the appropriate details for dom0.
>
> 2) Update specific feature selection from !PREEMPTION to !PREEMPT.
> The following table shows the relationship between different preemption
> features and their indicators/selectors (Y = "=Y", N = "is not set",
> . = absent):
>
>                             | np-s | np-d | vp-s | vp-d | fp-s | fp-d
>     CONFIG_PREEMPT_DYNAMIC      N      Y      N      Y      N      Y
>          CONFIG_PREEMPTION      .      Y      .      Y      Y      Y
>             CONFIG_PREEMPT      N      N      N      N      Y      Y
>   CONFIG_PREEMPT_VOLUNTARY      N      N      Y      Y      N      N
>        CONFIG_PREEMPT_NONE      Y      Y      N      N      N      N
>
> Unless PREEMPT is set, we need to enable the fixes.

This code is a horrible mess, with and without your patches.  I think that, if this were new, there's no way it would make it in to the kernel.

I propose one of two rather radical changes:

1. (preferred) Just delete all of it and make support for dom0 require either full or dynamic preempt, and make a dynamic preempt kernel booting as dom0 run as full preempt.

2. Forget about trying to preempt a hypercall in the sense of scheduling from an interrupt.  Instead teach the interrupt code to detect that it's in a preemptible hypercall and change RIP to a landing pad that does a cond_resched() and then resumes the hypercall.

I don't think the entry code should have a whole special preempt implementation just for this nasty special case.

--Andy

