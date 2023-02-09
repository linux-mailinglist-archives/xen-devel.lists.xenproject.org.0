Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5475690C2E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492544.762140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8GD-0007IK-T0; Thu, 09 Feb 2023 14:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492544.762140; Thu, 09 Feb 2023 14:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8GD-0007Fp-PZ; Thu, 09 Feb 2023 14:50:53 +0000
Received: by outflank-mailman (input) for mailman id 492544;
 Thu, 09 Feb 2023 14:50:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ8GC-0007Fg-Vr
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:50:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ8GC-0007LC-Km; Thu, 09 Feb 2023 14:50:52 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ8GC-0006Ly-Dk; Thu, 09 Feb 2023 14:50:52 +0000
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
	bh=tSfnllD+Zrre9jYvjDVVI4NYSAgVHLcBv4njeELtNfo=; b=HYpbofla7BQWPCmYytcz8DO+xE
	qiq9rnVtGUdEHg5e/W+YSmGjm93Lnpe3YqXl6qGcKW71IayfrVkkEgdoprikx1LfFBFjkFnl8q6kr
	Py2xSIMlv6aOtM+2c46Bm69ot0UYai6MROcowL0OrRGF5hbA+/T0wwq/EkgJvg4IO8QY=;
Message-ID: <9dbd5118-7cb1-37f0-6e50-e861b225d7ef@xen.org>
Date: Thu, 9 Feb 2023 14:50:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230209144148.4132-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230209144148.4132-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 09/02/2023 14:41, Juergen Gross wrote:
> In docs/misc/xenstore.txt the description of the Xenstore node access
> permissions is missing one important aspect, which can be found only
> in the code or in the wiki [1]:
> 
> The first permission entry is defining the owner of the node via the
> domid, and the access rights for all domains NOT having a dedicated
> permission entry.
> 
> Make that aspect clear in the official documentation.

Thanks for the commit. I am not very thrilled with the current behavior 
but at least it is now clearly documented in xenstore.txt. So:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

