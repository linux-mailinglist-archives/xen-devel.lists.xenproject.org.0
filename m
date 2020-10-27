Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6929CC21
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 23:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13123.33709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXXg7-00014a-4z; Tue, 27 Oct 2020 22:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13123.33709; Tue, 27 Oct 2020 22:42:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXXg7-00014B-1c; Tue, 27 Oct 2020 22:42:55 +0000
Received: by outflank-mailman (input) for mailman id 13123;
 Tue, 27 Oct 2020 22:42:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXXg5-000146-H3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 22:42:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c97c9b4f-c1c7-4621-b03e-5470c1b7e0f8;
 Tue, 27 Oct 2020 22:42:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACB462070E;
 Tue, 27 Oct 2020 22:42:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXXg5-000146-H3
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 22:42:53 +0000
X-Inumbo-ID: c97c9b4f-c1c7-4621-b03e-5470c1b7e0f8
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c97c9b4f-c1c7-4621-b03e-5470c1b7e0f8;
	Tue, 27 Oct 2020 22:42:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ACB462070E;
	Tue, 27 Oct 2020 22:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603838571;
	bh=DOYHKDzCBaOnpf3jMoYPK5uiy0h3DwiEWrPZhy4OGS4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IJabmM6lZap9DQGI8TB5u3T5Aj4TLOqLOnQjHthU2dNBmvjwYWyWef5koU9FS4Mrm
	 lNqTBx+gd6Vt6+jyJmfYRenBmf8/bjPIidf3aorFugoZx/DhrHF7zK72gjRt/07ZLd
	 cMvIGv7b4bKmd7wQXe8NqgDxf0eb0MoQ6DyvYDxM=
Date: Tue, 27 Oct 2020 15:42:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/3] xen/arm: use printk_once for errata warning
 prints
In-Reply-To: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2010271532200.12247@sstabellini-ThinkPad-T480s>
References: <cover.1603728729.git.bertrand.marquis@arm.com> <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Bertrand Marquis wrote:
> Replace usage of warning_add by printk_once with a **** prefix and
> suffix for errata related warnings.
> 
> This prevents the need for the assert which is not secure enough to
> protect this print against wrong usage.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/cpuerrata.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 0c63dfa779..0430069a84 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -157,7 +157,6 @@ extern char __smccc_workaround_1_smc_start[], __smccc_workaround_1_smc_end[];
>  static int enable_smccc_arch_workaround_1(void *data)
>  {
>      struct arm_smccc_res res;
> -    static bool warned = false;
>      const struct arm_cpu_capabilities *entry = data;
>  
>      /*
> @@ -182,13 +181,8 @@ static int enable_smccc_arch_workaround_1(void *data)
>                                       "call ARM_SMCCC_ARCH_WORKAROUND_1");
>  
>  warn:
> -    if ( !warned )
> -    {
> -        ASSERT(system_state < SYS_STATE_active);
> -        warning_add("No support for ARM_SMCCC_ARCH_WORKAROUND_1.\n"
> -                    "Please update your firmware.\n");
> -        warned = true;
> -    }
> +    printk_once("**** No support for ARM_SMCCC_ARCH_WORKAROUND_1. ****\n"
> +                "**** Please update your firmware.                ****\n");
>  
>      return 0;
>  }
> -- 
> 2.17.1
> 

