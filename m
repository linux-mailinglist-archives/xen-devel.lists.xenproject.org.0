Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83457725B74
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544681.850628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qGx-0005Ue-CX; Wed, 07 Jun 2023 10:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544681.850628; Wed, 07 Jun 2023 10:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qGx-0005SG-9r; Wed, 07 Jun 2023 10:20:11 +0000
Received: by outflank-mailman (input) for mailman id 544681;
 Wed, 07 Jun 2023 10:20:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6qGv-0005S0-HK
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:20:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qGu-0000BQ-U0; Wed, 07 Jun 2023 10:20:08 +0000
Received: from [15.248.2.248] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qGu-0003bS-OI; Wed, 07 Jun 2023 10:20:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=aBsd4w/ulCOyoxi6G1xdN8lfydwrXFh6SHWU1DVOGwY=; b=4AeN+jcDJKMwsgF0UePD75EeGk
	WJsAgxjL3XQd837Is4tFELLUeggZa2+RIhqfDfVSdUttt2xj8LHqI+ikpIf2VX6/Hrlu14fRONIEM
	FiakolxWJby/qDtCyECtVnfBDaKbu0DB1o5sn4rIgN5dQiWTOikqlrQme/U57Ln4MkTw=;
Message-ID: <2c1399c7-458a-61cd-fa81-945c96383210@xen.org>
Date: Wed, 7 Jun 2023 11:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1 6/8] xen/riscv: add SPDX tags
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <1034fa44a9b589a18f89b7849877c00ee0a362d5.1686080337.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1034fa44a9b589a18f89b7849877c00ee0a362d5.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 06/06/2023 20:55, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/include/asm/config.h       | 2 ++
>   xen/arch/riscv/include/asm/current.h      | 2 ++
>   xen/arch/riscv/include/asm/early_printk.h | 2 ++
>   xen/arch/riscv/include/asm/mm.h           | 2 ++
>   xen/arch/riscv/include/asm/page-bits.h    | 2 ++
>   xen/arch/riscv/include/asm/page.h         | 2 ++
>   xen/arch/riscv/include/asm/traps.h        | 2 ++
>   xen/arch/riscv/include/asm/types.h        | 2 ++
>   xen/arch/riscv/mm.c                       | 2 ++
>   xen/arch/riscv/setup.c                    | 2 ++
>   10 files changed, 20 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index 38862df0b8..3ae35f57b3 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

The default license for Xen is GPL-2.0-only. So any particular reason to 
diverge?

Cheers,

-- 
Julien Grall

