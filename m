Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F046F84B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 02:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243466.421199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvUUQ-0004oT-6S; Fri, 10 Dec 2021 01:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243466.421199; Fri, 10 Dec 2021 01:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvUUQ-0004mg-3N; Fri, 10 Dec 2021 01:14:22 +0000
Received: by outflank-mailman (input) for mailman id 243466;
 Fri, 10 Dec 2021 01:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiMI=Q3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mvUUO-0004ma-Co
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 01:14:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee37d01-5956-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 02:14:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2AA55CE2990;
 Fri, 10 Dec 2021 01:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0943C341C6;
 Fri, 10 Dec 2021 01:14:11 +0000 (UTC)
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
X-Inumbo-ID: 7ee37d01-5956-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639098852;
	bh=XBao+jV96uggzNgtTGEQ9TN0GRJBLJpVgy9fsKh71sk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KWkwnJqJlXfSIa+LucGujl4Xp+gGcqN2yEl2lDGgpstmkh5XDuyBzu+5fUR4pyD6s
	 wYAocSXE8lyiRQuBSXslCjVjOUlxVosFOe1b6M9cBo3QcmUnGIuq+l4Hqwb1hSGbtP
	 c1XhVxvfxQYhNuk9chA7oCoqVOqewrTElCRqMFRc2TE+3KsohcVscWSo9MmbBrJ/9U
	 XKVWeesI1hJPZJYh+Td9YJRPlC7cB2YmFFaE910FmEV7yBKWKfkBP/eTT8+hXO4Kug
	 q4Vkp67BxhAhcc0Z1aEOCXCpQFr19u9+cOQzAClVtx5Spn3H86bTPh+dwc7WBraIz6
	 5JyBVBCt1AmUA==
Date: Thu, 9 Dec 2021 17:14:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] arm/docs: Drop mentioning of ACPI for properties under
 "hypervisor" node
In-Reply-To: <1639083050-31782-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2112091714000.4091490@ubuntu-linux-20-04-desktop>
References: <1639083050-31782-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Dec 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Remove the following sentence:
> "This property is unnecessary when booting Dom0 using ACPI."
> for "reg" and "interrupts" properties as the initialization is not
> done via device-tree "hypervisor" node in that case anyway.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/misc/arm/device-tree/guest.txt | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/guest.txt b/docs/misc/arm/device-tree/guest.txt
> index c115751..2b974bb 100644
> --- a/docs/misc/arm/device-tree/guest.txt
> +++ b/docs/misc/arm/device-tree/guest.txt
> @@ -15,11 +15,9 @@ the following properties:
>    or equal to gnttab_max_grant_frames()).
>    Regions 1...N are extended regions (unused address space) for mapping foreign
>    GFNs and grants, they might be absent if there is nothing to expose.
> -  This property is unnecessary when booting Dom0 using ACPI.
>  
>  - interrupts: the interrupt used by Xen to inject event notifications.
>    A GIC node is also required.
> -  This property is unnecessary when booting Dom0 using ACPI.
>  
>  To support UEFI on Xen ARM virtual platforms, Xen populates the FDT "uefi" node
>  under /hypervisor with following parameters:
> -- 
> 2.7.4
> 

