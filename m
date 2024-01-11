Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421582B7D8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666548.1037256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4DL-0005tS-Mv; Thu, 11 Jan 2024 23:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666548.1037256; Thu, 11 Jan 2024 23:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4DL-0005qD-Jn; Thu, 11 Jan 2024 23:11:55 +0000
Received: by outflank-mailman (input) for mailman id 666548;
 Thu, 11 Jan 2024 23:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifVr=IV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rO4DK-0005q7-3M
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:11:54 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6e72c3-b0d6-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 00:11:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AFA0682854A6;
 Thu, 11 Jan 2024 17:11:50 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gSFSNHir9XPA; Thu, 11 Jan 2024 17:11:50 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 214468285696;
 Thu, 11 Jan 2024 17:11:50 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OBdXmsl_N61i; Thu, 11 Jan 2024 17:11:50 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9A92D82854A6;
 Thu, 11 Jan 2024 17:11:49 -0600 (CST)
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
X-Inumbo-ID: cd6e72c3-b0d6-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 214468285696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1705014710; bh=yIJR/P1vwfACvyfGnLgWyBNzjhqLj+SbWz9TrJhpz1M=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=YNWBc2b3EGrCj8t+dsWoRU4l61kVQ9afXlaYaqGROxQxgp/ZuYqezmTbiPhsPPMKC
	 1U4QXQzMr1uc/htTUDAbT1OLkGaqYKSHlfROHVPUmukSP8U3TOHIPTd5/O2/JafeYD
	 9pytgDuGLrXQA1QPXkP3C1Mn22gcdEkU6y+Dohgg=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f0de2480-3846-45f9-9573-27da24ff076c@raptorengineering.com>
Date: Thu, 11 Jan 2024 17:11:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 12/22/23 9:13 AM, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - add SPDX
>  - drop unneeded for now p2m types.
>  - return false in all functions implemented with BUG() inside.
>  - update the commit message
> ---
> Changes in V2:
>  - Nothing changed. Only rebase.
> ---
>  xen/arch/ppc/include/asm/p2m.h   |   3 +-
>  xen/arch/riscv/include/asm/p2m.h | 102 +++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/riscv/include/asm/p2m.h
> 
> diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
> index 25ba054668..3bc05b7c05 100644
> --- a/xen/arch/ppc/include/asm/p2m.h
> +++ b/xen/arch/ppc/include/asm/p2m.h
> @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct domain *d)
>  static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
>                                                          unsigned int order)
>  {
> -    BUG_ON("unimplemented");
> -    return 1;
> +    return -EOPNOTSUPP;
>  }
>

Was this change included by mistake? I'm not sure why this patch should
touch PPC's p2m.h.

Thanks,
Shawn

