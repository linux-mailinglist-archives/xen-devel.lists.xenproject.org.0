Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6CDB25474
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 22:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080285.1440789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umHuy-0008IF-JM; Wed, 13 Aug 2025 20:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080285.1440789; Wed, 13 Aug 2025 20:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umHuy-0008Fj-GZ; Wed, 13 Aug 2025 20:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1080285;
 Wed, 13 Aug 2025 20:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZoK=2Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1umHux-0008Fd-Db
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 20:17:51 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c9093ec-7882-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 22:17:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E1E943D63;
 Wed, 13 Aug 2025 20:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52FCC4CEEB;
 Wed, 13 Aug 2025 20:17:32 +0000 (UTC)
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
X-Inumbo-ID: 8c9093ec-7882-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755116253;
	bh=2EZHjdPOoMX81pqu91+jl3ga1aNjcrGGqKXNXre3M3I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pjnKJiXVj3q5Ti1lrBDzn0jvJgp+L2tYseR/v0aT6/t4H6r+aRkrm26jxHYaRSeFg
	 KtoQYFDhjf1Hn5iOjBMmkYOgBK8cCBnQLgKa7WWKk/10bvbtfvSmNiEcLmURRcTtri
	 Kv5Z4uDm1AunU8FobaBXunE+IADY8MLJxVsfJa6X8vXH+f6PkLgvjDPVfpe/D7ZBcn
	 BkTWKik2+gmY/zYbGuCliqLO1wClJM2dQyEUQMyUT5EhXs3tCiLOJ4ZvZUGVWWR57r
	 iz95gsAnugdLC1SqNR2TV4D3aipZQLVqOTERa+dQiHGtK6uWXZT5fV6j+kru9HVu6C
	 pXGH+kuEp0JRQ==
Date: Wed, 13 Aug 2025 13:17:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/pvh: update "Host ACPI" support status
In-Reply-To: <20250813093220.76030-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2508131317190.10166@ubuntu-linux-20-04-desktop>
References: <20250813093220.76030-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-895347095-1755116253=:10166"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-895347095-1755116253=:10166
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Aug 2025, Roger Pau Monne wrote:
> For x86 PVH dom0 makes uses of the host ACPI tables, and hence the status
> of Host ACPI entry should have been updated to reflect that PVH dom0 is now
> supported, and Host ACPI support is not one of the caveats.
> 
> Fixes: ea1cb444c28c ('x86/pvh: declare PVH dom0 supported with caveats')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  SUPPORT.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6a82a9218991..109b62835f99 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -70,7 +70,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>  
>  ### Host ACPI (via Domain 0)
>  
> -    Status, x86 PV: Supported
> +    Status, x86: Supported
>      Status, ARM: Experimental
>  
>  ### Host EFI Boot
> -- 
> 2.49.0
> 
--8323329-895347095-1755116253=:10166--

