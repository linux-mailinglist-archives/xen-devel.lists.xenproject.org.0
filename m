Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE12775ABA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580962.909461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTh5D-0004yO-NS; Wed, 09 Aug 2023 11:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580962.909461; Wed, 09 Aug 2023 11:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTh5D-0004vo-KK; Wed, 09 Aug 2023 11:10:31 +0000
Received: by outflank-mailman (input) for mailman id 580962;
 Wed, 09 Aug 2023 11:10:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTh5B-0004vd-RM
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:10:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTh5B-0006AR-5F; Wed, 09 Aug 2023 11:10:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTh5A-0002zf-Tt; Wed, 09 Aug 2023 11:10:29 +0000
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
	bh=CxnjCleyFkTE+K7wEWE78iYHYZLHMNKCnrJLJ5Tn36o=; b=W+5/hgBgCrdIDZzNGR78VmLpsG
	87TNU+EUwCXQZ4Tixg7DW/+L6PRLwMaGCBqnDRIC9xVnBlS6/umMbiaUa9AkFCoBMFwbi4PzfHPIV
	Oo0SFiKHAdS/D5UfAFnQMhze1McR5BqcR/HjCC0pJjooVNmti/AQ36p+j6BCe7m3Xwuk=;
Message-ID: <deb954e3-5eb2-4764-bce5-b20585a92111@xen.org>
Date: Wed, 9 Aug 2023 12:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1691567429.git.nicola.vetrini@bugseng.com>
 <47e2c8770e38ab064cbcdfaafa8467c5e733f11d.1691567429.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <47e2c8770e38ab064cbcdfaafa8467c5e733f11d.1691567429.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 09/08/2023 08:55, Nicola Vetrini wrote:
> The variable 'msec' declared in the macro shadows the local
> variable in 'ehci_dbgp_bios_handoff', but to prevent any
> future clashes with other functions the macro is converted to
> a static inline function.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

