Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA577E1D8F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 10:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627859.978718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwIr-0008Uv-CG; Mon, 06 Nov 2023 09:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627859.978718; Mon, 06 Nov 2023 09:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwIr-0008Ry-8o; Mon, 06 Nov 2023 09:53:53 +0000
Received: by outflank-mailman (input) for mailman id 627859;
 Mon, 06 Nov 2023 09:53:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qzwIp-0008QY-Cy
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 09:53:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzwIp-00053Z-5l; Mon, 06 Nov 2023 09:53:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzwIp-0004nH-0H; Mon, 06 Nov 2023 09:53:51 +0000
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
	bh=cJATdYo+iijO7qEBgIriC1BaUUK41CidpnXU//mwrvY=; b=1Qwc9ygAHDswsH6J6P/IX0ujX1
	eI8dRDKYGXAKgJMFtV+J6igrceKGb3HjyFRhWQhBz0pM1lBHT0DqmRXqcomXNg9Da1qnFCMkz62Kh
	gYpM4BNn7BnrXJw5HThobU+8CeNDguKeudVRCzxsz6N+4wmPYzbNK0naX8u/lgU4MHqI=;
Message-ID: <db7a52da-3a91-4c2b-87b3-d730b3f8016b@xen.org>
Date: Mon, 6 Nov 2023 09:53:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] xen/arm: Split MMU code as the prepration of MPU
 work form Arm32
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@arm.com,
 henry.wang@arm.com, Volodymyr_Babchuk@epam.com
References: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2023 17:34, Ayan Kumar Halder wrote:
> Hi,

Hi Ayan,

> These are the set of patches based on top of
> "[PATCH v8 0/8] xen/arm: Split MMU code as the prepration of MPU work".
> This is the preparation work to add MPU support on Arm32.
> 
> There are two more dependencies for this series :-
> 
> 1. "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
> is merged into "[PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S"
> as per the discussion on [1].
> 
> 2. "[XEN v4] xen/arm32: head: Replace load_paddr with adr_l when they are equivalent"
> 
> Julien, I see that you have submitted "[PATCH 0/2] xen/arm32: Improve logging during early boot" [2].
> Let me know if you want to reorder this series or base your series on top of mine.

I will rebase my patches on top of yours.

Cheers.

-- 
Julien Grall

