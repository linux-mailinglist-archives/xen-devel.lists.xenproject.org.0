Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC27B9D3E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 15:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613000.953237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoOBV-0001aD-6q; Thu, 05 Oct 2023 13:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613000.953237; Thu, 05 Oct 2023 13:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoOBV-0001Xo-2v; Thu, 05 Oct 2023 13:14:33 +0000
Received: by outflank-mailman (input) for mailman id 613000;
 Thu, 05 Oct 2023 13:14:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoOBU-0001WQ-7L
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 13:14:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoOBT-0004v2-CB; Thu, 05 Oct 2023 13:14:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoOBT-0004py-78; Thu, 05 Oct 2023 13:14:31 +0000
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
	bh=0NUDjTMUIUw9t/FQGYX2pQ+4MbibLpRsLQcfg/dCTok=; b=x8FqhLv447boKeeCL1VArxJj0c
	pviFI8R2d3zktgTS05APPhaSsD4PDUJHmon9P8ewS2znzOPBm0pUv6gOKLEZv7GbvJxW6vDK+gvdz
	FHRnv8FIiulaLiZROt+zprI2gloG9vCT810NxOz9cacHcABSY3/tIY5YwhBAPUNVEY9E=;
Message-ID: <36603672-b371-46ef-be1e-ab67278f6fe3@xen.org>
Date: Thu, 5 Oct 2023 14:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] MAINTAINERS: Make Bob Eschleman a reviewer
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Bob Eshleman <bobby.eshleman@gmail.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231005090727.19235-1-george.dunlap@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231005090727.19235-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi George,

On 05/10/2023 10:07, George Dunlap wrote:
> Following a conversation with Bob Eschleman, it was agreed that
> Bobby would prefer to return to being a Reviewer.

Ideally, we would want Bobby confirm on the ML (this could be a simpler 
Acked-by). In any case...

> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

... if you need an ack from another committers:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

