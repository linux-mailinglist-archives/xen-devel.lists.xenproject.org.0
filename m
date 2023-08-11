Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11182779AE6
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 00:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582706.912593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb5v-0000dw-LQ; Fri, 11 Aug 2023 22:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582706.912593; Fri, 11 Aug 2023 22:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb5v-0000b1-Ho; Fri, 11 Aug 2023 22:58:59 +0000
Received: by outflank-mailman (input) for mailman id 582706;
 Fri, 11 Aug 2023 22:58:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUb5u-0000av-9p
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 22:58:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6034469-389a-11ee-b284-6b7b168915f2;
 Sat, 12 Aug 2023 00:58:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53818678E6;
 Fri, 11 Aug 2023 22:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB22C433C9;
 Fri, 11 Aug 2023 22:58:53 +0000 (UTC)
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
X-Inumbo-ID: a6034469-389a-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691794735;
	bh=JasgnPdJcTd25O3geVYlpoWFEpIF0XO4p7lMbN6mCEc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wr/AWNKdEKZu71zbNooAjNcr020uFsi6uX1OpDo9rB92gOoVzxE5d5dr7i9gZ4SFc
	 Zyxt5m+hneu71x/UaGz3L+uzMgwakmDaYjeR+83mkJi6K0JC613tfaSyO6j99KlfBd
	 WdEmKz88PuVDWNXEuMmV+MU7cNldiiM9jUfbrbABizbtmFc8oFqkJ/sr4i2KJLDiBe
	 DPsLgAs2pa+vMFuGo/00xnXxW9T2HkHsHedl94JM6mA95uLk/thDHhOMexgKqFIoCC
	 2zhQRVDV/6CBL7yM8L1POdG42c9hxIKBcMMv5D7sGbtdwxLa7mPHOQNPJFwak3tlv7
	 NxlnbdmHCAMEA==
Date: Fri, 11 Aug 2023 15:58:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com
Subject: Re: [XEN PATCH 2/6] x86/setup: add missing headers
In-Reply-To: <c4fbf7b2a763f1b8e700e2ed36628c047231cb46.1691676251.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111557590.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <c4fbf7b2a763f1b8e700e2ed36628c047231cb46.1691676251.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> The missing headers declare variables 'xen_cpuidle' and 'use_invpcid'
> that are then defined inside the file.
> This is undesirable and also violates MISRA C:2012 Rule 8.4.
> Adding suitable "#include"s resolves the issue.
> 
> The type of the variable 'xen_cpuidle' also changes according to
> s/s8/int8_t/.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: 3eab82196b02 ("x86: PIT broadcast to fix local APIC timer stop issue for Deep C state")
> Fixes: 63dc135aeaf9 ("x86: invpcid support")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/setup.c      | 4 +++-
>  xen/include/xen/cpuidle.h | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 80ae973d64e4..2bfc1fd00f8c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -47,10 +47,12 @@
>  #include <asm/mach-generic/mach_apic.h> /* for generic_apic_probe */
>  #include <asm/setup.h>
>  #include <xen/cpu.h>
> +#include <xen/cpuidle.h>
>  #include <asm/nmi.h>
>  #include <asm/alternative.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/cpu-policy.h>
> +#include <asm/invpcid.h>
>  #include <asm/spec_ctrl.h>
>  #include <asm/guest.h>
>  #include <asm/microcode.h>
> @@ -88,7 +90,7 @@ boolean_param("noapic", skip_ioapic_setup);
>  
>  /* **** Linux config option: propagated to domain0. */
>  /* xen_cpuidle: xen control cstate. */
> -s8 __read_mostly xen_cpuidle = -1;
> +int8_t __read_mostly xen_cpuidle = -1;
>  boolean_param("cpuidle", xen_cpuidle);
>  
>  #ifndef NDEBUG
> diff --git a/xen/include/xen/cpuidle.h b/xen/include/xen/cpuidle.h
> index 521a8deb04c2..705d0c1135f0 100644
> --- a/xen/include/xen/cpuidle.h
> +++ b/xen/include/xen/cpuidle.h
> @@ -86,7 +86,7 @@ struct cpuidle_governor
>      void (*reflect)         (struct acpi_processor_power *dev);
>  };
>  
> -extern s8 xen_cpuidle;
> +extern int8_t xen_cpuidle;
>  extern struct cpuidle_governor *cpuidle_current_governor;
>  
>  bool cpuidle_using_deep_cstate(void);
> -- 
> 2.34.1
> 

