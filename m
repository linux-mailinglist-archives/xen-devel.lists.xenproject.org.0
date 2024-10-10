Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4F998B6F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816287.1230480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv1d-0006z5-Md; Thu, 10 Oct 2024 15:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816287.1230480; Thu, 10 Oct 2024 15:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv1d-0006wo-K1; Thu, 10 Oct 2024 15:24:25 +0000
Received: by outflank-mailman (input) for mailman id 816287;
 Thu, 10 Oct 2024 15:24:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1syv1c-0006wi-DP
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:24:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syv1c-0006KA-62; Thu, 10 Oct 2024 15:24:24 +0000
Received: from [15.248.3.83] (helo=[10.45.19.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syv1b-0006nU-VH; Thu, 10 Oct 2024 15:24:24 +0000
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
	bh=TrNNKBZraghGWDIBYUvpWVPrPooiRUuXR0v/kv21YsA=; b=TIBC7W8KBzlHarWZ+YYz2OW0/K
	X8/2TtiY5VbS/5bspdu1z14W0+rRsLqZQgJMqR1T/seL1hbXkmoLOub5KEKyRrxM8Mdhw/Uu+2EIj
	J6x4UGu2mr6mgGmxc7SN6xaJ0BLp9ukj0IusJ0699hOEBYvSXlfcdhctt7RO4olLIosw=;
Message-ID: <a28ea782-5644-4320-be42-6685985834ae@xen.org>
Date: Thu, 10 Oct 2024 16:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] xen/arm: dt overlay fixes
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 04/10/2024 13:22, Michal Orzel wrote:
> This series contains fixes and improvements after doing some tests with DT
> overlay support in Xen. I split the series so that each patch handles a separate
> issue.
> 
> Michal Orzel (6):
>    dt-overlay: Fix NULL pointer dereference
>    device-tree: Remove __init from unflatten_dt_alloc()
>    dt-overlay: Remove ASSERT_UNREACHABLE from add_nodes()
>    dt-overlay: Support target-path being root node
>    dt-overlay: Ignore nodes that do not have __overlay__ as their subnode
>    dt-overlay: Print overlay I/O memory ranges in hex

This is now committed.

Cheers,

-- 
Julien Grall


