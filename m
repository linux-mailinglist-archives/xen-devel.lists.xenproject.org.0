Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9D7F1D2B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 20:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637160.992931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59gy-0003kE-8q; Mon, 20 Nov 2023 19:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637160.992931; Mon, 20 Nov 2023 19:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59gy-0003i6-5u; Mon, 20 Nov 2023 19:12:20 +0000
Received: by outflank-mailman (input) for mailman id 637160;
 Mon, 20 Nov 2023 19:12:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r59gx-0003i0-0B
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 19:12:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59gw-0005iv-Ml; Mon, 20 Nov 2023 19:12:18 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59gw-0001Hy-GG; Mon, 20 Nov 2023 19:12:18 +0000
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
	bh=NMufjo4w6Ul+jouV0ie2O+WYaWCcaQYxyGJE7LuRQ4I=; b=ONSMl/P2q8WtbLxXUgK7Z4WC/Z
	6/ihg1NtejXmqOk7FenD4HDf+1cwZAZJjwTR18CHTCafLSTu7cGt6SPU3WiqWQibPtYzRfohlkOdE
	D7CX9l6nJRfLQrnb/aUc8NaoLQad1UDyPT0hFXXnMvMJi3U6eH69e3MOUMdQzNFQCQig=;
Message-ID: <d02e4c53-cc0d-49eb-8c2a-a88b4ead6fb5@xen.org>
Date: Mon, 20 Nov 2023 19:12:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 0/2] xen/arm: Split MMU code as the prepration of MPU
 work form Arm32
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 jgrall@amazon.com, henry.wang@arm.com
References: <20231120144859.170965-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231120144859.170965-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2023 14:48, Ayan Kumar Halder wrote:
> Hi,

Hi Ayan,


> These are the set of patches based on top of
> "[PATCH v9 0/8] xen/arm: Split MMU code as the prepration of MPU work".
> This is the preparation work to add MPU support on Arm32.
> 
> Changes from :-
> 
> v1 - Dropped "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
> and "[XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU".
> 
> v2 - Changes mentioned in individual patches.
> 
> v3 - Changes mentioned in individual patches.
> 
> v4 - Changes mentioned in individual patches.
> 
> Ayan Kumar Halder (2):
>    xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
>    xen/arm32: head Split and move MMU-specific head.S to mmu/head.S

This is now committed. Thanks for the work.

Cheers,

-- 
Julien Grall

