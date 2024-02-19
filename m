Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803B85ABBE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 20:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683084.1062429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8xU-0003AC-0E; Mon, 19 Feb 2024 19:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683084.1062429; Mon, 19 Feb 2024 19:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8xT-00037C-Tf; Mon, 19 Feb 2024 19:05:43 +0000
Received: by outflank-mailman (input) for mailman id 683084;
 Mon, 19 Feb 2024 19:05:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rc8xS-00036z-18
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 19:05:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8xR-0005UC-5g; Mon, 19 Feb 2024 19:05:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8xR-000857-0S; Mon, 19 Feb 2024 19:05:41 +0000
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
	bh=0KJuC9KyCWK2y5681dj3Jxyb6MB4RCF9ApnXeZ4RnfY=; b=t0WxupyH5gTW8U8Qwdbit8uvtQ
	OPWWm7DCzPZNkNektb/zn7o3KZkW+Ip3kYiLyK0GjHrIQcfprzCqsUs8LphFqDocfuaaeYCOaEeH4
	rHcsqh5ji/1QpSjNihRwXqPbhX8XIeg5kxBRL/+bZLoOqXOCGvSoY4LksDecajOzj2is=;
Message-ID: <39b68eb9-1873-4ecc-8790-25d61ef8c98f@xen.org>
Date: Mon, 19 Feb 2024 19:05:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] xen/asm-generic: introduce generic device.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <e6df4fde7de451d089ac680535f44a7206313e15.1708086092.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e6df4fde7de451d089ac680535f44a7206313e15.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 16/02/2024 12:39, Oleksii Kurochko wrote:
> Arm, PPC and RISC-V introduce the same things in asm/device.h, so
> generic device.h was introduced.
> Arm's device.h was taken as a base with the following changes:
>   - #ifdef ACPI related things.
>   - Rename #ifdef guards.
>   - Add SPDX tag.
>   - #ifdef CONFIG_HAS_DEVICE_TREE related things.
>   - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

