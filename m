Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18412511459
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314670.532849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeCw-0007Oo-0K; Wed, 27 Apr 2022 09:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314670.532849; Wed, 27 Apr 2022 09:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeCv-0007Mo-TO; Wed, 27 Apr 2022 09:43:37 +0000
Received: by outflank-mailman (input) for mailman id 314670;
 Wed, 27 Apr 2022 09:43:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njeCt-0007Mi-KR
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:43:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njeCt-0002Gb-0i; Wed, 27 Apr 2022 09:43:35 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njeCs-0000do-R0; Wed, 27 Apr 2022 09:43:34 +0000
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
	bh=Fo45BY6CEq22mHXoDnz15YgIr+nzRGiHzVUkPEClkuI=; b=Jasqfe18audLp/RJ+LahMYwt0Z
	PJEDWDLG6k6NwMhFKdBqy1Y6kortIdwa/ledlACpnSm0UpYXBtrZZ4Qw3EoDLxHZXVI1NBezPmFSm
	P23ihxoXFkx85L2hqDbqam8F8I56W4iQj8xSLNM+6SmUy/agdnQ+TNJcUg9Wt4qu9uvw=;
Message-ID: <d1fcbb5b-5373-ea1b-1894-50a9b065c604@xen.org>
Date: Wed, 27 Apr 2022 10:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/6] xen: add field "flags" to cover all internal
 CDF_XXX
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-4-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427092743.925563-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/04/2022 10:27, Penny Zheng wrote:
> With more and more CDF_xxx internal flags in and to save the space, this
> commit introduces a new field "flags" in struct domain to store CDF_*
> internal flags directly.
> 
> Another new CDF_xxx will be introduced in the next patch.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

