Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5F7FE07A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644169.1004854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QZU-0007LQ-GX; Wed, 29 Nov 2023 19:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644169.1004854; Wed, 29 Nov 2023 19:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QZU-0007Ge-De; Wed, 29 Nov 2023 19:50:08 +0000
Received: by outflank-mailman (input) for mailman id 644169;
 Wed, 29 Nov 2023 19:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3b2=HK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r8QZS-0007CG-Pq
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:50:06 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d016b12-8ef0-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:50:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D29FF828673D;
 Wed, 29 Nov 2023 13:50:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PVNv2y5L0G4f; Wed, 29 Nov 2023 13:50:01 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 690A68285402;
 Wed, 29 Nov 2023 13:50:01 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Xav8qrq_fcpW; Wed, 29 Nov 2023 13:50:01 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8C57F82853E2;
 Wed, 29 Nov 2023 13:50:00 -0600 (CST)
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
X-Inumbo-ID: 7d016b12-8ef0-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 690A68285402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701287401; bh=bozs7KyXajs2JF/xjROVXKvJUKexkweT747aOda4gpI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=KPnq/KuOi2xNq5YtFe53f76E/S24tQ8msnR9z9Nq7Flb3bisbqjR8q5q6sIp6M6n+
	 aNHSLv+SOjNLBvduSTU1J/lNNbPdwAegNUUxcikrBOzjwA9Vq0Ar43VO7OFd9cfImr
	 XlTO2RymKHRXteJTd6+vOjwL8tTRt/hG6/CwftUk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <2924be5a-cf1c-49ed-a69d-9fa32442ace2@raptorengineering.com>
Date: Wed, 29 Nov 2023 13:49:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <44bb374738ad0cae041a0164812dfd33d091d954.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <44bb374738ad0cae041a0164812dfd33d091d954.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/include/asm-generic/numa.h
> similarity index 76%
> rename from xen/arch/arm/include/asm/numa.h
> rename to xen/include/asm-generic/numa.h
> index e2bee2bd82..b00fca4978 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/include/asm-generic/numa.h
> @@ -1,12 +1,15 @@
> -#ifndef __ARCH_ARM_NUMA_H
> -#define __ARCH_ARM_NUMA_H
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_NUMA_H
> +#define __ASM_GENERIC_NUMA_H
>  
> -#include <xen/mm.h>
> +#include <xen/stdint.h>
>  
> -typedef u8 nodeid_t;
> +typedef uint8_t nodeid_t;
>  
>  #ifndef CONFIG_NUMA
>  
> +#include <xen/mm-frame.h>
> +
>  /* Fake one node for now. See also node_online_map. */
>  #define cpu_to_node(cpu) 0
>  #define node_to_cpumask(node)   (cpu_online_map)
> @@ -26,7 +29,8 @@ extern mfn_t first_valid_mfn;

Minor nit: in this part of the file (that wasn't included by git in this
diff), there's a comment that references Arm:

 /*
  * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
  * is required because the dummy helpers are using it.
  */
 extern mfn_t first_valid_mfn;

This should probably be changed to generic/GENERIC as you've done
elsewhere in the series.

In any case,

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

