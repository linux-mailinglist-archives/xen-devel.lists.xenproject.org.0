Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C01C33705
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 01:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155947.1485287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGR2y-00007c-Uw; Wed, 05 Nov 2025 00:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155947.1485287; Wed, 05 Nov 2025 00:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGR2y-00005N-SN; Wed, 05 Nov 2025 00:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1155947;
 Wed, 05 Nov 2025 00:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8nI1=5N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vGR2x-00005G-Nh
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 00:06:43 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d796278-b9db-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 01:06:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1453641A64;
 Wed,  5 Nov 2025 00:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAF5C4CEF8;
 Wed,  5 Nov 2025 00:06:38 +0000 (UTC)
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
X-Inumbo-ID: 4d796278-b9db-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762301198;
	bh=048oJY/X5+pJPynN2mvViGRPVrdBmdl4FiN7oOb7hoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YbtboFI+88NS039bx597KP/xhPqb8dWC+zTY66xc8rl+faZVzdkfpQJmr4GiaTprH
	 dzE1KsSuCa5AiH3dhAeQ9Pwni6qaCEQ9aLYnVq9D4C0H35t4/TRkZSqmK3EBq6UFxO
	 ei7KqVc1O7G5NKzF4mL3n/FWg/T64AnArg7yRfA2t1Ob3bYenU9rqIAfSY+exBTXQg
	 M8FLMaFegy3mTigHgLQsRN5CmKSAiIyip/Ce5iJuML1v9D2bcMp0Veq075Ugc+dP39
	 BsUdL8mtSQnBD29daD3i0dJ3KmjUGybl37XtiPBPeECneKUas14cGmZ49Jxv16tqqO
	 oLA6v9wtwvr5w==
Date: Tue, 4 Nov 2025 16:06:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Community Manager <community.manager@xenproject.org>, 
    committers@xenproject.org
Subject: Re: [PATCH v2] CHANGELOG.md: Update for 4.21 release cycle
In-Reply-To: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2511041606310.495094@ubuntu-linux-20-04-desktop>
References: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Sep 2025, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

ARM side:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Chnages in v2:
> - Drop the following items:
>   - Allow to unflatten DTs.
>   - Basic kexec support to Mini-OS for running in PVH mode.
> ---
>  CHANGELOG.md | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ca1b43b940..0afd2eeb4b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>     to the baseline change.
>   - Linux based device model stubdomains are now fully supported.
> + - Remove libxenctrl usage from xenstored.
>  
>   - On x86:
>     - Restrict the cache flushing done as a result of guest physical memory map
> @@ -38,9 +39,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       and 28 (Temperature Probe).
>  
>   - On Arm:
> -    - Ability to enable stack protector
> +    - Ability to enable stack protector.
>      - GICv3.1 eSPI (Extended Shared Peripheral Interrupts) support for Xen
>        and guest domains.
> +    - SMMU handling for PCIe passthrough.
> +    - R-Car Gen4 PCI host controller support.
> +    - SCI SCMI SMC single-agent support.
> +    - Initial support for MPU, R82, and R52: reaches the early boot stages.
> +
> + - On RISC-V:
> +    - Basic UART support and external interrupts (APLIC/IMSIC only) handling
> +      for hypervisor mode.
>  
>  ### Removed
>   - On x86:
> -- 
> 2.51.0
> 
> 

