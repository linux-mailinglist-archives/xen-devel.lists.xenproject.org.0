Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2053C17D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 02:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341343.566570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvXJ-0006bk-Pq; Fri, 03 Jun 2022 00:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341343.566570; Fri, 03 Jun 2022 00:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvXJ-0006YK-Mg; Fri, 03 Jun 2022 00:51:33 +0000
Received: by outflank-mailman (input) for mailman id 341343;
 Fri, 03 Jun 2022 00:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwvXH-0006YE-DE
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 00:51:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dd4731d-e2d7-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 02:51:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6EC960C92;
 Fri,  3 Jun 2022 00:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058E0C385A5;
 Fri,  3 Jun 2022 00:51:27 +0000 (UTC)
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
X-Inumbo-ID: 4dd4731d-e2d7-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654217488;
	bh=2Evjsba6HoIHlQIqA37xEcgouS2i8iyCI0A8MlhrQOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gd9kMrkKvvIkK3NmFSni3Uo6I0wVmArSh1ugIcGRKvipnQddpYKnvzDKYTucsogEu
	 5Vsl7FSNE7STQ/DEz3ZandxKQYCvQK5r4mNwmO7z7jB8/R/gTuWwniufjWpLC5uyQF
	 dYSLza+64oPBYSoxgVFzSEPenpKGyFwEmzk6iAKu378+5Fke7fOparBeYim++M+63i
	 UbwtIM936Jbaa1qKkiFZA0+e9nZSWbhLVEdxgGEfE7u6gYa639CV86bhMC4cwj63NL
	 KEqWxbzszx0fe37oLvlFwdx7UbGKi+UJ6/pmWDoh1dHkRIsk86dymqH8JiRTV/ZklX
	 6uwGfe6tHkhjA==
Date: Thu, 2 Jun 2022 17:51:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/4] Spectre BHB follow up
In-Reply-To: <cover.1653993431.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206021749110.2783803@ubuntu-linux-20-04-desktop>
References: <cover.1653993431.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I reviewed patches #1 and #3. Julien had already started reviewing the
other patches in details so it is probably better if he continues his
reviews on those. So I skipped them for now. Let me know if you'd like
me to review them.

On Tue, 31 May 2022, Bertrand Marquis wrote:
> Following up the handling of Spectre BHB on Arm (XSA-398), this serie
> contain several changes which were not needed in the XSA patches but
> should be done in Xen:
> - Sync sysregs and cpuinfo with latest version of Linux (5.18-rc3)
> - Add new fields inside cpufeature
> - Add sb instruction support. Some newer generations of CPU
>   (Neoverse-N2) do support the instruction so add support for it in Xen.
> - Create hidden Kconfig entries for CONFIG_ values actually used in
>   arm64 cpufeature.
> 
> Changes in v2
> - remove patch which was merged (workaround 1 when workaround 3 is done)
> - split sync with linux and update of cpufeatures
> - add patch to define kconfig entries used by arm64 cpufeature
> 
> Bertrand Marquis (4):
>   xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
>   xen/arm: Add sb instruction support
>   arm: add ISAR2, MMFR0 and MMFR1 fields in cpufeature
>   arm: Define kconfig symbols used by arm64 cpufeatures
> 
>  xen/arch/arm/Kconfig                     | 28 +++++++++
>  xen/arch/arm/arm64/cpufeature.c          | 18 +++++-
>  xen/arch/arm/cpufeature.c                | 28 +++++++++
>  xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
>  xen/arch/arm/include/asm/cpufeature.h    | 34 +++++++++--
>  xen/arch/arm/include/asm/macros.h        | 33 +++++++---
>  xen/arch/arm/setup.c                     |  3 +
>  xen/arch/arm/smpboot.c                   |  1 +
>  8 files changed, 193 insertions(+), 28 deletions(-)
> 
> -- 
> 2.25.1
> 

